From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dtc: Support character literals in cell lists
Date: Thu, 8 Sep 2011 14:20:16 -0700
Message-ID: <CAF6FioU7ur-bRpvscFV6XG7vWpu-DLezdeyPGAwz-J+moPXyXQ@mail.gmail.com>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-3-git-send-email-robotboy@chromium.org>
	<20110908034742.GN30278@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110908034742.GN30278-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 7, 2011 at 8:47 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Sep 07, 2011 at 04:15:39PM -0700, Anton Staaf wrote:
>> With this patch the following property assignment:
>>
>> =A0 =A0 property =3D <0x12345678 'a' '\r' 100>;
>>
>> is equivalent to:
>>
>> =A0 =A0 property =3D <0x12345678 0x00000061 0x0000000D 0x00000064>
>>
>> Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
>> Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>> ---
>> =A0Documentation/dts-format.txt | =A0 =A02 +-
>> =A0Documentation/manual.txt =A0 =A0 | =A0 =A07 ++++---
>> =A0dtc-lexer.l =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 14 ++++++++++++++
>> =A0dtc-parser.y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A04 ++++
>> =A04 files changed, 23 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
>> index a655b87..eae8b76 100644
>> --- a/Documentation/dts-format.txt
>> +++ b/Documentation/dts-format.txt
>> @@ -33,7 +33,7 @@ Property values may be defined as an array of 32-bit i=
nteger cells, as
>> =A0NUL-terminated strings, as bytestrings or a combination of these.
>>
>> =A0* Arrays of cells are represented by angle brackets surrounding a
>> - =A0space separated list of C-style integers
>> + =A0space separated list of C-style integers or character literals.
>>
>> =A0 =A0 =A0 e.g. interrupts =3D <17 0xc>;
>>
>> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
>> index f8a8a7b..940fd3d 100644
>> --- a/Documentation/manual.txt
>> +++ b/Documentation/manual.txt
>> @@ -213,10 +213,11 @@ For example:
>>
>> =A0By default, all numeric values are hexadecimal. =A0Alternate bases
>> =A0may be specified using a prefix "d#" for decimal, "b#" for binary,
>> -and "o#" for octal.
>> +and "o#" for octal. =A0Character literals are supported using the C
>> +language character literal syntax of 'a'.
>
> Hrm, this paragraph is clearly referring to the old-style dts-v0
> syntax (hex is not the default, these days) - which may well mean the
> whole document is hopelessly out of date. =A0And I think the char
> literals should only be processed in dts-v1 mode.

Fair enough, would it make sense for me to just remove this
modification to manual.txt and leave the changes in place in
dts-format.txt?

>> -Strings support common escape sequences from C: "\n", "\t", "\r",
>> -"\(octal value)", "\x(hex value)".
>> +Strings and character literals support common escape sequences from C:
>> +"\n", "\t", "\r", "\(octal value)", "\x(hex value)".
>>
>>
>> =A04.3) Labels and References
>> diff --git a/dtc-lexer.l b/dtc-lexer.l
>> index e866ea5..d4f9eaa 100644
>> --- a/dtc-lexer.l
>> +++ b/dtc-lexer.l
>> @@ -29,6 +29,8 @@ PROPNODECHAR =A0 =A0 =A0 =A0[a-zA-Z0-9,._+*#?@-]
>> =A0PATHCHAR =A0 =A0 ({PROPNODECHAR}|[/])
>> =A0LABEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[a-zA-Z_][a-zA-Z0-9_]*
>> =A0STRING =A0 =A0 =A0 =A0 =A0 =A0 =A0 \"([^\\"]|\\.)*\"
>> +CHAR_LITERAL '[^\\']'
>> +CHAR_ESCAPED '\\([^']+|')'
>
> I'd prefer a single regex here, of '[^']+', and then check that it is
> indeed a single character when you process it. =A0An aside as to why...

Done, though I made it a slightly more complex regex that can also match '\=
''.

> So, when first working with lexer/parser generators, it is very
> tempting to make the token regexes as tight as possible, so that as
> soon as lex has recognized the token, you know it is 100%
> syntactically valid. =A0The problem with this is that when the user
> enters something that looks kinda like the token in question, but
> isn't quite right, then flex will re-interpret those characters as
> some other tokens. =A0That usually results in a deeply incomprehensible
> syntax error from the parser.

Good point.

> I think the better approach, therefore, is to make the token regexes
> as wide as they reasonably can be without ambiguity, then do extra
> validation once the token is recognized by flex. =A0That way you can
> produce a much more helpful "Bad format for token X" type error
> message. =A0Currently dtc is a bit mixed in the extent it does this, but
> that's the direction I'd prefer to move.

Done.

>> =A0WS =A0 =A0 =A0 =A0 =A0 [[:space:]]
>> =A0COMMENT =A0 =A0 =A0 =A0 =A0 =A0 =A0"/*"([^*]|\*+[^*/])*\*+"/"
>> =A0LINECOMMENT =A0"//".*\n
>> @@ -109,6 +111,18 @@ static int pop_input_file(void);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return DT_LITERAL;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>
>> +<V1>{CHAR_LITERAL} =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 yylval.byte =3D yytext[1];
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DPRINT("Character literal: %s\=
n", yytext);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return DT_BYTE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> +<V1>{CHAR_ESCAPED} =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 yylval.byte =3D get_escape_cha=
r_exact(yytext+1, yyleng-2);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DPRINT("Character literal esca=
ped: %s\n", yytext);
>
> So, I'd prefer the error handling to be done here - that is if there's
> a bad escape sequence or more than one character, report it here. =A0For
> now, a die() will do, although longer term I'd prefer a not
> immediately fatal message (allowing the rest of the file to be checked
> for errors) with an error triggered after the parse is complete.

I ended up (as you'll see shortly) doing this in dtc-parser.y and
using the print_error function there so I didn't have to just die out.
 So longer term can be now, instead of...

Thanks,
    Anton

> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
