From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Tue, 29 Nov 2016 15:00:32 +0200
Message-ID: <27651F03-6E8F-4C76-A0E4-0DFBEC40277C@konsulko.com>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com> <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com> <20161128041228.GJ30927@umbus.fritz.box> <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com> <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org> <20161129021131.GD13307@umbus.fritz.box> <b7ff53f6-6481-e3f1-e3b5-d0b04e563e83@raspberrypi.org> <D3BFA6AB-21C1-451B-ACF5-32EA5E615275@konsulko.com> <66c7f8c5-94e9-a6ca-4402-fa0ccf2a6ac0@raspberrypi.org> <1F9EDF06-98B1-4270-AA58-1A9D9A9F9803@konsulko.com> <ba8e2ed3-9798-3074-1167-3f6851321a25@raspberrypi.org> <96BE1B80-0843-4981-AA2A-E89EA6A02600@konsulko.com> <a1ba4783-2a3b-eefd-9c41-2f33524472fe@raspberrypi.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a1ba4783-2a3b-eefd-9c41-2f33524472fe-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Phil,

> On Nov 29, 2016, at 14:57 , Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> wrote:
>=20
> On 29/11/2016 12:24, Pantelis Antoniou wrote:
>> First note is that this is exactly what the portable connector is =
supposed to
>> do; abstract away the SoC differences.
>>=20
>> Second note is that it=92s not the overlay application that=92s =
having problems, it=92s
>> your parameter patching method.
>>=20
>> The 'spimaxfrequency =3D <&can0>,"spi-max-frequency:0=94=92 form =
could more easily be
>> done by targeting aliases instead of node labels.
>>=20
>> I.e. You can apply the overlay, set an alias to the node and instead =
of referencing
>> the label, reference the alias.
> But the patching is done before the overlays are applied, in isolation
> from the base tree, so that they can still be used with the kernel
> configfs overlay mechanism. How do aliases (which associated symbols
> with absolute paths) help?
>=20

An alias is the standard way to refer to nodes symbolically. They can be =
overwritten at
runtime without triggering an error.

>> Again, this is a stop-gap until the portable connector is done, but =
what I take out
>> of this is the need for a parameterization step in which an overlay =
is modified before
>> it is applied according to an external parameter.
> Yes, absolutely.
>=20

Speaking of which, since these overlays are applied at runtime, why not =
build them with a script
and have a #define passed to the c preprocessor before compiling them?

It doesn=92t appear to be a problem doing it this way.=20

> Phil
> =97

Regards

=97 Pantelis
