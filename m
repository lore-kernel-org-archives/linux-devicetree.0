From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v13 0/7] dtc: Dynamic DT support
Date: Fri, 9 Dec 2016 11:12:39 +0200
Message-ID: <3B8E91D4-76F7-4CA3-B67C-44B88D3F2CA3@konsulko.com>
References: <1481114903-8197-1-git-send-email-pantelis.antoniou@konsulko.com> <20161209055709.GP13139@umbus.fritz.box> <3C4DD870-3736-42A7-A110-0975C31E74A4@konsulko.com> <20161209085432.GR13139@umbus.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161209085432.GR13139-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> On Dec 9, 2016, at 10:54 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
>=20
> On Fri, Dec 09, 2016 at 10:16:51AM +0200, Pantelis Antoniou wrote:
>> Hi David,
>>=20
>>> On Dec 9, 2016, at 07:57 , David Gibson =
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>>>=20
>>> On Wed, Dec 07, 2016 at 02:48:16PM +0200, Pantelis Antoniou wrote:
>>>> This patchset adds Dynamic DT support in the DTC compiler
>>>> as used in a number of boards like the beaglebone/rpi/chip and =
others.
>>>>=20
>>>> The first patch documents the internals of overlay generation, =
while
>>>> the second one adds dynamic object/overlay support proper.
>>>>=20
>>>> The third patch adds a test method that can is used by the =
subsequent
>>>> patch which adds a few overlay tests verifying operation.
>>>>=20
>>>> The following 3 patches add support for the syntactic sugar version
>>>> of &foo { }; in a similar manner.
>>>>=20
>>>> This patchset is against DTC mainline and is also available for a =
pull
>>>> request from https://github.com/pantoniou/dtc/tree/overlays
>>>=20
>>> Ok, I've merged patches 1-4 into mainline, along with a bunch of =
minor
>>> fixes of my own on top.  5..7 (the start of the new) I want to hold
>>> off on for now, to thrash out the details of what we want a new
>>> cleaner format to look like a bit more thoroughly.
>>>=20
>>=20
>> Thank you.
>>=20
>> My git tree contains an updated patchset of the syntactic sugar =
patches
>> for reference now.
>=20
> Ok.  Note that one of the patches I merged afterwards was a big rename
> of struct boot_info, so your patches will probably need a fair bit of
> fiddly though straightforward rebasing.
>=20

Fortunately not. The syntax sugar stuff do not rely on boot_info at all =
now
that the rule uses the inherited attribute trick.

> --=20
> David Gibson			| I'll have my music baroque, and my =
code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT =
_the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
