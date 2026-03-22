## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for searching through 500-page legal contracts using natural language questions. Keyword search relies on exact word matching, which fails when the query uses different wording than the document. For example, a lawyer may ask “What are the termination clauses?”, but the contract might use phrases like “conditions for ending the agreement.” In such cases, keyword search may miss relevant sections due to lack of semantic understanding.

A vector database addresses this limitation by using embeddings to capture the meaning of text rather than just keywords. Each section of the contract can be converted into a vector representation using models like sentence-transformers. When a user asks a question, it is also converted into a vector, and similarity search (such as cosine similarity) is used to find the most relevant sections based on meaning.

This enables semantic search, where results are based on context and intent rather than exact wording. It improves accuracy, reduces missed information, and allows lawyers to interact with large documents more efficiently using natural language.

In this system, the vector database would store embeddings of contract sections and enable fast similarity-based retrieval. It plays a critical role in powering intelligent search, making it far more effective than traditional keyword-based approaches for complex legal documents.
