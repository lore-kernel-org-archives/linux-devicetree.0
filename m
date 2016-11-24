From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 3/4] dtc: Plugin and fixup support
Date: Thu, 24 Nov 2016 15:58:22 +0200
Message-ID: <B341AF38-45C5-4954-B1E4-B89DED923929@konsulko.com>
References: <1479990693-14260-1-git-send-email-pantelis.antoniou@konsulko.com> <1479990693-14260-4-git-send-email-pantelis.antoniou@konsulko.com> <dab7f38a-89c3-adbc-07a5-8ef8669ded42@raspberrypi.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dab7f38a-89c3-adbc-07a5-8ef8669ded42-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Phil,

> On Nov 24, 2016, at 15:49 , Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> wrote:
>=20
> On 24/11/2016 12:31, Pantelis Antoniou wrote:
>> This patch enable the generation of symbols & local fixup information
>> for trees compiled with the -@ (--symbols) option.
>>=20
>> Using this patch labels in the tree and their users emit information
>> in __symbols__ and __local_fixups__ nodes.
>>=20
>> The __fixups__ node make possible the dynamic resolution of phandle
>> references which are present in the plugin tree but lie in the
>> tree that are applying the overlay against.
>>=20
>> While there is a new magic number for dynamic device tree/overlays =
blobs
>> it is by default disabled. This is in order to give time for DT blob
>> methods to be updated.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> It's great to see this work about to come to fruition, but I have a
> reservation about this patch. Like previous versions, this
> implementation generates __fixups__, __local_fixups__  and __symbols__
> whenever the "-@" command line parameter is given; without it you get
> none. In my opinion, this logic causes the DTBs to be unnecessarily
> large with no obvious benefit.
>=20
> You can divide the compiled outputs from DTC into two categories - =
fully
> resolved DTBs (what I would call base DTBs), and overlays. Base DTBs
> should include __symbols__ to allow overlays to be applied, and it is
> right that this should be controlled by the "-@" flag, but since base
> DTBs are fully resolved I think there is no reason to include either
> __fixups__ or __local_fixups__. Therefore I think both kinds of fixups
> should only be omitted when the "/plugin/ " directive is used. This =
was
> the purpose of one of the patches I provided you with.
>=20

Yes, I=92m quite aware of that. There is a reason for generating every
resolve node for the base tree. It contains information about the
dependencies of every hardware device due to phandle references.
We can utilize that to re-order the device probe order to eliminate
-EPROBE_DEFER cycles upon boot.

It is important we get the core support in and then you can add extra
switches for every special platform case.

What kind of problems do you have with larger device tree blobs?
I do carry a hashed phandle patch on my mainline tracking tree which
should help with larger DTBs.=20

> Phil Elwell, Raspberry Pi

Regards

=97 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
