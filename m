From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Tue, 30 Sep 2008 08:55:37 -0600
Message-ID: <20080930145537.GJ18313@secretlab.ca>
References: <1222460748-20127-1-git-send-email-jdl@jdl.com>
	<1222460748-20127-2-git-send-email-jdl@jdl.com>
	<1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-4-git-send-email-jdl@jdl.com>
	<1222460748-20127-5-git-send-email-jdl@jdl.com>
	<1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1222460748-20127-9-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 26, 2008 at 03:25:47PM -0500, Jon Loeliger wrote:
> From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  Documentation/manual.txt |  500 ++++++++++++++++++++++++++++++++++++++++++----
>  1 files changed, 463 insertions(+), 37 deletions(-)

Hey Jon,

I don't yet have fully formed thoughts about this stuff so I've held off
on making comments.  But FWIW, here are my initial thoughts.

I'm not convinced about the approach of interleaving the executable and
data syntaxes.  The whole design of the existing syntax is to represent
the data structure.  Adding additional syntax to define executable
elements doesn't feel right to me.  I think many people will find the
resulting file structure to be confusing.

I'm also not convinced that it is a good idea to implement a new
interpreted language.  Any new language is a new thing that needs to be
maintained and a new thing for users to learn.  I'd prefer to make use
of an existing language with a library of support routines for
maintaining an internal representation of the data and building up a
device tree programmatically with the ability to import and manipulate
'stock' nodes for existing parts.  However, I haven't spent enough brain
cell cycles on this to make any recommendations on a specific language
or to figure out if that will just result in even more complexity for
users.

As I said, these are just initial thoughts.  My opinion could be swayed.

g.

