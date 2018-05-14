From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77995: Add VIN4
Date: Mon, 14 May 2018 05:36:41 +0300
Message-ID: <3456643.qNU80MrgjU@avalon>
References: <1526032802-14376-1-git-send-email-jacopo+renesas@jmondi.org> <20180511112523.GK18974@bigcity.dyn.berto.se> <20180511134516.omsv25i2wi4cxypc@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180511134516.omsv25i2wi4cxypc@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

On Friday, 11 May 2018 16:45:16 EEST Simon Horman wrote:
> On Fri, May 11, 2018 at 01:25:23PM +0200, Niklas S=F6derlund wrote:
> > Hi Jacopo,
> >=20
> > Thanks for your work.
> >=20
> > On 2018-05-11 12:00:01 +0200, Jacopo Mondi wrote:
> > > Describe VIN4 interface for R-Car D3 R8A77995 SoC.
> > >=20
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >=20
> > Acked-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> >=20
> >> ---
> >>=20
> >>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>=20
> >> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> >> b/arch/arm64/boot/dts/renesas/r8a77995.dtsi index 82aed7e..bdf7017
> >> 100644
> >> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> >> @@ -783,6 +783,17 @@
> >>  				};
> >>  			};
> >>  		};
> >> +
> >> +		vin4: video@e6ef4000 {
> >> +			compatible =3D "renesas,vin-r8a77995";
> >> +			reg =3D <0 0xe6ef4000 0 0x1000>;
> >> +			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> >> +			clocks =3D <&cpg CPG_MOD 807>;
> >> +			power-domains =3D <&sysc R8A77995_PD_ALWAYS_ON>;
> >> +			resets =3D <&cpg 807>;
> >> +			renesas,id =3D <4>;
> >> +			status =3D "disabled";
> >> +		};
> >>  	};
>=20
> Thanks, I have moved the new node to preserve sorting of nodes by bus
> address and applied the result. It is as follows:
>=20
> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Subject: [PATCH] arm64: dts: renesas: r8a77995: Add VIN4
>=20
> Describe VIN4 interface for R-Car D3 R8A77995 SoC.
>=20
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Acked-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> [simon: sorted node by bus address]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77995.dtsi index
> ba98865b0c9b..2506f46293e8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -610,6 +610,17 @@
>  			status =3D "disabled";
>  		};
>=20
> +		vin4: video@e6ef4000 {
> +			compatible =3D "renesas,vin-r8a77995";
> +			reg =3D <0 0xe6ef4000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 807>;
> +			power-domains =3D <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 807>;
> +			renesas,id =3D <4>;
> +			status =3D "disabled";
> +		};
> +
>  		ohci0: usb@ee080000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0 0xee080000 0 0x100>;

=2D-=20
Regards,

Laurent Pinchart
