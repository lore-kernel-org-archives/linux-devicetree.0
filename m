From: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/2][v2] ARM: dts: Add big-endian for IFC on LS1021A
Date: Thu, 21 Dec 2017 07:19:12 +0000
Message-ID: <HE1PR04MB1241243DE5FE86833DD0B509970D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1512013344-4042-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512013344-4042-2-git-send-email-prabhakar.kushwaha@nxp.com>
 <HE1PR04MB1241E7538E97597B76606FF4970D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <20171221071056.GF3766@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221071056.GF3766@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alison Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>, Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Thursday, December 21, 2017 12:41 PM
> To: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> Alison Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>; Jagdish Gediya
> <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH 1/2][v2] ARM: dts: Add big-endian for IFC on LS1021A
>=20
> On Thu, Dec 21, 2017 at 05:14:36AM +0000, Prabhakar Kushwaha wrote:
> > Hi Shawn,
> >
> > > -----Original Message-----
> > > From: Prabhakar Kushwaha [mailto:prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org]
> > > Sent: Thursday, November 30, 2017 9:12 AM
> > > To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org=
;
> > > shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
> > > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Jagdish Gediya
> > > <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>; Alison Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>;
> Prabhakar
> > > Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
> > > Subject: [PATCH 1/2][v2] ARM: dts: Add big-endian for IFC on LS1021A
> > >
> > > From: Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>
> > >
> > > For the patch to update struct map_info's swap field based on device
> > > characteristics defined in device tree, big-endian parameter is added
> > > for LS1021A.
> > >
> > > Signed-off-by: Alison Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>
> > > Signed-off-by: Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>
> > > Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
> > > ---
> > > Changes for v2: updated subject
> > >
> > >  arch/arm/boot/dts/ls1021a.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls102=
1a.dtsi
> > > index 9319e1f..babb086 100644
> > > --- a/arch/arm/boot/dts/ls1021a.dtsi
> > > +++ b/arch/arm/boot/dts/ls1021a.dtsi
> > > @@ -145,6 +145,7 @@
> > >  		ifc: ifc@1530000 {
> > >  			compatible =3D "fsl,ifc", "simple-bus";
> > >  			reg =3D <0x0 0x1530000 0x0 0x10000>;
> > > +			big-endian;
> > >  			interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> > >  		};
> > >
> > > --
> > > 1.9.1
> >
> > There are no review comments on this patch.
> >
> > Can you please accept this patch
>=20
> It seems that the bindings hasn't been ACK-ed by DT maintainer.
>=20

Are you referring to this discussion https://patchwork.ozlabs.org/patch/842=
543/?
 Due to which binding are not ACK-ed.

--pk


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
