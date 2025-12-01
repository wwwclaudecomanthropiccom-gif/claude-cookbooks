#!/usr/bin/env python3
"""Fetch and display a random joke from the Official Joke API."""

import json
import sys
import urllib.error
import urllib.request

JOKE_API_URL = "https://official-joke-api.appspot.com/random_joke"


def fetch_joke() -> dict:
    """Fetch a random joke from the Official Joke API.

    Returns:
        dict: A dictionary containing 'setup' and 'punchline' keys.

    Raises:
        urllib.error.URLError: If there's a network issue.
        json.JSONDecodeError: If the response is not valid JSON.
    """
    # URL is a hardcoded constant, scheme is safe
    with urllib.request.urlopen(JOKE_API_URL, timeout=10) as response:  # noqa: S310
        data = response.read().decode("utf-8")
        return json.loads(data)


def main():
    """Fetch and print a random joke."""
    try:
        joke = fetch_joke()
        print(f"Setup: {joke['setup']}")
        print(f"Punchline: {joke['punchline']}")
    except urllib.error.URLError as e:
        print(f"Error: Failed to fetch joke due to network issue: {e}", file=sys.stderr)
        sys.exit(1)
    except json.JSONDecodeError as e:
        print(f"Error: Failed to parse joke response: {e}", file=sys.stderr)
        sys.exit(1)
    except KeyError as e:
        print(f"Error: Unexpected response format, missing key: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
