From: Johannes Sixt <j6t@kdbg.org>
Subject: Re: [PATCH] userdiff: Fix some corner cases in dts regex
Date: Sat, 5 Oct 2019 16:09:11 +0200
Message-ID: <c3a054d9-2646-e440-40c5-b0aecf21e690@kdbg.org>
References: <20191004213029.145027-1-sboyd@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <20191004213029.145027-1-sboyd@kernel.org>
Content-Language: en-US
Sender: git-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: git@vger.kernel.org, Adrian Johnson <ajohnson@redneon.com>, William Duclot <william.duclot@ensimag.grenoble-inp.fr>, Matthieu Moy <matthieu.moy@grenoble-inp.fr>, Junio C Hamano <gitster@pobox.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Am 04.10.19 um 23:30 schrieb Stephen Boyd:
> While reviewing some dts diffs recently I noticed that the hunk header
> logic was failing to find the containing node. This is because the regex
> doesn't consider properties that may span multiple lines, i.e.
> 
> 	property = <something>,
> 		   <something_else>;

What if the property spans more than two lines?

	property = <something>,
		   more,
		   <something_else>;

Can the second line "more," begin with a word, or are the angle brackets
mandatory?

I understand that the continuation lines can begin with a word when the
property is an expression that is distributed over a number of lines.
Such continuation lines could be picked up as hunk headers.

But I don't want to complicate things: The hunk header patterns do not
have to be perfect; it is sufficient when they are helpful in a good
majority of cases that occur in practice.

> and it got hung up on comments inside nodes that look like the root node
> because they start with '/*'. Add tests for these cases and update the
> regex to find them. Maybe detecting the root node is too complicated but
> forcing it to be a backslash with any amount of whitespace up to an open
> bracket seemed OK. I tried to detect that a comment is in-between the
> two parts but I wasn't happy so I just dropped it.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  t/t4018/dts-nodes-multiline-prop | 12 ++++++++++++
>  t/t4018/dts-root                 |  2 +-
>  t/t4018/dts-root-comment         |  8 ++++++++
>  userdiff.c                       |  3 ++-
>  4 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 t/t4018/dts-nodes-multiline-prop
>  create mode 100644 t/t4018/dts-root-comment
> 
> diff --git a/t/t4018/dts-nodes-multiline-prop b/t/t4018/dts-nodes-multiline-prop
> new file mode 100644
> index 000000000000..f7b655935429
> --- /dev/null
> +++ b/t/t4018/dts-nodes-multiline-prop
> @@ -0,0 +1,12 @@
> +/ {
> +	label_1: node1@ff00 {
> +		RIGHT@deadf00,4000 {
> +			multilineprop = <3>,
> +					<4>;

You could insert more lines to demonstrate that "<x>," on a line by
itself is not picked up.

> +
> +
> +> +			ChangeMe = <0xffeedd00>;

Sufficient distance to the incorrect candidates above. Good.

> +		};
> +	};
> +};
> diff --git a/t/t4018/dts-root b/t/t4018/dts-root
> index 2ef9e6ffaa2c..4353b8220c91 100644
> --- a/t/t4018/dts-root
> +++ b/t/t4018/dts-root
> @@ -1,4 +1,4 @@
> -/RIGHT { /* Technically just supposed to be a slash */
> +/ { RIGHT /* Technically just supposed to be a slash and brace */

Do I understand correctly that the updated form, "/ {", is the common
way to spell a root node, but "/" or "/word" are not?

>  	#size-cells = <1>;
>  
>  	ChangeMe = <0xffeedd00>;
> diff --git a/t/t4018/dts-root-comment b/t/t4018/dts-root-comment
> new file mode 100644
> index 000000000000..333a625c7007
> --- /dev/null
> +++ b/t/t4018/dts-root-comment
> @@ -0,0 +1,8 @@
> +/ { RIGHT /* Technically just supposed to be a slash and brace */

Devil's advocate here: insert ';' or '=' in the comment, and the line
would not be picked up. Does that hurt in practice?

> +	#size-cells = <1>;
> +
> +	/* This comment should be ignored */
> +
> +	some-property = <40+2>;
> +	ChangeMe = <0xffeedd00>;
> +};
> diff --git a/userdiff.c b/userdiff.c
> index 86e3244e15dd..651b56caec56 100644
> --- a/userdiff.c
> +++ b/userdiff.c
> @@ -25,8 +25,9 @@ IPATTERN("ada",
>  	 "|=>|\\.\\.|\\*\\*|:=|/=|>=|<=|<<|>>|<>"),
>  PATTERNS("dts",
>  	 "!;\n"
> +	 "!.*=.*\n"

This behaves the same way as just

	"!=\n"

no?

>  	 /* lines beginning with a word optionally preceded by '&' or the root */
> -	 "^[ \t]*((/|&?[a-zA-Z_]).*)",
> +	 "^[ \t]*((/[ \t]*\\{|&?[a-zA-Z_]).*)",
>  	 /* -- */
>  	 /* Property names and math operators */
>  	 "[a-zA-Z0-9,._+?#-]+"
> 

-- Hannes
