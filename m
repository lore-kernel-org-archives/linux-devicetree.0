From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 3/4] dtc: Plugin and fixup support
Date: Thu, 24 Nov 2016 16:23:24 +0200
Message-ID: <6FE2D679-BD31-4366-B23C-2F95B0706CE0@konsulko.com>
References: <1479990693-14260-1-git-send-email-pantelis.antoniou@konsulko.com> <1479990693-14260-4-git-send-email-pantelis.antoniou@konsulko.com> <dab7f38a-89c3-adbc-07a5-8ef8669ded42@raspberrypi.org> <B341AF38-45C5-4954-B1E4-B89DED923929@konsulko.com> <2ad2929c-6e6a-4e31-0cca-cea2f11b14b1@raspberrypi.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2ad2929c-6e6a-4e31-0cca-cea2f11b14b1-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Phil,

> On Nov 24, 2016, at 16:14 , Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> wrote:
>=20
> On 24/11/2016 13:58, Pantelis Antoniou wrote:
>> Hi Phil,
>>=20
>>> On Nov 24, 2016, at 15:49 , Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> =
wrote:
>>>=20
>>> On 24/11/2016 12:31, Pantelis Antoniou wrote:
>>>> This patch enable the generation of symbols & local fixup =
information
>>>> for trees compiled with the -@ (--symbols) option.
>>>>=20
>>>> Using this patch labels in the tree and their users emit =
information
>>>> in __symbols__ and __local_fixups__ nodes.
>>>>=20
>>>> The __fixups__ node make possible the dynamic resolution of phandle
>>>> references which are present in the plugin tree but lie in the
>>>> tree that are applying the overlay against.
>>>>=20
>>>> While there is a new magic number for dynamic device tree/overlays =
blobs
>>>> it is by default disabled. This is in order to give time for DT =
blob
>>>> methods to be updated.
>>>>=20
>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> It's great to see this work about to come to fruition, but I have a
>>> reservation about this patch. Like previous versions, this
>>> implementation generates __fixups__, __local_fixups__  and =
__symbols__
>>> whenever the "-@" command line parameter is given; without it you =
get
>>> none. In my opinion, this logic causes the DTBs to be unnecessarily
>>> large with no obvious benefit.
>>>=20
>>> You can divide the compiled outputs from DTC into two categories - =
fully
>>> resolved DTBs (what I would call base DTBs), and overlays. Base DTBs
>>> should include __symbols__ to allow overlays to be applied, and it =
is
>>> right that this should be controlled by the "-@" flag, but since =
base
>>> DTBs are fully resolved I think there is no reason to include either
>>> __fixups__ or __local_fixups__. Therefore I think both kinds of =
fixups
>>> should only be omitted when the "/plugin/ " directive is used. This =
was
>>> the purpose of one of the patches I provided you with.
>>>=20
>> Yes, I=92m quite aware of that. There is a reason for generating =
every
>> resolve node for the base tree. It contains information about the
>> dependencies of every hardware device due to phandle references.
>> We can utilize that to re-order the device probe order to eliminate
>> -EPROBE_DEFER cycles upon boot.
>>=20
>> It is important we get the core support in and then you can add extra
>> switches for every special platform case.
>>=20
>> What kind of problems do you have with larger device tree blobs?
>> I do carry a hashed phandle patch on my mainline tracking tree which
>> should help with larger DTBs.=20
> Early Raspberry Pi DT support used to load the DTBs to 0x100, Although
> the ARMv6/7 kernel starts at 0x8000, something (the decompressor?) =
would
> use the space between 0x4000 and the 0x8000, which gave us a practical
> limit of 16KB on the DTB size. This used to be sufficient for a base =
DTB
> and a few small overlays, but with the patch all Pi DTBs are over =
16KB.
> The practical limit was overcome a long time ago, but it made me aware
> of the DTB contents, and there are may be some situations where it is
> desirable to reduce the footprint as much as possible.
>=20

I see now why you care about this. If you can regenerate your patch =
against
what I=92ve posted I=92d be happy to carry it along.

But DTBs are getting pretty large even without the extra fixup nodes. It =
is
not uncommon to see them at a few hundred KBs now.

> I would have thought that all DTBs already contain enough dependency
> information in the form of the phandles themselves. One of the first
> things the kernel does is to unflatten the DTB, and that is the =
obvious
> point to resolve the phandles and generate the necessary dependencies.
> Can you explain how both __fixups__ and __local_fixups__ aid this
> process? Ideally they wouldn't duplicate any information already in =
the
> tree, since then you have to cope with the possibility of malformed =
DTBs
> where the two don't actually match.

No, the DTBs by themselves do not contain enough information to build =
the
probe dependency graph, because phandles are simply converted to 32 bit
cell values on compile.

For instance take a case of one node using the other:

foo_label: foo { };
bar { use =3D <&foo_label>; };

A standard compile would generate a bar node as bar { use =3D <1>; };

While using the -@ switch you=92d get a local ref that says that there =
is
a phandle cell value at offset 0 of bar/use property. Looking up the
phandle value you can see that this property references the foo node.

So when building the probe order graph the foo node should be probed
before bar.

>=20
> Phil

Regards

=97 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
