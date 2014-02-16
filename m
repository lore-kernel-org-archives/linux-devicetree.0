From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] bus: imx-weim: support CS GPR configuration
Date: Sun, 16 Feb 2014 22:31:16 +0800
Message-ID: <20140216143114.GH2946@S2101-09.ap.freescale.net>
References: <1392559381-30842-1-git-send-email-shawn.guo@linaro.org>
 <1392560564.725313659@f356.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392560564.725313659-xNJVu4UI9wlsdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 16, 2014 at 06:22:44PM +0400, Alexander Shiyan wrote:
> =D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5, 1=
6 =D1=84=D0=B5=D0=B2=D1=80=D0=B0=D0=BB=D1=8F 2014, 22:03 +08:00 =D0=BE=D1=
=82 Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> > For imx50-weim and imx6q-weim type of devices, there might a WEIM C=
S
> > space configuration register in General Purpose Register controller=
,
> > e.g. IOMUXC_GPR1 on i.MX6Q.
> ...
> > +static int __init imx_weim_gpr_setup(struct platform_device *pdev)
> > +{
> > +	struct device_node *np =3D pdev->dev.of_node;
> > +	struct property *prop;
> > +	const __be32 *p;
> > +	struct regmap *gpr;
> > +	u32 gprvals[4] =3D {
> > +		05,	/* CS0(128M) CS1(0M)  CS2(0M)  CS3(0M) */
> > +		033,	/* CS0(64M)  CS1(64M) CS2(0M)  CS3(0M) */
> > +		0113,	/* CS0(64M)  CS1(32M) CS2(32M) CS3(0M) */
> > +		01111,	/* CS0(64M)  CS1(32M) CS2(32M) CS3(0M) */
> > +	};
> > +	u32 gprval =3D 0;
> > +	u32 val;
> > +	int cs =3D 0;
> > +	int i =3D 0;
> > +
> > +	gpr =3D syscon_regmap_lookup_by_phandle(np, "fsl,weim-cs-gpr");
> > +	if (IS_ERR(gpr)) {
> > +		dev_dbg(&pdev->dev, "failed to find weim-cs-gpr\n");
> > +		return 0;
>=20
> Only one comment:
> You do not use these error codes in the probe(),
> so let's declare this function as void.

Oh, yes.  I should check return of imx_weim_gpr_setup() in probe().
Will add in the next version.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
