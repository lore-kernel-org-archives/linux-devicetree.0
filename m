From: Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>
Subject: Re: [PATCH v4] bus: imx-weim: support CS GPR configuration
Date: Mon, 17 Feb 2014 11:52:24 +0100
Message-ID: <20140217105224.GA10559@frolo.macqel>
References: <1392559381-30842-1-git-send-email-shawn.guo@linaro.org> <1392560564.725313659@f356.i.mail.ru> <20140216143114.GH2946@S2101-09.ap.freescale.net> <20140217085221.GB23095@frolo.macqel> <20140217092243.GB10731@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140217092243.GB10731-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 17, 2014 at 05:22:47PM +0800, Shawn Guo wrote:
> On Mon, Feb 17, 2014 at 09:52:21AM +0100, Philippe De Muyter wrote:
> > On Sun, Feb 16, 2014 at 10:31:16PM +0800, Shawn Guo wrote:
> > > On Sun, Feb 16, 2014 at 06:22:44PM +0400, Alexander Shiyan wrote:
> > > > =D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=
=B5, 16 =D1=84=D0=B5=D0=B2=D1=80=D0=B0=D0=BB=D1=8F 2014, 22:03 +08:00 =D0=
=BE=D1=82 Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> > > > > For imx50-weim and imx6q-weim type of devices, there might a =
WEIM CS
> > > > > space configuration register in General Purpose Register cont=
roller,
> > > > > e.g. IOMUXC_GPR1 on i.MX6Q.
> > > > ...
> > > > > +static int __init imx_weim_gpr_setup(struct platform_device =
*pdev)
> > > > > +{
> > > > > +	struct device_node *np =3D pdev->dev.of_node;
> > > > > +	struct property *prop;
> > > > > +	const __be32 *p;
> > > > > +	struct regmap *gpr;
> > > > > +	u32 gprvals[4] =3D {
> > > > > +		05,	/* CS0(128M) CS1(0M)  CS2(0M)  CS3(0M) */
> > > > > +		033,	/* CS0(64M)  CS1(64M) CS2(0M)  CS3(0M) */
> > > > > +		0113,	/* CS0(64M)  CS1(32M) CS2(32M) CS3(0M) */
> > > > > +		01111,	/* CS0(64M)  CS1(32M) CS2(32M) CS3(0M) */
> > > > > +	};
> > > > > +	u32 gprval =3D 0;
> > > > > +	u32 val;
> > > > > +	int cs =3D 0;
> > > > > +	int i =3D 0;
> > > > > +
> > > > > +	gpr =3D syscon_regmap_lookup_by_phandle(np, "fsl,weim-cs-gp=
r");
> > > > > +	if (IS_ERR(gpr)) {
> > > > > +		dev_dbg(&pdev->dev, "failed to find weim-cs-gpr\n");
> > > > > +		return 0;
> > > >=20
> > > > Only one comment:
> > > > You do not use these error codes in the probe(),
> > > > so let's declare this function as void.
> > >=20
> > > Oh, yes.  I should check return of imx_weim_gpr_setup() in probe(=
).
> > > Will add in the next version.
> >=20
> > Well, as all the error cases are already covered by error messages,=
 there is
> > no added value in testing that again in probe().  As Alexander wrot=
e, you can
> > declare imx_weim_gpr_setup() as 'void'.
>=20
> Hmm, shouldn't we stop probing when running into the error of invalid
> ranges configuration?

I agree, we could do that :)

Philippe

--=20
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Brux=
elles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
