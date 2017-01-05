From: "M.H. Lian" <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 6/9] arm64: dts: ls1046a: add MSI dts node
Date: Thu, 5 Jan 2017 08:05:19 +0000
Message-ID: <VI1PR04MB1615B59EAEDE661D10CF845FE8600@VI1PR04MB1615.eurprd04.prod.outlook.com>
References: <1482829985-24421-1-git-send-email-Minghuan.Lian@nxp.com>
 <1482829985-24421-6-git-send-email-Minghuan.Lian@nxp.com>
 <20170103171258.h5djzsarokjjldjx@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103171258.h5djzsarokjjldjx@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>, Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Scott Wood <scott.wood-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for your comment.
I will change whitespace.

Thanks,
Minghuan

> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Wednesday, January 04, 2017 1:13 AM
> To: M.H. Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>; Jason
> Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>; Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>; Mingkai
> Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>; Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>; Leo Li
> <leoyang.li-3arQi8VN3Tc@public.gmane.org>; Scott Wood <scott.wood-3arQi8VN3Tc@public.gmane.org>
> Subject: Re: [PATCH 6/9] arm64: dts: ls1046a: add MSI dts node
>=20
> On Tue, Dec 27, 2016 at 05:13:02PM +0800, Minghuan Lian wrote:
> > LS1046a includes 3 MSI controllers.
> > Each controller supports 128 interrupts.
> >
> > Signed-off-by: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  .../interrupt-controller/fsl,ls-scfg-msi.txt       |  1 +
> >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     | 31
> ++++++++++++++++++++++
> >  2 files changed, 32 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl=
,ls-
> scfg-msi.txt b/Documentation/devicetree/bindings/interrupt-
> controller/fsl,ls-scfg-msi.txt
> > index 2755cd1..54597b0 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scf=
g-
> msi.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scf=
g-
> msi.txt
> > @@ -6,6 +6,7 @@ Required properties:
> >  	      Layerscape PCIe MSI controller block such as:
> >                "fsl,ls1021a-msi"
> >                "fsl,ls1043a-msi"
> > +	      "fsl,ls1046a-msi"
>=20
> Differing whitespace.
>=20
> Otherwise,
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
