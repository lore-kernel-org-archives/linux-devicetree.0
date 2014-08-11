From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: rockchip: add rk3288 dma controllers
Date: Mon, 11 Aug 2014 19:37:29 +0100
Message-ID: <53E90D69.6000307@suse.de>
References: <1406661128-7614-1-git-send-email-heiko@sntech.de> <1406661128-7614-4-git-send-email-heiko@sntech.de> <CAD=FV=VWBh3STfZWLDuYerS9wiceQL=UEJyjqp0-GLh0=-hTdw@mail.gmail.com> <1560376.L4H27Lgx9N@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1560376.L4H27Lgx9N@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 11.08.2014 19:01, schrieb Heiko St=FCbner:
> Also for an upcoming v2, I've also changed the structure a bit, as th=
e first=20
> dma-controller has both a secure and non-secure version of it.
> So currently the rk3288.dtsi looks like [0]:
>=20
> 	amba {
> 		compatible =3D "arm,amba-bus";
> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
> 		ranges;
>=20
> 		/* dma1 in secure state */
> 		dma-controller@ffb20000 {
> 			compatible =3D "arm,pl330", "arm,primecell";
> 			reg =3D <0xffb20000 0x4000>;
> 			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> 				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> 			#dma-cells =3D <1>;
> 			clocks =3D <&cru ACLK_DMAC1>;
> 			clock-names =3D "apb_pclk";
> 			status =3D "disabled";
> 		};
>=20
> 		/* dma1 in non-secure state */
> 		dma-controller@ffb60000 {
> 			compatible =3D "arm,pl330", "arm,primecell";
> 			reg =3D <0xffb60000 0x4000>;
> 			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> 				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> 			#dma-cells =3D <1>;
> 			clocks =3D <&cru ACLK_DMAC1>;
> 			clock-names =3D "apb_pclk";
> 			status =3D "disabled";
> 		};
>=20
> 		dmac2: dma-controller@ff250000 {
> 			compatible =3D "arm,pl330", "arm,primecell";
> 			reg =3D <0xff250000 0x4000>;
> 			interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> 				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> 			#dma-cells =3D <1>;
> 			clocks =3D <&cru ACLK_DMAC2>;
> 			clock-names =3D "apb_pclk";
> 		};
> 	};
>=20
> and the board is responsible for enabling the correct variant [1], as=
 most=20
> likely the bootloader decides in which mode to start the dma controll=
er:
>=20
> 	amba {
> 		/* dma1 in secure state */
> 		dmac1: dma-controller@ffb20000 {
> 			status =3D "okay";
> 		};
> 	};
>=20
> This is based on some mailinglist discussion, I found at some point, =
about=20
> this but for the life of me am not able to find anymore. So of course=
 feedback=20
> would appreciated there too.

I would suggest to give labels such as dmac1_s and dmac1_ns like you di=
d
for dmac2 in the former snippet, so that you can override the status in
the latter without replicating the amba/dma-controller hierarchy.

However, for the Zynq SoC we chose to just model the secure DMAC though
[*]. I was told that either the bootloader or the user should change th=
e
DT when running in such a non-secure scenario.

Cheers,
Andreas

[*] https://patchwork.kernel.org/patch/4620251/

> [0] https://github.com/mmind/linux-rockchip/blob/devel/workbench/arch=
/arm/boot/dts/rk3288.dtsi
> [1] https://github.com/mmind/linux-rockchip/blob/devel/workbench/arch=
/arm/boot/dts/rk3288-evb.dtsi
[snip]

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
