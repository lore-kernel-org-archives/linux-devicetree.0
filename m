From: "S.H. Xie" <shaohui.xie-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 3/7] [v2] arm64: dts: add QorIQ LS1046A SoC support
Date: Fri, 9 Sep 2016 06:48:14 +0000
Message-ID: <DB5PR0401MB218327FA907E7224994C09BCE8FA0@DB5PR0401MB2183.eurprd04.prod.outlook.com>
References: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
 <1473069695-33092-4-git-send-email-shh.xie@gmail.com>
 <20160908131326.GE26570@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160908131326.GE26570@leverpostej>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, Vincent Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>, Horia Geanta Neag <horia.geanta-3arQi8VN3Tc@public.gmane.org>, Mihai Emilian Bantea <mihai.bantea-3arQi8VN3Tc@public.gmane.org>, "C.H. Zhao" <chenhui.zhao-3arQi8VN3Tc@public.gmane.org>, "Q.Y. Gong" <qianyu.gong-3arQi8VN3Tc@public.gmane.org>, "M.H. Lian" <minghuan.lian-3arQi8VN3Tc@public.gmane.org>, "Z.Q. Hou" <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > +	pmu {
> > +		compatible =3D "arm,armv8-pmuv3";
> > +		interrupts =3D <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-affinity =3D <&cpu0>,
> > +				     <&cpu1>,
> > +				     <&cpu2>,
> > +				     <&cpu3>;
> > +	};
>=20
> The compatible string should be "arm,cortex-a72-pmu".
[S.H] Will fix it in next version.

Thanks,
Shaohui
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
