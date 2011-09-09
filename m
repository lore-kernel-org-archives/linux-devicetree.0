From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/3] dtc: Support character literals in bytestrings
Date: Fri, 9 Sep 2011 08:31:25 -0700
Message-ID: <CAF6FioW_nbGzX-jOfJ9OuNfRhDsPptHdTZ0m97b-u7283aop7g@mail.gmail.com>
References: <1315517957-3546-1-git-send-email-robotboy@chromium.org>
	<1315517957-3546-4-git-send-email-robotboy@chromium.org>
	<20110909011510.GA21002@yookeroo.fritz.box>
	<CAF6FioWvY0=qJGKsu=i=8TB9FF34xeo966hwuEht+o+krYPKGQ@mail.gmail.com>
	<20110909070118.GA9025@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110909070118.GA9025-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On Fri, Sep 9, 2011 at 12:01 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Sep 08, 2011 at 11:37:21PM -0700, Anton Staaf wrote:
>> On Thu, Sep 8, 2011 at 6:15 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Thu, Sep 08, 2011 at 02:39:17PM -0700, Anton Staaf wrote:
>> >> With this patch the following property assignment:
>> >>
>> >> =A0 =A0 property =3D ['a' 2b '\r'];
>> >>
>> >> is equivalent to:
>> >>
>> >> =A0 =A0 property =3D [61 2b 0d];
>> >
>> > [snip]
>> >> +<BYTESTRING>{CHAR_LITERAL} {
>> >
>> > You should just be able to make the existing rule a <*> one,
>> > rather than having a separate rule for BYTESTRING context.
>>
>> I thought about that too, but I was concerned that it would then allow
>> character literals in properties outside of the cell list or
>> bytestring syntax. =A0Which I suppose is exactly what you had suggested
>> before now that I think about it. =A0And would end up being no more
>> ambiguous, and possibly more internally consistent. =A0I'll make the
>> change and add a test case that shows that functionality as well if
>> that makes sense to you.
>
> Well, it would allow character literals to be *lexed* in other places,
> but the parser would still reject them outside of the (so far)
> intended contexts without further changes.

True, and it simplifies the lexer.  OK, I'll make that change as well.

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
