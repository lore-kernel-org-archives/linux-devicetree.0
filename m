From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v11 5/7] overlay: Documentation for the overlay sugar syntax
Date: Wed, 30 Nov 2016 11:07:39 +0200
Message-ID: <57596646-6DB0-4C5F-BEB8-8453AE5633DC@konsulko.com>
References: <1480349141-14145-1-git-send-email-pantelis.antoniou@konsulko.com> <1480349141-14145-6-git-send-email-pantelis.antoniou@konsulko.com> <20161129031054.GI13307@umbus.fritz.box> <583D05B7.4040109@gmail.com> <20161129051042.GO13307@umbus.fritz.box> <583DB09C.7060105@gmail.com> <20161130003900.GC19891@umbus>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161130003900.GC19891@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On Nov 30, 2016, at 02:39 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
>=20
> On Tue, Nov 29, 2016 at 08:45:16AM -0800, Frank Rowand wrote:
>> On 11/28/16 21:10, David Gibson wrote:
>>> On Mon, Nov 28, 2016 at 08:36:07PM -0800, Frank Rowand wrote:
>>>> On 11/28/16 19:10, David Gibson wrote:
>>>>> On Mon, Nov 28, 2016 at 06:05:39PM +0200, Pantelis Antoniou wrote:
>>>>>> There exists a syntactic sugar version of overlays which
>>>>>> make them simpler to write for the trivial case of a single =
target.
>>>>=20
>>>> It also works for multiple targets.  (See the example I provided in
>>>> my comment to v10.)
>>>>=20
>>>>=20
>>>>>>=20
>>>>>> Document it in the device tree object internals.
>>>>>>=20
>>>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>>>>=20
>>>>> I'm with Frank that I think this, rather than being regarded mere
>>>>> syntactic sugar, should be considered the primary way of =
describing
>>>>> overlays.
>>>>>=20
>>>>> Obviously we need to support the fully written out version as =
well.
>>>>=20
>>>> If we need to support the fully written out version, can we make =
that
>>>> a discouraged, non-preferred method?  Maybe require an option to
>>>> enable compiling this style of dts?
>>>=20
>>> Yeah.  To avoid further proliferation of options, I'm thinking a
>>> single "backwards compat" option which would:
>>> 	- Use the dtb magic instead of dtb magic
>>> 	- Disable checks which would reject explicit creation of
>>> 	  __overlay__ / __symbols__ / __fixups__ nodes
>>> 	- Anything other special behaviour we need
>>> =09
>>>> I can imagine some reasons to support the fully written out =
version,
>>>> but can we document what those reasons are?
>>>=20
>>> I believe the main one is the dts files in this format out in the
>>> field.  Mind you, I guess we're already requiring them to tweak how
>>> they declare the /plugin/ option.
>>=20
>> It might be easy to write a program that transforms the expanded
>> format to the simple format.  I'll try to make some time to see
>> how difficult it is.  The transformation is relatively easy to
>> do manually, but I don't know how many dts files would need to
>> be converted.
>=20
> It's not totally trivial, because such a program would basically need
> a full dts parser.  But.. if we change the dtc internals to work with
> a list of overlays rather than a single tree, there's a relatively
> obvious path to it: we can implement parsing a dtbo input into a set
> of fragments rather than an assembled overlay and dts output in
> fragment form.  Then converting from old-dts to dtb and back to dts
> would pretty much do what's needed.  At the cost of losing comments,
> though :/.
>=20

It=E2=80=99s not just the comments. New style dts=E2=80=99es in the =
kernel now use CPP
pre-processed input which make the dts more readable.

Converting back to dts is not even close to the original source.

You might as well use fdtdump instead.

> --=20
> David Gibson			| I'll have my music baroque, and my =
code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT =
_the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Regards

=E2=80=94 Pantelis
