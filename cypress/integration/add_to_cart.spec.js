describe('Checking cart size', () => {
  it('should be empty', () => {
    // Visit the page
    cy.visit('http://localhost:3000/');

    // Get the cart size element and its text
    cy.get('.nav-link').contains('My Cart').invoke('text').then(cartText => {
      // Extract the number from the cart text (assuming the format is like "My Cart (X)")
      const cartSize = Number(cartText.match(/\d+/)[0]);

      // Assert that the cart size is 0
      expect(cartSize).to.equal(0);
    });
  });
});
