From: "Y.B. Lu" <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [v2, 1/5] mmc: dt: add compatible into eSDHC required properties
Date: Fri, 5 May 2017 03:01:04 +0000
Message-ID: <DB6PR0401MB2536CB3661070921AEA0C5B6F8EB0@DB6PR0401MB2536.eurprd04.prod.outlook.com>
References: <1493894940-47452-1-git-send-email-yangbo.lu@nxp.com>
 <1493894940-47452-2-git-send-email-yangbo.lu@nxp.com>
 <20170505023651.GW18578@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170505023651.GW18578@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>, Xiaobo Xie <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,


> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Friday, May 05, 2017 10:37 AM
> To: Y.B. Lu
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; Rob Herring; Catalin Marinas; Harninder Rai;
> Xiaobo Xie
> Subject: Re: [v2, 1/5] mmc: dt: add compatible into eSDHC required
> properties
>=20
> On Thu, May 04, 2017 at 06:48:56PM +0800, Yangbo Lu wrote:
> > This patch is to add compatible into eSDHC required properties.
> >
> > Signed-off-by: Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
> > ---
> > Changes for v2:
> > 	- Added this patch.
> > ---
> >  Documentation/devicetree/bindings/mmc/fsl-esdhc.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt
> > b/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt
> > index dedfb02..b04b248 100644
> > --- a/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt
> > +++ b/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt
> > @@ -7,6 +7,7 @@ This file documents differences between the core
> > properties described  by mmc.txt and the properties used by the sdhci-
> esdhc driver.
> >
> >  Required properties:
> > +  - compatible : should be "fsl,esdhc", or "fsl,<chip>-esdhc".
>=20
> I think either supported <chip> or the compatible should be listed
> explicitly.
>=20

[Lu Yangbo-B47093] I think the reason we use <chip> is to avoid listing too=
 much chips, and to avoid doc updating if new chips are added.
The checkpatch script also had considered that.

Currently there're about 20 platforms with "fsl,<chip>-esdhc" compatible in=
 kernel dts.
And the doc also provide an example.
Example:

sdhci@2e000 {
        compatible =3D "fsl,mpc8378-esdhc", "fsl,esdhc";

Should we still need to list all ?

Thanks.

> Shawn
>=20
> >    - interrupt-parent : interrupt source phandle.
> >    - clock-frequency : specifies eSDHC base clock frequency.
> >
> > --
> > 2.1.0.27.g96db324
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
