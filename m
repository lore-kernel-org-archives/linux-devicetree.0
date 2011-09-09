From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dtc: Support character literals in cell lists
Date: Fri, 9 Sep 2011 10:52:26 +1000
Message-ID: <20110909005226.GZ30278@yookeroo.fritz.box>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-3-git-send-email-robotboy@chromium.org>
	<20110908034742.GN30278@yookeroo.fritz.box>
	<CAF6FioU7ur-bRpvscFV6XG7vWpu-DLezdeyPGAwz-J+moPXyXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6FioU7ur-bRpvscFV6XG7vWpu-DLezdeyPGAwz-J+moPXyXQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 08, 2011 at 02:20:16PM -0700, Anton Staaf wrote:
> On Wed, Sep 7, 2011 at 8:47 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Sep 07, 2011 at 04:15:39PM -0700, Anton Staaf wrote:
[snip]
> > Hrm, this paragraph is clearly referring to the old-style dts-v0
> > syntax (hex is not the default, these days) - which may well mean the
> > whole document is hopelessly out of date. =A0And I think the char
> > literals should only be processed in dts-v1 mode.
> =

> Fair enough, would it make sense for me to just remove this
> modification to manual.txt and leave the changes in place in
> dts-format.txt?

I think so.

> >> -Strings support common escape sequences from C: "\n", "\t", "\r",
> >> -"\(octal value)", "\x(hex value)".
> >> +Strings and character literals support common escape sequences from C:
> >> +"\n", "\t", "\r", "\(octal value)", "\x(hex value)".
> >>
> >>
> >> =A04.3) Labels and References
> >> diff --git a/dtc-lexer.l b/dtc-lexer.l
> >> index e866ea5..d4f9eaa 100644
> >> --- a/dtc-lexer.l
> >> +++ b/dtc-lexer.l
> >> @@ -29,6 +29,8 @@ PROPNODECHAR =A0 =A0 =A0 =A0[a-zA-Z0-9,._+*#?@-]
> >> =A0PATHCHAR =A0 =A0 ({PROPNODECHAR}|[/])
> >> =A0LABEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[a-zA-Z_][a-zA-Z0-9_]*
> >> =A0STRING =A0 =A0 =A0 =A0 =A0 =A0 =A0 \"([^\\"]|\\.)*\"
> >> +CHAR_LITERAL '[^\\']'
> >> +CHAR_ESCAPED '\\([^']+|')'
> >
> > I'd prefer a single regex here, of '[^']+', and then check that it is
> > indeed a single character when you process it. =A0An aside as to why...
> =

> Done, though I made it a slightly more complex regex that can also match =
'\''.

Good call, I forgot that case.

[snip]
> > So, I'd prefer the error handling to be done here - that is if there's
> > a bad escape sequence or more than one character, report it here. =A0For
> > now, a die() will do, although longer term I'd prefer a not
> > immediately fatal message (allowing the rest of the file to be checked
> > for errors) with an error triggered after the parse is complete.
> =

> I ended up (as you'll see shortly) doing this in dtc-parser.y and
> using the print_error function there so I didn't have to just die out.
>  So longer term can be now, instead of...

Superb :)

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
