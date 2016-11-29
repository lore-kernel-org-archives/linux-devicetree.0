From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Tue, 29 Nov 2016 15:11:51 +0200
Message-ID: <CA7DF461-8077-4B11-BDEC-0451C08C0FF6@konsulko.com>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com> <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com> <20161128041228.GJ30927@umbus.fritz.box> <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com> <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org> <20161129021131.GD13307@umbus.fritz.box> <b7ff53f6-6481-e3f1-e3b5-d0b04e563e83@raspberrypi.org> <D3BFA6AB-21C1-451B-ACF5-32EA5E615275@konsulko.com> <66c7f8c5-94e9-a6ca-4402-fa0ccf2a6ac0@raspberrypi.org> <1F9EDF06-98B1-4270-AA58-1A9D9A9F9803@konsulko.com> <ba8e2ed3-9798-3074-1167-3f6851321a25@raspberrypi.org> <96BE1B80-0843-4981-AA2A-E89EA6A02600@konsulko.com> <a1ba4783-2a3b-eefd-9c41-2f33524472fe@raspberrypi.org> <27651F03-6E8F-4C76-A0E4-0DFBEC40277C@konsulko.com> <dbcfc090-43e2-d6f8-6f35-2761bc4d3da1
 @raspberrypi.org> <C5CD81E3-A9FF-4C23-A7A5-7E2A4E80E193@konsulko.com> <c06f9906-6089-c145-3b36-c410d88c786d@raspberrypi.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c06f9906-6089-c145-3b36-c410d88c786d-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Phil,

> On Nov 29, 2016, at 15:11 , Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> wrote:
>=20
> On 29/11/2016 13:08, Pantelis Antoniou wrote:
>> There=92s no difference; you can cpp -IFOO_VALUE=3Dfoo in.dts | dtc | =
cat >/config/foo/dtb in a nutshell.
>>=20
>> And have foo-property =3D FOO_VALUE; in in.dts.
> In a boot loader?
>=20

Ah, that why you don=92t do that in the bootloader :)

Regards

=97 Pantelis
