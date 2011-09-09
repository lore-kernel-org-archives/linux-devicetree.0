From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dtc: Support character literals in cell lists
Date: Fri, 9 Sep 2011 08:30:23 -0700
Message-ID: <CAF6FioWKYp8y9Wt7zQirftiGZqN3xtteDtSP0fjM+hNe1L5Aog@mail.gmail.com>
References: <1315517957-3546-1-git-send-email-robotboy@chromium.org>
	<1315517957-3546-3-git-send-email-robotboy@chromium.org>
	<20110909011221.GC30278@yookeroo.fritz.box>
	<CAF6FioVRJoNzUtVe7z67ujgxbZxEJfLprtw9MdnEJnoSQjTVtA@mail.gmail.com>
	<20110909070325.GB9025@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110909070325.GB9025-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On Fri, Sep 9, 2011 at 12:03 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Sep 08, 2011 at 11:40:59PM -0700, Anton Staaf wrote:
>> On Thu, Sep 8, 2011 at 6:12 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Thu, Sep 08, 2011 at 02:39:16PM -0700, Anton Staaf wrote:
>> >> With this patch the following property assignment:
>> >>
>> >> =A0 =A0 property =3D <0x12345678 'a' '\r' 100>;
>> >>
>> >> is equivalent to:
>> >>
>> >> =A0 =A0 property =3D <0x12345678 0x00000061 0x0000000D 0x00000064>
>> >
>> > One tiny nit..
>> >
>> > [snip]
>> >> diff --git a/dtc-lexer.l b/dtc-lexer.l
>> >> index e866ea5..94151da 100644
>> >> --- a/dtc-lexer.l
>> >> +++ b/dtc-lexer.l
>> >> @@ -29,6 +29,7 @@ PROPNODECHAR =A0 =A0 =A0 =A0[a-zA-Z0-9,._+*#?@-]
>> >> =A0PATHCHAR =A0 =A0 ({PROPNODECHAR}|[/])
>> >> =A0LABEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[a-zA-Z_][a-zA-Z0-9_]*
>> >> =A0STRING =A0 =A0 =A0 =A0 =A0 =A0 =A0 \"([^\\"]|\\.)*\"
>> >> +CHAR_LITERAL '[^']+'|'\\''
>> >
>> > I think this should be
>> > =A0 =A0 =A0 =A0'([^']|\\')*'
>> >
>> > On the same grounds I described before. =A0That does mean
>> > eval_char_literal() will have to cope with the case of ''.
>>
>> OK, I could also make it '([^']|\\')+'
>>
>> That way the empty character literal wouldn't be allowed and it still
>> allows all of the cases we care about.
>
> You could, but the same reasoning applies here: =A0An error message
> saying "empty character literal" is almost certainly more useful than
> "syntax error, Unexpected '" or whatever bison will give us on its
> own.

Good point, will do.

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
