From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH 3/3] media: mx2-emmaprp: Add devicetree support
Date: Thu, 15 May 2014 09:19:35 +0800
Message-ID: <20140515011933.GA10685@dragon>
References: <1399015119-24000-1-git-send-email-shc_work@mail.ru>
 <1400001829.645600850@f332.i.mail.ru> <53734A1F.7080905@samsung.com>
 <1400086794.204219517@f388.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400086794.204219517@f388.i.mail.ru>
Sender: linux-media-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <m.chehab@samsung.com>, devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, May 14, 2014 at 08:59:54PM +0400, Alexander Shiyan wrote:
> Wed, 14 May 2014 12:49:03 +0200 =D0=BE=D1=82 Sylwester Nawrocki <s.na=
wrocki@samsung.com>:
> > On 13/05/14 19:23, Alexander Shiyan wrote:
> > > Tue, 13 May 2014 19:09:30 +0200 =D0=BE=D1=82 Sylwester Nawrocki <=
s.nawrocki@samsung.com>:
> > >> > Hi,
> > >> >=20
> > >> > On 02/05/14 09:18, Alexander Shiyan wrote:
> > >>> > > This patch adds devicetree support for the Freescale enhanc=
ed Multimedia
> > >>> > > Accelerator (eMMA) video Pre-processor (PrP).
> > >>> > >=20
> > >>> > > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> > >>> > > ---
> > >>> > >  .../devicetree/bindings/media/fsl-imx-emmaprp.txt     | 19=
 +++++++++++++++++++
> > >>> > >  drivers/media/platform/mx2_emmaprp.c                  |  8=
 ++++++++
> > >>> > >  2 files changed, 27 insertions(+)
> > >>> > >  create mode 100644 Documentation/devicetree/bindings/media=
/fsl-imx-emmaprp.txt
> > >>> > >=20
> > >>> > > diff --git a/Documentation/devicetree/bindings/media/fsl-im=
x-emmaprp.txt b/Documentation/devicetree/bindings/media/fsl-imx-emmaprp=
=2Etxt
> > >>> > > new file mode 100644
> > >>> > > index 0000000..9e8238f
> > >>> > > --- /dev/null
> > >>> > > +++ b/Documentation/devicetree/bindings/media/fsl-imx-emmap=
rp.txt
> > >>> > > @@ -0,0 +1,19 @@
> > >>> > > +* Freescale enhanced Multimedia Accelerator (eMMA) video P=
re-processor (PrP)
> > >>> > > +  for i.MX.
> > >>> > > +
> > >>> > > +Required properties:
> > >>> > > +- compatible : Shall contain "fsl,imx21-emmaprp".
> > >>> > > +- reg        : Offset and length of the register set for t=
he device.
> > >>> > > +- interrupts : Should contain eMMA PrP interrupt number.
> > >>> > > +- clocks     : Should contain the ahb and ipg clocks, in t=
he order
> > >>> > > +               determined by the clock-names property.
> > >>> > > +- clock-names: Should be "ahb", "ipg".
> > >>> > > +
> > >>> > > +Example:
> > >>> > > +	emmaprp: emmaprp@10026400 {
> > >>> > > +		compatible =3D "fsl,imx27-emmaprp", "fsl,imx21-emmaprp";
> > >> >=20
> > >> > Is "fsl,imx27-emmaprp" compatible documented somewhere ?
> > >
> > > The overall structure of the eMMA module is slightly different.
> > > As for the part of the PrP, according to the datasheet they are c=
ompatible.
> >=20
> > Then can we please have all the valid compatible strings listed at =
the
> > 'compatible' property's description above ? I think it is useful to=
 have
> > an indication to which SoC each of them apply in documentation of t=
he
> > binding.
>=20
> Traditionally, i.MX drivers uses youngest chip for compatibility stri=
ng.
> The best example of this: drivers/bus/imx-weim.c

I guess Sylwester's point is either "fsl,imx27-emmaprp" is documented i=
n
the bindings or it shouldn't be used anywhere.

Shawn
