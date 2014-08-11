From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: rockchip: add rk3288 dma controllers
Date: Mon, 11 Aug 2014 21:15:14 +0200
Message-ID: <1897828.6acYlvjf7S@diego>
References: <1406661128-7614-1-git-send-email-heiko@sntech.de> <1560376.L4H27Lgx9N@diego> <53E90D69.6000307@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53E90D69.6000307-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 11. August 2014, 19:37:29 schrieb Andreas F=E4rber:
> Am 11.08.2014 19:01, schrieb Heiko St=FCbner:
> > Also for an upcoming v2, I've also changed the structure a bit, as =
the
> > first dma-controller has both a secure and non-secure version of it=
=2E
> >=20
> > So currently the rk3288.dtsi looks like [0]:
> > 	amba {
> > =09
> > 		compatible =3D "arm,amba-bus";
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <1>;
> > 		ranges;
> > 	=09
> > 		/* dma1 in secure state */
> > 		dma-controller@ffb20000 {
> > 	=09
> > 			compatible =3D "arm,pl330", "arm,primecell";
> > 			reg =3D <0xffb20000 0x4000>;
> > 			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> > 		=09
> > 				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> > 		=09
> > 			#dma-cells =3D <1>;
> > 			clocks =3D <&cru ACLK_DMAC1>;
> > 			clock-names =3D "apb_pclk";
> > 			status =3D "disabled";
> > 	=09
> > 		};
> > 	=09
> > 		/* dma1 in non-secure state */
> > 		dma-controller@ffb60000 {
> > 	=09
> > 			compatible =3D "arm,pl330", "arm,primecell";
> > 			reg =3D <0xffb60000 0x4000>;
> > 			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> > 		=09
> > 				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> > 		=09
> > 			#dma-cells =3D <1>;
> > 			clocks =3D <&cru ACLK_DMAC1>;
> > 			clock-names =3D "apb_pclk";
> > 			status =3D "disabled";
> > 	=09
> > 		};
> > 	=09
> > 		dmac2: dma-controller@ff250000 {
> > 	=09
> > 			compatible =3D "arm,pl330", "arm,primecell";
> > 			reg =3D <0xff250000 0x4000>;
> > 			interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> > 		=09
> > 				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> > 		=09
> > 			#dma-cells =3D <1>;
> > 			clocks =3D <&cru ACLK_DMAC2>;
> > 			clock-names =3D "apb_pclk";
> > 	=09
> > 		};
> > =09
> > 	};
> >=20
> > and the board is responsible for enabling the correct variant [1], =
as most
> >=20
> > likely the bootloader decides in which mode to start the dma contro=
ller:
> > 	amba {
> > =09
> > 		/* dma1 in secure state */
> > 		dmac1: dma-controller@ffb20000 {
> > 	=09
> > 			status =3D "okay";
> > 	=09
> > 		};
> > =09
> > 	};
> >=20
> > This is based on some mailinglist discussion, I found at some point=
, about
> > this but for the life of me am not able to find anymore. So of cour=
se
> > feedback would appreciated there too.
>=20
> I would suggest to give labels such as dmac1_s and dmac1_ns like you =
did
> for dmac2 in the former snippet, so that you can override the status =
in
> the latter without replicating the amba/dma-controller hierarchy.

I was hoping to just keep it to one handle, so that dma consumers would=
 just=20
work and not have to care which dma controller variant was available :-=
) .


> However, for the Zynq SoC we chose to just model the secure DMAC thou=
gh
> [*]. I was told that either the bootloader or the user should change =
the
> DT when running in such a non-secure scenario.

ok, this sounds interesting too, as I haven't seen a board that used th=
e dmac=20
in question in non-secure mode, yet.

So I guess one way to handle it could be to declare the non-secure dma,=
 but=20
set it to a disabled state and use the secure one as default for everyt=
hing:

		dmac_bus_s: dma-controller@ffb20000 {
			compatible =3D "arm,pl330", "arm,primecell";
			reg =3D <0xffb20000 0x4000>;
			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
			#dma-cells =3D <1>;
			clocks =3D <&cru ACLK_DMAC1>;
			clock-names =3D "apb_pclk";
		};

		dmac_bus_ns: dma-controller@ffb60000 {
			compatible =3D "arm,pl330", "arm,primecell";
			reg =3D <0xffb60000 0x4000>;
			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
			#dma-cells =3D <1>;
			clocks =3D <&cru ACLK_DMAC1>;
			clock-names =3D "apb_pclk";
			status =3D "disabled";
		};

and a board wanting to use the non-secure variant would then be require=
d to=20
override the status and the dma channels in question (this dmac does ma=
inly=20
i2s and spdif):

&dmac_bus_s {
	status =3D "disabled";
}:

&dmac_bus_ns {
	status =3D "okay";
};

&i2s0 {
	dmas =3D <&dmac_bus_ns 6>, <&dmac_bus_ns 7>;
};


> [*] https://patchwork.kernel.org/patch/4620251/
>=20
> > [0]
> > https://github.com/mmind/linux-rockchip/blob/devel/workbench/arch/a=
rm/boo
> > t/dts/rk3288.dtsi [1]
> > https://github.com/mmind/linux-rockchip/blob/devel/workbench/arch/a=
rm/boo
> > t/dts/rk3288-evb.dtsi
> [snip]

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
