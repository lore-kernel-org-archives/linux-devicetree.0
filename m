From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH 2/5] media: i2c: max2175: Add MAX2175 support
Date: Thu, 17 Nov 2016 12:41:37 +0000
Message-ID: <SG2PR06MB1038F2246828039C76F86318C3B10@SG2PR06MB1038.apcprd06.prod.outlook.com>
References: <1478706284-59134-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <1478706284-59134-3-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <20161114194110.fh6gyhfdciikj7kt@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161114194110.fh6gyhfdciikj7kt@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org" <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, "sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "crope-X3B1VOXEql0@public.gmane.org" <crope-X3B1VOXEql0@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org" <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for the review comments.

> On Wed, Nov 09, 2016 at 03:44:41PM +0000, Ramesh Shanmugasundaram wrote:
> > This patch adds driver support for MAX2175 chip. This is Maxim
> > Integrated's RF to Bits tuner front end chip designed for
> > software-defined radio solutions. This driver exposes the tuner as a
> > sub-device instance with standard and custom controls to configure the
> device.
> >
> > Signed-off-by: Ramesh Shanmugasundaram
> > <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > ---
> >  .../devicetree/bindings/media/i2c/max2175.txt      |   61 +
>=20
> It's preferred that bindings are a separate patch.

OK. I will do the same for the other driver.

>=20
> >  drivers/media/i2c/Kconfig                          |    4 +
> >  drivers/media/i2c/Makefile                         |    2 +
> >  drivers/media/i2c/max2175/Kconfig                  |    8 +
> >  drivers/media/i2c/max2175/Makefile                 |    4 +
> >  drivers/media/i2c/max2175/max2175.c                | 1558
> ++++++++++++++++++++
> >  drivers/media/i2c/max2175/max2175.h                |  108 ++
> >  7 files changed, 1745 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/max2175.txt
> >  create mode 100644 drivers/media/i2c/max2175/Kconfig  create mode
> > 100644 drivers/media/i2c/max2175/Makefile
> >  create mode 100644 drivers/media/i2c/max2175/max2175.c
> >  create mode 100644 drivers/media/i2c/max2175/max2175.h
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/max2175.txt
> > b/Documentation/devicetree/bindings/media/i2c/max2175.txt
> > new file mode 100644
> > index 0000000..69f0dad
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/max2175.txt
> > @@ -0,0 +1,61 @@
> > +Maxim Integrated MAX2175 RF to Bits tuner
> > +-----------------------------------------
> > +
> > +The MAX2175 IC is an advanced analog/digital hybrid-radio receiver
> > +with RF to Bits(r) front-end designed for software-defined radio
> solutions.
> > +
> > +Required properties:
> > +--------------------
> > +- compatible: "maxim,max2175" for MAX2175 RF-to-bits tuner.
> > +- clocks: phandle to the fixed xtal clock.
> > +- clock-names: name of the fixed xtal clock.
> > +- port: child port node of a tuner that defines the local and remote
> > +  endpoints. The remote endpoint is assumed to be an SDR device
> > +  that is capable of receiving the digital samples from the tuner.
> > +
> > +Optional properties:
> > +--------------------
> > +- maxim,slave	      : empty property indicates this is a slave of
> > +			another master tuner. This is used to define two
> > +			tuners in diversity mode (1 master, 1 slave). By
> > +			default each tuner is an individual master.
> > +- maxim,refout-load-pF: load capacitance value (in pF) on reference
>=20
> Please add 'pF' to property-units.txt.

Agreed.

>=20
> > +			output drive level. The possible load values are
> > +			 0pF (default - refout disabled)
> > +			10pF
> > +			20pF
> > +			30pF
> > +			40pF
> > +			60pF
> > +			70pF
> > +- maxim,am-hiz	      : empty property indicates AM Hi-Z filter path is
> > +			selected for AM antenna input. By default this
> > +			filter path is not used.
> > +
> > +Example:
> > +--------
> > +
> > +Board specific DTS file
> > +
> > +/* Fixed XTAL clock node */
> > +maxim_xtal: maximextal {
>=20
> clock {

Agreed.

>=20
> > +	compatible =3D "fixed-clock";
> > +	#clock-cells =3D <0>;
> > +	clock-frequency =3D <36864000>;
> > +};
> > +
> > +/* A tuner device instance under i2c bus */
> > +max2175_0: tuner@60 {
> > +	compatible =3D "maxim,max2175";
> > +	reg =3D <0x60>;
> > +	clocks =3D <&maxim_xtal>;
> > +	clock-names =3D "xtal";
> > +	maxim,refout-load-pF =3D <10>;
> > +
> > +	port {
> > +		max2175_0_ep: endpoint {
> > +			remote-endpoint =3D <&slave_rx_v4l2_sdr_device>;
>=20
> 'v4l2' is not something that should appear in a DT.

OK. I'll leave it as "slave_rx_device".

Thanks,
Ramesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
