From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: add usb3 controller node for RK3328
 SoCs
Date: Thu, 14 Mar 2019 20:02:55 +0100
Message-ID: <5530020.nRYjYCbPGH@diego>
References: <20190314182035.7101-1-papadakospan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190314182035.7101-1-papadakospan@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Leonidas P. Papadakos" <papadakospan@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, william.wu@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Am Donnerstag, 14. M=E4rz 2019, 19:20:35 CET schrieb Leonidas P. Papadakos:
> From: William Wu <william.wu@rock-chips.com>
> =

> RK3328 has one USB 3.0 OTG controller which uses DWC_USB3
> core's general architecture. It can act as static xHCI host
> controller, static device controller, USB 3.0/2.0 OTG basing
> on ID of USB3.0 PHY.
> =

> Signed-off-by: William Wu <william.wu@rock-chips.com>
> Signed-off-by: Leonidas P. Papadakos <papadakospan@gmail.com>

the rk3328 usb3-phy has an issue with detecting any plugin events
after a previous device got removed - see the inno-usb3-phy driver
in the vendor kernel.

So once you unplug an usb device from the port it won't detect
a newly connected device. This is also the reason why the original
usb3 patches are still sitting around in my tree, as I don't want to
codify a binding that may not last once somebody actually manages
to go around that issue with kernel code - especially as the node
below claims to be compatible with the rk3399 dwc3.


Heiko

> ---
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 27 ++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3328.dtsi index 84f14b132..f5c1ab596
> 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -917,6 +917,33 @@
>  		status =3D "disabled";
>  	};
> =

> +	usbdrd3: usb@ff600000 {
> +		compatible =3D "rockchip,rk3328-dwc3", "rockchip,rk3399-dwc3";
> +		clocks =3D <&cru SCLK_USB3OTG_REF>, <&cru SCLK_USB3OTG_SUSPEND>,
> +			 <&cru ACLK_USB3OTG>;
> +		clock-names =3D "ref_clk", "suspend_clk",
> +			      "bus_clk";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		status =3D "disabled";
> +
> +		usbdrd_dwc3: dwc3@ff600000 {
> +			compatible =3D "snps,dwc3";
> +			reg =3D <0x0 0xff600000 0x0 0x100000>;
> +			interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +			dr_mode =3D "otg";
> +			phy_type =3D "utmi_wide";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis-u2-freeclk-exists-quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis-tx-ipgap-linecheck-quirk;
> +			status =3D "disabled";
> +		};
> +	};
> +
>  	gic: interrupt-controller@ff811000 {
>  		compatible =3D "arm,gic-400";
>  		#interrupt-cells =3D <3>;
