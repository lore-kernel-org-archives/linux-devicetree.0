From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2] ARM: zynq: DT: Add CAN node
Date: Fri, 25 Jul 2014 08:00:17 -0700
Message-ID: <bed4104c-c177-4c6d-bffe-3535b9c0d354@BN1AFFO11FD029.protection.gbl>
References: <56bf20294d106e0fc9c23a70cd991a50b441d0aa.1406271138.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56bf20294d106e0fc9c23a70cd991a50b441d0aa.1406271138.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, Appana Durga Kedareswara Rao <appanad@xilinx.com>, monstr@monstr.eu, Josh Cartwright <josh.cartwright@ni.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-07-25 at 08:52AM +0200, Michal Simek wrote:
> Add node describing Zynq's CAN controller.
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>=20
> Changes in v2:
> - Add can1
> - Enable can0 for zc702
> - Use status property
>=20
>  arch/arm/boot/dts/zynq-7000.dtsi | 26 +++++++++++++++++++++++++-
>  arch/arm/boot/dts/zynq-zc702.dts |  4 ++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zyn=
q-7000.dtsi
> index 366ca6434f54..983148111e3a 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -71,7 +71,31 @@
>  			interrupts =3D <0 7 4>;
>  			interrupt-parent =3D <&intc>;
>  			clocks =3D <&clkc 12>;
> -		};
> +		};
> +
> +		can0: can@e0008000 {
> +			compatible =3D "xlnx,zynq-can-1.0";
> +			status =3D "disabled";
> +			clocks =3D <&clkc 19>, <&clkc 36>;
> +			clock-names =3D "can_clk", "pclk";
> +			reg =3D <0xe0008000 0x1000>;
> +			interrupts =3D <0 28 4>;
> +			interrupt-parent =3D <&intc>;
> +			tx-fifo-depth =3D <0x40>;
> +			rx-fifo-depth =3D <0x40>;
> +		};
> +
> +		can1: can@e0009000 {
> +			compatible =3D "xlnx,zynq-can-1.0";
> +			status =3D "disabled";
> +			clocks =3D <&clkc 19>, <&clkc 36>;
The clocks for CAN1 must be outputs 20 and 37 of the clkc.

	S=C3=B6ren
