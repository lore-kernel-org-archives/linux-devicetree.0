From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] bus: imx-weim: support CS GPR config for imx6q-weim
Date: Sun, 16 Feb 2014 21:10:36 +0800
Message-ID: <20140216131034.GF2946@S2101-09.ap.freescale.net>
References: <1392539924-23583-1-git-send-email-shawn.guo@linaro.org>
 <20140216105636.GE2946@S2101-09.ap.freescale.net>
 <1392548881.675863030@f320.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392548881.675863030-vsKlnG5ePthsdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 16, 2014 at 03:08:01PM +0400, Alexander Shiyan wrote:
> =D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5, 1=
6 =D1=84=D0=B5=D0=B2=D1=80=D0=B0=D0=BB=D1=8F 2014, 18:56 +08:00 =D0=BE=D1=
=82 Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> > On Sun, Feb 16, 2014 at 04:38:44PM +0800, Shawn Guo wrote:
> > > @@ -56,6 +59,55 @@ static const struct of_device_id weim_id_table=
[] =3D {
> > >  };
> > >  MODULE_DEVICE_TABLE(of, weim_id_table);
> > > =20
> > > +static int __init imx6q_weim_gpr_setup(struct platform_device *p=
dev)
> > > +{
> > > +	struct device_node *np =3D pdev->dev.of_node;
> > > +	struct property *prop;
> > > +	const __be32 *p;
> > > +	struct regmap *gpr;
> > > +	u32 gprvals[4] =3D {
> > > +		05,	/* CS0(128M) CS1(0M)  CS2(0M)  CS3(0M) */
> > > +		033,	/* CS0(64M)  CS1(64M) CS2(0M)  CS3(0M) */
> > > +		0113,	/* CS0(64M)  CS1(32M) CS2(32M) CS3(0M) */
> > > +		01111,	/* CS0(64M)  CS1(32M) CS2(32M) CS3(0M) */
> > > +	};
> > > +	u32 gprval =3D 0;
> > > +	u32 val;
> > > +	int cs =3D 0;
> > > +	int i =3D 0;
> > > +
> > > +	gpr =3D syscon_regmap_lookup_by_compatible("fsl,imx6q-iomuxc-gp=
r");
> >=20
> > When trying to improve the bindings doc imx-weim.txt, I checked har=
dware
> > manuals and found that SoCs imx50, imx53, imx6q, imx6dl and imx6sl =
all
> > need the same CS GPR setup.  It's inappropriate to look up by hard-=
coded
> > compatible "fsl,imx6q-iomuxc-gpr" then.  So I'm going to add the
> > property fsl,weim-cs-gpr back, and update bindings doc accordingly.
>=20
> You can add additional call into struct imx_weim_devtype for handle
> soc-specific stuff.

Yes, imx_weim_devtype is the place to code soc-specific stuff.  But for
this particular case, an additional DT property is more flexible.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
