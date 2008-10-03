From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: DTS language enhancements
Date: Fri, 3 Oct 2008 14:37:10 +1000
Message-ID: <20081003043710.GH3002@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ok, as promised by thoughts (which have been simmering for a while) on
where we ought to go with DTS expression and whatnot support.

Expressions
===========

With any luck we can agree on what expressions should look like, even
if we're still arguing about when they ought to be evaluated.  My
approach here is to re-interpret some of the existing syntax as
expressions.  In addition to integer expressions, we also have
string/bytestring expressions, and node-content expressions.  That
lets the grammar for property definitions become:
	<property name> = <bytestring expression>;
And for node definitions it becomes:
	<node name> <node-content expression>;

Integer expressions
-------------------

These are the easy ones.  Literals are as in C, and all
side-effect-free C integer operators are supported (including
relationals, logicals and the ?: ternary).

String/Bytestring expressions
-----------------------------

We have two kinds of literal here:
	null-terminated strings:	"hello world\n"
	bytestrings:			[aabbccdd]

The < ... > construct which delimits a cell list becomes a special
operator which takes a list of integer expressions and returns a
bytestring value.

, is a bytestring append operator (note that this is different from a
string append operator, because it doesn't chop a terminating null
from the first argument).

?: would also be supported for bytestrings (first argument is integer,
second and third are bytestring).

We also probably want (but I don't have a specific syntax in mind for yet):
	- string append operator and/or a pythonesque "printf" operator
	- repeat operator (e.g. [aabbcc] * 3 == [aabbccaabbccaabbcc])

Node-content expressions
------------------------

Literals are node definitions in the current format:
	{
		prop = <bytestring expression>;
		somesubnode@whatever <node content expression>;
	}

?: would also be supported here (again, first argument integer, second
and third are node-content).

I'm less sure what other operators we'll need here - probably need to
build these based on actual usage examples.  Likely candidates,
however are:
	- set property
e.g. /setprop/({ }, "reg", < 17 >) == { reg = < 17 >; }
	- remove property
e.g. /delprop({ reg = <17>; }, "reg") == { }
	- add subnode
e.g. /addnode/({ }, "subnode@17", {reg = <17>;}) == 
	{ subnode@17 { reg = <17>; }; }
	- merge
e.g. /merge/({foo = "abc";}, {bar = <17>;}) == {foo = "abc"; bar=<17>;}
(this would recurse down subnodes with identical names)
	- get subnode
e.g. /getnode/({ subnode { foo = "bar"; }; }, "subnode") ==
	{ foo = "bar"; }
	- get property (result of this is a bytestring, not a
node-content expression)
e.g. /getprop/({ foo = "bar"; }, "foo") = "bar"

Expressions in node/property names
----------------------------------

As Jon's examples demonstrate, we need the ability to compute node
names at least with expressions, so that we can fill in appropriate
unit addresses.  I can't think of a use for computed property names
off hand, but if we can do one the other follows trivially so we might
as well allow both.

It's possible to do this just with the /setprop/, /addnode/ operators
described above, but that's awkward and verbose, so allowing
expressions in the same place the property/node names go now seems
better.  jdl's patch series allows this, but I'm not sure what makes
the grammatical distinction between the parser expecting a bare node
name and an expression, which worries me.

What I would suggest here is that expressions for node/property names
must be parenthesized.  ( and ) aren't used in node/property names
either in theory or practice AFAIK and this is consistent with integer
expressions having to be parenthesized within cell lists to avoid
ambiguity.

Expressions in labels
---------------------

Jon's patch also allows expressions instead of literals in labels.
I'm a lot more dubious about this feature: it's very un-C-like, and
removes the current nice lexical distinctness of labels.

But we probably do need some way of making computed labels for canned
devices of various sorts.  Of course, if we use preprocessed macro
expansion rather than runtime expression evaluation we can do that (as
its sometimes done in C code) by using the preprocessor's token
pasting operations.  We could also create a /label/ operator of some
sort.  Need more thought here.

Lexical issues of property / node names
=======================================

Property and node names are lexically troublesome because they can
contain a bunch of characters that would usually have special
meanings.  My intention for dealing with this is that property/node
names will only be lexed in a small number of contexts.  Usually they
will not be recognized, and we can lex C-like identifiers without
trouble.

Contexts which take bare propnodenames are always introduced by { }.
At most one bare propnodename will be recognized per logical-line (';'
delimited), and it must be the first token - we should be able to use
flex's state stack support to track this.

This lexical structure works for node definitions themselves { ... },
and for reference-to-path &{...}.  Any new constructs we introduce
which take bare propnodenames (as opposed to string expressions which
are interpreted as node or property names) will also use { } for
consistency.

Identifiers
===========

Whether we use preprocessing or post-parse evaluation, all identifiers
and parameters should be C style; that is [a-zA-Z_][a-zA-Z0-9_]*.  No
funny delimiters to mark them.  With the handling of propnodenames
described above, this shouldn't be problematic - any context will
either take a propnodename, or an identifier, but not both.

Preprocessing or post-parse evaluation
======================================

I think we need pretty much all the above, particularly the rich
expression support whether or not we have post-parse evaluation of
expressions, or whether we just have a preprocessor to help the user
built up complex constant expressions.

I favour preprocessing, because it's quite a simple extra step on top
of that which I think will give us what we need - at least if we have
the right expression operators available.  Post-parse processing
requires us to carry around expression trees, do more complex handling
of types and other extra work.  I'm not yet convinced (though I could
be) that this is worthwhile.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
