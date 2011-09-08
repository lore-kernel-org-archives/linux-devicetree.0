From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dtc: Support character literals in cell lists
Date: Thu, 8 Sep 2011 13:47:42 +1000
Message-ID: <20110908034742.GN30278@yookeroo.fritz.box>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-3-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1315437340-1661-3-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 07, 2011 at 04:15:39PM -0700, Anton Staaf wrote:
> With this patch the following property assignment:
> 
>     property = <0x12345678 'a' '\r' 100>;
> 
> is equivalent to:
> 
>     property = <0x12345678 0x00000061 0x0000000D 0x00000064>
> 
> Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
> Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> ---
>  Documentation/dts-format.txt |    2 +-
>  Documentation/manual.txt     |    7 ++++---
>  dtc-lexer.l                  |   14 ++++++++++++++
>  dtc-parser.y                 |    4 ++++
>  4 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
> index a655b87..eae8b76 100644
> --- a/Documentation/dts-format.txt
> +++ b/Documentation/dts-format.txt
> @@ -33,7 +33,7 @@ Property values may be defined as an array of 32-bit integer cells, as
>  NUL-terminated strings, as bytestrings or a combination of these.
>  
>  * Arrays of cells are represented by angle brackets surrounding a
> -  space separated list of C-style integers
> +  space separated list of C-style integers or character literals.
>  
>  	e.g. interrupts = <17 0xc>;
>  
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index f8a8a7b..940fd3d 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -213,10 +213,11 @@ For example:
>  
>  By default, all numeric values are hexadecimal.  Alternate bases
>  may be specified using a prefix "d#" for decimal, "b#" for binary,
> -and "o#" for octal.
> +and "o#" for octal.  Character literals are supported using the C
> +language character literal syntax of 'a'.

Hrm, this paragraph is clearly referring to the old-style dts-v0
syntax (hex is not the default, these days) - which may well mean the
whole document is hopelessly out of date.  And I think the char
literals should only be processed in dts-v1 mode.

> -Strings support common escape sequences from C: "\n", "\t", "\r",
> -"\(octal value)", "\x(hex value)".
> +Strings and character literals support common escape sequences from C:
> +"\n", "\t", "\r", "\(octal value)", "\x(hex value)".
>  
>  
>  4.3) Labels and References
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index e866ea5..d4f9eaa 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -29,6 +29,8 @@ PROPNODECHAR	[a-zA-Z0-9,._+*#?@-]
>  PATHCHAR	({PROPNODECHAR}|[/])
>  LABEL		[a-zA-Z_][a-zA-Z0-9_]*
>  STRING		\"([^\\"]|\\.)*\"
> +CHAR_LITERAL	'[^\\']'
> +CHAR_ESCAPED	'\\([^']+|')'

I'd prefer a single regex here, of '[^']+', and then check that it is
indeed a single character when you process it.  An aside as to why...

So, when first working with lexer/parser generators, it is very
tempting to make the token regexes as tight as possible, so that as
soon as lex has recognized the token, you know it is 100%
syntactically valid.  The problem with this is that when the user
enters something that looks kinda like the token in question, but
isn't quite right, then flex will re-interpret those characters as
some other tokens.  That usually results in a deeply incomprehensible
syntax error from the parser.

I think the better approach, therefore, is to make the token regexes
as wide as they reasonably can be without ambiguity, then do extra
validation once the token is recognized by flex.  That way you can
produce a much more helpful "Bad format for token X" type error
message.  Currently dtc is a bit mixed in the extent it does this, but
that's the direction I'd prefer to move.

>  WS		[[:space:]]
>  COMMENT		"/*"([^*]|\*+[^*/])*\*+"/"
>  LINECOMMENT	"//".*\n
> @@ -109,6 +111,18 @@ static int pop_input_file(void);
>  			return DT_LITERAL;
>  		}
>  
> +<V1>{CHAR_LITERAL}	{
> +			yylval.byte = yytext[1];
> +			DPRINT("Character literal: %s\n", yytext);
> +			return DT_BYTE;
> +		}
> +
> +<V1>{CHAR_ESCAPED}	{
> +			yylval.byte = get_escape_char_exact(yytext+1, yyleng-2);
> +			DPRINT("Character literal escaped: %s\n", yytext);

So, I'd prefer the error handling to be done here - that is if there's
a bad escape sequence or more than one character, report it here.  For
now, a die() will do, although longer term I'd prefer a not
immediately fatal message (allowing the rest of the file to be checked
for errors) with an error triggered after the parse is complete.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
