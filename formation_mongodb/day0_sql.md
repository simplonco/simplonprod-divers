# Theory

## Relational Algebra

## Tuple relational calculus

## Schema Design

https://en.wikipedia.org/wiki/Database_normalization


## Data types

=== Data types ===

Each column in an SQL table declares the type(s) that column may contain. ANSI SQL includes the following data types.<ref name="SQL1992" />

; Character strings
* <code>CHARACTER(<var>n</var>)</code> or <code>CHAR(<var>n</var>)</code>: fixed-width <var>n</var>-character string, padded with spaces as needed
* <code>CHARACTER VARYING(<var>n</var>)</code> or <code>VARCHAR(<var>n</var>)</code>: variable-width string with a maximum size of <var>n</var> characters
* <code>NATIONAL CHARACTER(<var>n</var>)</code> or <code>NCHAR(<var>n</var>)</code>: fixed width string supporting an international character set
* <code>NATIONAL CHARACTER VARYING(<var>n</var>)</code> or <code>NVARCHAR(<var>n</var>)</code>: variable-width <code>NCHAR</code> string
; Bit strings
* <code>BIT(<var>n</var>)</code>: an array of <var>n</var> bits
* <code>BIT VARYING(<var>n</var>)</code>: an array of up to <var>n</var> bits
; Numbers
* <code>INTEGER</code>, <code>SMALLINT</code> and <code>BIGINT</code>
* <code>FLOAT</code>, <code>REAL</code> and <code>DOUBLE PRECISION</code>
* <code>NUMERIC(<var>precision</var>, <var>scale</var>)</code> or <code>DECIMAL(<var>precision</var>, <var>scale</var>)</code>

For example, the number 123.45 has a precision of 5 and a scale of 2. The <var>precision</var> is a positive integer that determines the number of significant digits in a particular radix (binary or decimal). The <var>scale</var> is a non-negative integer. A scale of 0 indicates that the number is an integer. For a decimal number with scale S, the exact numeric value is the integer value of the significant digits divided by 10<sup>S</sup>.

SQL provides a function to round numerics or dates, called <code>TRUNC</code> (in Informix, DB2, PostgreSQL, Oracle and MySQL) or <code>ROUND</code> (in Informix, SQLite, Sybase, Oracle, PostgreSQL and Microsoft SQL Server)<ref name="Jones 127" />

; Temporal (date/time)
* <code>DATE</code>: for date values (e.g. <code>2011-05-03</code>)
* <code>TIME</code>: for time values (e.g. <code>15:51:36</code>). The granularity of the time value is usually a ''tick'' (100 nanoseconds).
* <code>TIME WITH TIME ZONE</code> or <code>TIMETZ</code>: the same as <code>TIME</code>, but including details about the time zone in question.
* <code>TIMESTAMP</code>: This is a <code>DATE</code> and a <code>TIME</code> put together in one variable (e.g. <code>2011-05-03 15:51:36</code>).
* <code>TIMESTAMP WITH TIME ZONE</code> or <code>TIMESTAMPTZ</code>: the same as <code>TIMESTAMP</code>, but including details about the time zone in question.

SQL provides several functions for generating a date / time variable out of a date / time string (<code>TO_DATE</code>, <code>TO_TIME</code>, <code>TO_TIMESTAMP</code>), as well as for extracting the respective members (seconds, for instance) of such variables. The current system date / time of the database server can be called by using functions like <code>NOW</code>.
The [[IBM Informix]] implementation provides the <code>EXTEND</code> and the <code>FRACTION</code> functions to increase the accuracy of time, for systems requiring sub-second precision.<ref name="sqlr150" />



## Languages

### Data Definition Language 

CREATE

ALTER

DROP

### Data Manipulation Language

INSERT

UPDATE

DELETE

### Data Control Language

GRANT

REVOKE

# links

https://en.wikipedia.org/wiki/SQL
https://en.wikipedia.org/wiki/Relational_algebra
https://en.wikipedia.org/wiki/Tuple_relational_calculus


# books


# examples


# software
