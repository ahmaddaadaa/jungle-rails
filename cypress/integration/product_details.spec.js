describe('Product Details Page Navigation', () => {
  it('should navigate from home page to product detail page', () => {
    // Visit the home page
    cy.visit('http://localhost:3000/'); 
    
    // Find the product card's link and click on it
    cy.get('article a').first().click(); 
    cy.url().should('include', '/products/');

  });
});
