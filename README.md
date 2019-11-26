#The Odin Project

##Ruby - Data Structures - Linked Lists 

A Ruby implementation of Linked Lists.

- Node.new(value) instantiates a new node with given value.

- LinkedList.new instanitiates a new linked list.

- Available LinkedList methods:
  - append(node): Adds Node to linked list.
  - prepend(node): Adds node to beginning of linked list.
  - size: Returns current size of linked list.
  - head: Returns first node in list.
  - tail: Returns last node in list.
  - pop: Removes last node from list.
  - contains?(value): Returns true or false depending on whether value is present within linked list.
  - find(value): Returns index of Node in list from value. Nil if node is not present within the list.
  - to_s: returns string representation of linked list.
  - insert_at(index, node): Inserts Node at given index within list. At the front of the list if index is < 1 or at the end if index is > list size.
  - remove_at(index): Removes node at given index within list. Removes the first node if index is < 1 or removes last node if given index is > list size.

  