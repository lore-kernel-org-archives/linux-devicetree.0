From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 4/5] dtc: Plugin and fixup support
Date: Thu, 2 Jun 2016 20:13:51 +0300
Message-ID: <60DA9B11-16A5-49C6-AB27-888D4FCBE3A3@konsulko.com>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com> <1464112239-29856-5-git-send-email-pantelis.antoniou@konsulko.com> <20160527073306.GA17226@voom.fritz.box> <20160531050634.GJ17226@voom.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160531050634.GJ17226-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On May 31, 2016, at 08:06 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org=
> wrote:
>=20
> On Fri, May 27, 2016 at 05:33:06PM +1000, David Gibson wrote:
>> On Tue, May 24, 2016 at 08:50:38PM +0300, Pantelis Antoniou wrote:
>>> This patch enable the generation of symbols & local fixup informati=
on
>>> for trees compiled with the -@ (--symbols) option.
>>>=20
>>> Using this patch labels in the tree and their users emit informatio=
n
>>> in __symbols__ and __local_fixups__ nodes.
>>>=20
>>> The __fixups__ node make possible the dynamic resolution of phandle
>>> references which are present in the plugin tree but lie in the
>>> tree that are applying the overlay against.
>>>=20
>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>=20
>> So, I think I've identified the underlying thing which was bothering
>> me about these patches.
>>=20
>> With the new dynamic patching stuff, "overlays" (for want of a bette=
r
>> term) now have a real existence both in the dts source format, and i=
n
>> the dtb object format.  However, these patches don't give them a
>> concrete, explicit representation within dtc itself - instead we jus=
t
>> kind of mangle one representation to the other as we're parsing.  I
>> think this is a mistaken approach.
>>=20
>> I'm toying with some patches to give overlays a full representation =
in
>> dtc which I think will handle these cases better - and allow for
>> easier experimentation with different possible ways of encoding the
>> overlays.
>>=20
>> One side point - writing plugins in dts format leads to an irritatin=
g
>> little ambiguity in the grammar.  Well, not an ambiguity technically=
,
>> but a place where we need more lookahead than normal, meaning we get
>> shift/reduce conflicts.  It arises because both memreserves and
>> overlays can have a label in front of them.  So, if we see a label a=
s
>> our next token after the version tag, we don't know if a memreserve =
or
>> overlay is coming next, so the parser doesn't know which path to go
>> down (with a single token lookahead).  We could handle it with
>> %glr-parser, of course, but I have been trying to avoid that.  I thi=
nk
>> this will apply both with your patches and with the approach I'm
>> working on - not sure what to do about it yet.
>=20
> I now have a first cut at said experiments, see:
>    https://github.com/dgibson/dtc/tree/overlay
>=20

Rebased my work and will submit again a couple of minutes.

Everything works besides a small niggle with the overlay syntax.

You cannot get rid of the basetree token. So=E2=80=A6

&foo { };=20

Does not work for an overlay, you need a dummy basetree=20

/ { }; &foo { };

Regards

=E2=80=94 Pantelis=20

> --=20
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _o=
ther_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
