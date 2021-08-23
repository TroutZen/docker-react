import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/testing 12345/i);
  expect(linkElement).toBeInTheDocument();
});