> 
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index b957662..ac56309 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -105,13 +105,21 @@ Options:
>      -q
>  	Quiet: -q suppress warnings, -qq errors, -qqq all
>  
> +    -D <id>
> +    -D <id>=<value>
> +	Introduce a constant definition for symbol <id> with
> +	possible initial value given by <value>.  The RHS
> +	should be a literal number or string value.
> +
> +    -p <padsize>
> +	Add at least <padsize> additional space to the DTB image.
> +
>      -R <number>
>  	Make space for <number> reserve map entries
>  	Relevant for dtb and asm output only.
>  
>      -S <bytes>
> -	Ensure the blob at least <bytes> long, adding additional
> -	space if needed.
> +	Deprecated option.
>  
>      -v
>  	Print DTC version and exit.
> @@ -131,47 +139,338 @@ Additionally, dtc performs various sanity checks on the tree.
>  
>  4) Device Tree Source file
>  
> -4.1) Overview
>  
> -Here is a very rough overview of the layout of a DTS source file:
> +4.1) DTS Lexical Components
> +
> +Property and node names		[a-zA-Z0-9,._+*#?@-]+
> +Identifiers			\\[a-zA-Z_][a-zA-Z0-9_]*
> +Labels				[a-zA-Z_][a-zA-Z0-9_]*
> +Strings				<C-style-double-quoted-strings>
> +Comments			Both /* ... */ and // style are supported
> +Numeric literals		<C-style-integer-numbers>
> +Bytes				[0-9a-fA-F][0-9a-fA-F]
> +
> +Keywords:
> +	else
> +	for
> +	if
> +	in
> +	return
> +	void
> +	/const/
> +	/define/
> +	/incbin/
> +
> +C-style expression operators:
> +	<<
> +	>>
> +	<=
> +	>=
> +	==
> +	!=
> +	&&
> +	||
> +	+
> +	-
> +	*
> +	/
> +	%
> +
> +Additional tokens:
> +	..
> +	:=
> +	{
> +	}
> +	,
> +	&
> +
> +
> +These constructs are handled and eliminated purely at the
> +lexical level and do not appear in the grammar proper:
> +
> +    - Source files included using the syntax:
> +
> +        /include/ "filename"
> +
> +    - Both classic C style and C++ style comments are supported.
> +      Comments don't nest.
> +      For example, given:
> +
> +	1    /*
> +	2     *  asdasdasd  // asdasdad
> +	3     //   */
> +	4    asasd
> +	5     */
> +      The // comment on line 3 is not effective and is ignored.
> +      The original /* comment ends on line 3.  Line 5 is in error.
> +
> +      And given:
> +
> +	1    // /*
> +	2     *  asdasdasd  // asdasdad
> +	3     */
> +
> +      The // comment on line 1 hides the opening /*.
> +      Line 2 is in error.
> +
> +
> +4.2) DTS Grammar
> +
> +Here is a very rough overview of the grammar of a DTS source file:
> +
> +
> +    sourcefile:
> +		'/dts-v1/' ';' possibly_empty_list_of_declarations devicetree
> +
> +    declaration:
> +		  memreserve
> +		| constdef
> +		| funcdef
> +
> +    memreserve:	label '/memreserve/' addr addr ';'
> +
> +    constdef:	'/const/' identifier '=' expr ';'
> +
> +    funcdef:	'/define/' propnodename paramdecls statement_block
> +
> +    paramdecls:	'(' possibly_empty_paramdecl_list ')'
> +
> +    paramdecl: identifier
> +
> +    devicetree:   '/' statement_block
> +
> +    statement_block: '{' possibly_empty_list_of_statements '}'
> +
> +    statement:
> +		  subnode
> +		| for_statement
> +		| if_statement
> +		| return_statement
> +		| assign_statement
> +		| property_definition
> +		| statement_block
> +		| ';'
> +
> +    subnode:
> +		  node_label expr statement_block ';'
> +		|      label expr statement_block ';'
> +		|            expr statement_block ';'
> +
> +    for_statement:
> +		'for' identifier 'in' expr '..' expr statement_block
> +
> +    if_statement:
> +		  'if' '(' expr ')' statement_block
> +		| 'if' '(' expr ')' statement_block 'else' statement_block
> +
> +    return_statement: 'return' expr ';'
> +
> +    assign_statement: identifier ':=' expr ';'
> +
> +    property_definition:
> +		  optional_label expr ';'
> +		| optional_label expr '=' list_of_property_data_and_labels ';'
>  
> +    list_of_property_data_and_labels:
> +		  STRING
> +		| '<' possibly_empty_list_of_cell_values_and_labels '>'
> +		| '[' possibly_empty_list_of_byte_values_and_labels ']'
> +		| label
> +		| '/incbin/' '(' expr ')'
> +		| '/incbin/' '(' expr ',' expr ',' expr ')'
>  
> -    sourcefile:   list_of_memreserve devicetree
> +    cell_value:
> +		  expr_primary
> +		| '&' '(' expr ')'
> +		| '&' phandle_reference
> +		| label
>  
> -    memreserve:   label 'memreserve' ADDR ADDR ';'
> -		| label 'memreserve' ADDR '-' ADDR ';'
>  
> -    devicetree:   '/' nodedef
> +    expr:
> +          expr_primary
> +	| expr '?' expr ':' expr
> +	| expr expr_oper expr
>  
> -    nodedef:      '{' list_of_property list_of_subnode '}' ';'
> +    expr_oper:
> +	||
> +        &&
> +	|
> +	^
> +	&
> +	==
> +	< | > | <= | >=
> +	<< | >>
> +	+ | -
> +	* | / | %
> +	- | ~ | !
> +        '(' ')' | '(' non_empty_list_of_param_exprs ')'
>  
> -    property:     label PROPNAME '=' propdata ';'
> +    expr_primary:
> +	  literal
> +	| string
> +	| propnodename
> +	| identifier
> +	| '(' expr ')'
>  
> -    propdata:     STRING
> -		| '<' list_of_cells '>'
> -		| '[' list_of_bytes ']'
> +    addr:	expr
>  
> -    subnode:      label nodename nodedef
> +    node_label:	expr ':'
>  
> -That structure forms a hierarchical layout of nodes and properties
> -rooted at an initial node as:
> +    propnodename: <1275-property-name>
> +
> +    identifier:	'\'-<C style name>
> +
> +    literal:	<C style number>
> +    byte:	<exactly two hex digits>
> +    string:	<C style string>
> +    label:	'&'-<label name>-':'
> +
> +
> +4.2) Overview
> +
> +The DTS source file begins with the '/dts-v1/' token to state
> +that it is using "Version 1" style source files.
> +
> +Any declarations are executed in order, and can use the
> +effects of earlier declarations.
> +
> +All declarations must precede the required root node definition,
> +which is introduced with the '/'-named node:
>  
>      / {
> +	...
>      }
>  
> -Both classic C style and C++ style comments are supported.
> +The statement-block structure forms a hierarchical layout of nodes
> +and properties along with some control-statements that allow for
> +repeated and alternate statement blocks.
> +
> +
> +4.3) Declarations
> +
> +An arbitrary list of declarations can be made between '/dts-v1/'
> +and the beginning of the root node.  These declarations are
> +introduced in order.
> +
> +
> +4.3.1) Memory Reservations
> +
> +A memory reservation is a declaration that a block of memory
> +from the first address expression, with a size given by the
> +second address expression, is to be "reserved" and not used
> +by the kernel.  These address ranges are passed through to
> +the DTB to the kernel.
> +
> +
> +4.3.2) Function Definitions
> +
> +A function definition can be introduced using /define/.
> +These definitions are just "stored" and then later invoked as
> +either a subroutine in a statement context, or as a function
> +with a return value in an expression context.
>  
> -Source files may be directly included using the syntax:
> +Functions declare the number of formal parameters which will
> +be passed in at the call site, and must match one-to-one.
>  
> -    /include/ "filename"
> +Any property definitions generated by the function are emitted
> +into the caller's context at the point of the call.
>  
> +Any node definitions generated by the function are emitted
> +into the caller's context at the point of the call.
>  
> -4.2) Properties
>  
> -Properties are named, possibly labeled, values.  Each value
> -is one of:
> +4.3.3) Constant Definitions
>  
> -    - A null-teminated C-like string,
> +Constant definitions introduce a named identifier into the outer-most
> +symbol scope.  The constants can not be changed by later assignment
> +statements, though they can be hidden.  (Be careful.)
> +
> +Constants may be expressions yielding constant numeric or strings
> +values.  It is an error for them not to be evaluatable at their
> +point of definition.
> +
> +Constant definitions may also be introduced from the command line
> +using the '-D var=value" options.  They will be placed into the
> +same outer-most scope.  Constant definitions from the command line
> +override the definitions within the source file, but with a warning.
> +
> +
> +4.4) Statements
> +
> +A statement block is simply a list of sequentially executed
> +statements introduced with a required opening brace and terminated
> +with a required closing brace.
> +
> +4.4.1) Subnodes
> +
> +Node may contain sub-nodes to obtain a hierarchical structure.
> +
> +For example:
> +
> +    - A child node named "childnode" whose unit name is
> +      "childnode at address".  It it turn has a string property
> +      called "childprop".
> +
> +	childnode@address {
> +	    childprop = "hello\n";
> +	};
> +
> +
> +4.4.2) 'for' Statement
> +
> +The 'for' statement provides iterative execution of a
> +block of statements.
> +
> +The lower bound of the range is evaluated once, and the
> +upper bound is evaluated once.
> +
> +A new scope that contains the loop variable is created
> +and pushed onto the symbol table scope stack.  The loop
> +variable is initialized with the lower bound value.
> +
> +The statement block is executed once for each inclusive value
> +in the given range in increasing order.
> +
> +After the loop terminates, the loop variable scope is popped.
> +
> +
> +4.4.3) 'if' Statement
> +
> +The 'if' statement provides alternate execution flow paths.
> +The expression is evaluated once, and if non-zero, the fist
> +statement block is executed, otherwise the 'else' block of
> +statements is executed if present.
> +
> +
> +4.4.4) 'return' Statement
> +
> +Inside a function definition, the 'return' statement allows
> +a value to be passed back to the caller.  The return expression
> +is evaluated once, in the context of the function's scope,
> +and its resultant value is made available as the function's
> +return result.
> +
> +
> +4.4.5) Assign Statement
> +
> +The ':=' operator allows assignment to non-constant identifiers.
> +
> +The identifiers can be either formal parameters or variable as
> +found by the searching using the dynamic symbol table scoping rules.
> +
> +An assignment to an otherwise unknown identifier causes that
> +identifier to be introduced into the current scope.
> +
> +You can't assign to /constant/ identifiers (except in the initial
> +definition of them).
> +
> +
> +4.4.6) Property Definition
> +
> +Properties are named, possibly labeled, values.
> +Each value within a property is one of:
> +
> +    - A null-terminated C-like string,
>      - A numeric value fitting in 32 bits,
>      - A list of 32-bit values
>      - A byte sequence
> @@ -195,27 +494,126 @@ Here are some example property definitions:
>  	property4 = [0a 0b 0c 0d de ea ad be ef];
>  
>  
> -Node may contain sub-nodes to obtain a hierarchical structure.
> -For example:
> +4.4.7) Subroutine calls
>  
> -    - A child node named "childnode" whose unit name is
> -      "childnode at address".  It it turn has a string property
> -      called "childprop".
> +An expression at the statement level should be a function call,
> +though it might be considered as just a "subroutine call" as
> +any return value is thrown away.
>  
> -	childnode@addresss {
> -	    childprop = "hello\n";
> -	};
> +Invocation of the function introduces a symbol table scope
> +in which the formal paramters are introduced and bound.
> +Initial values for the formals are obtained by evaluating
> +the actual parameters, in order, and using a copy-in binding.
> +
> +Any incidental (dynamically occurring) assignment to an
> +otherwise unknown identifier will cause the introduction of
> +a new variable in the function's execution scope.
> +
> +Any property definitions generated by the function are emitted
> +into the caller's context at the point of the subroutine call.
> +
> +Any node definitions generated by the function are emitted
> +into the caller's context at the point of the subroutine call.
> +
> +Any return value from a return statement is thrown away.
>  
> +Execution control is returned to the point of the call.
>  
> -By default, all numeric values are hexadecimal.  Alternate bases
> -may be specified using a prefix "d#" for decimal, "b#" for binary,
> -and "o#" for octal.
>  
> -Strings support common escape sequences from C: "\n", "\t", "\r",
> -"\(octal value)", "\x(hex value)".
> +4.5) Expressions
>  
> +Basically, expressions follow C conventions.  However, there
> +are no assignment operations such as +=, or pre-/post-
> +increment/decrement.
>  
> -4.3) Labels and References
> +The '%' operation is a modulus operation for integers, and
> +a string concatenation operation if at least one of the operands
> +is determined to be a string value.
> +
> +
> +4.5.1) Expressions
> +
> +Pretend it is C and see how close we get.
> +
> +
> +4.5.2) Function Invocations
> +
> +A previously defined function may be invoked from within an
> +expression.  A "return" statement should be used to return
> +a resulting expression value to the caller's context.
> +
> +Invocation of the function introduces a symbol table scope
> +in which the formal parameters are introduced and bound.
> +Initial values for the formals are obtained by evaluating
> +the actual parameters, in order, and using a copy-in binding.
> +
> +Any incidental (dynamically occurring) assignment to an
> +otherwise unknown identifier will cause the introduciton of
> +a new variable in the function's execution scope.
> +
> +Any property definitions generated by the function are emitted
> +into the caller's context at the point of the subroutine call.
> +
> +Any node definitions generated by the function are emitted
> +into the caller's context at the point of the subroutine call.
> +
> +Any return value from a return statement is used as the result
> +of the function call within the context of the original expression.
> +
> +Execution control is returned to the point of the call.
> +
> +
> +4.5.3) Builtin Functions
> +
> +There are a few builtin function names;
> +
> +    join()	Concatenate and return a list of expression
> +		as a string.  Non-string arguments are coerced
> +		into being a string.
> +
> +    hexstr()	Format and return a hex string representation
> +		of the one parameter without a leading '0x'.
> +
> +While not here yet, /incbin/ should be converted into a builtin.
> +
> +
> +4.5.4) Literal Numbers
> +
> +Literal numbers follow C conventions.  Specifically, they are
> +base-ten by default, but can be hexadecimal, binary or octal
> +with a leading 0x or 0X, 0b or OB, or a simple leading zero,
> +respectively.
> +
> +There is no support for floating point representations at all.
> +
> +Most math and expression handling is assumed to be 64-bit, but
> +a cell-context may force a 32-bit container instead.
> +
> +
> +4.5.5) Literal Strings
> +
> +Strings support common escape sequences from C:
> +    "\n", "\t", "\r"
> +    "\(octal value)"
> +    "\x(hex value)"
> +
> +
> +4.5.6) Identifiers
> +
> +Identifiers references are resolved using dynamic symbol table
> +scoping rules.  An identifier referenced on the right-hand-side
> +of an expression must be resolvable or else it is an error.
> +
> +An identifier occurring on the left-hand-side of a ':=' assignment
> +is first sought and used if found.  If it is not found, it is
> +introduced dynamically in the innermost, current scope.
> +
> +Sometimes identifiers can be used without the leading slash,
> +other times they are required, especially if to disambiguate
> +from property names.  It's not ideal yet at all.
> +
> +
> +4.6) Labels and References
>  
>  Labels may be applied to nodes or properties.  Labels appear
>  before a node name, and are referenced using an ampersand: &label.
> @@ -239,6 +637,34 @@ And used in properties, lables may appear before or after any value:
>  	...
>      };
>  
> +The names of some labels can be constructed in an expression
> +context using the representation "&( <string_expr> )".
> +
> +
> +4.7) Symbol Table
> +
> +During the execution of the program, the evaluation context for
> +both statements and expressions is performed in the context of
> +a dynamic scoping environment.  That is, as each function,
> +subroutine or for-loop is encountered, a new symbol table scope
> +is pushed onto a dynamic run-time stack.  When an identifier's
> +name needs to be resolved and a value for it determined, a
> +search is performed from the inner-most, current top of the
> +scope-stack back through the dynamic scope stack towards the
> +outer-most and earliest scope.
> +
> +At each scope, an attempt is made to locate the symbol.  If it
> +is found, that is the symbol that is used.  If the symbol can not
> +be found at any level, it may be an error, or it may be cause to
> +introduce the symbol, as determined by the context in which the
> +identifier occurs.
> +
> +Constants from the command line using the "-D id=value" construct
> +are introduced into the outermost scope prior to beginning to
> +execute the source file proper.  This is the same outer-most scope
> +into which the /const/ and /define/ function symbols are also
> +introduced.
> +
>  
>  
>  II - The DT block format
> -- 
> 1.6.0.90.g436ed
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> https://ozlabs.org/mailman/listinfo/devicetree-discuss
