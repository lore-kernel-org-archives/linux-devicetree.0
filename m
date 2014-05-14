From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/3] media: mx2-emmaprp: Add devicetree support
Date: Wed, 14 May 2014 12:49:03 +0200
Message-ID: <53734A1F.7080905@samsung.com>
References: <1399015119-24000-1-git-send-email-shc_work@mail.ru>
 <537251CA.3070005@samsung.com> <1400001829.645600850@f332.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1400001829.645600850@f332.i.mail.ru>
Sender: linux-media-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <m.chehab@samsung.com>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13/05/14 19:23, Alexander Shiyan wrote:
> Tue, 13 May 2014 19:09:30 +0200 =D0=BE=D1=82 Sylwester Nawrocki <s.na=
wrocki@samsung.com>:
>> > Hi,
>> >=20
>> > On 02/05/14 09:18, Alexander Shiyan wrote:
>>> > > This patch adds devicetree support for the Freescale enhanced M=
ultimedia
>>> > > Accelerator (eMMA) video Pre-processor (PrP).
>>> > >=20
>>> > > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
>>> > > ---
>>> > >  .../devicetree/bindings/media/fsl-imx-emmaprp.txt     | 19 +++=
++++++++++++++++
>>> > >  drivers/media/platform/mx2_emmaprp.c                  |  8 +++=
+++++
>>> > >  2 files changed, 27 insertions(+)
>>> > >  create mode 100644 Documentation/devicetree/bindings/media/fsl=
-imx-emmaprp.txt
>>> > >=20
>>> > > diff --git a/Documentation/devicetree/bindings/media/fsl-imx-em=
maprp.txt b/Documentation/devicetree/bindings/media/fsl-imx-emmaprp.txt
>>> > > new file mode 100644
>>> > > index 0000000..9e8238f
>>> > > --- /dev/null
>>> > > +++ b/Documentation/devicetree/bindings/media/fsl-imx-emmaprp.t=
xt
>>> > > @@ -0,0 +1,19 @@
>>> > > +* Freescale enhanced Multimedia Accelerator (eMMA) video Pre-p=
rocessor (PrP)
>>> > > +  for i.MX.
>>> > > +
>>> > > +Required properties:
>>> > > +- compatible : Shall contain "fsl,imx21-emmaprp".
>>> > > +- reg        : Offset and length of the register set for the d=
evice.
>>> > > +- interrupts : Should contain eMMA PrP interrupt number.
>>> > > +- clocks     : Should contain the ahb and ipg clocks, in the o=
rder
>>> > > +               determined by the clock-names property.
>>> > > +- clock-names: Should be "ahb", "ipg".
>>> > > +
>>> > > +Example:
>>> > > +	emmaprp: emmaprp@10026400 {
>>> > > +		compatible =3D "fsl,imx27-emmaprp", "fsl,imx21-emmaprp";
>> >=20
>> > Is "fsl,imx27-emmaprp" compatible documented somewhere ?
>
> The overall structure of the eMMA module is slightly different.
> As for the part of the PrP, according to the datasheet they are compa=
tible.

Then can we please have all the valid compatible strings listed at the
'compatible' property's description above ? I think it is useful to hav=
e
an indication to which SoC each of them apply in documentation of the
binding.

--
Thanks,
Sylwester
