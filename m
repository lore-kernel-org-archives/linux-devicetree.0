From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v5 6/6] ARM64: dts: marvell: armada-37xx: link USB hosts
 with their PHYs
Date: Wed, 06 Feb 2019 15:30:16 +0100
Message-ID: <875ztx6lc7.fsf@FE-laptop>
References: <20190129093635.4321-1-miquel.raynal@bootlin.com>
 <20190129093635.4321-7-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129093635.4321-7-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Miquel,
 
 On mar., janv. 29 2019, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Reference the PHY nodes from the USB controller nodes.
>
> The USB3 host controller is wired to:
>   * the first PHY of the COMPHY IP
>   * the OTG-capable UTMI PHY
>
> The USB2 host controller is wired to:
>   * the host-only UTMI PHY
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to mvebu/dt64

Thanks,

Gregory


> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> index d2d8ef00c592..c0b1c9146525 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -347,6 +347,8 @@
>  				marvell,usb-misc-reg = <&usb32_syscon>;
>  				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&sb_periph_clk 12>;
> +				phys = <&comphy0 0>, <&usb2_utmi_otg_phy>;
> +				phy-names = "usb3-phy", "usb2-utmi-otg-phy";
>  				status = "disabled";
>  			};
>  
> @@ -368,6 +370,8 @@
>  				reg = <0x5e000 0x1000>;
>  				marvell,usb-misc-reg = <&usb2_syscon>;
>  				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb2_utmi_host_phy>;
> +				phy-names = "usb2-utmi-host-phy";
>  				status = "disabled";
>  			};
>  
> -- 
> 2.19.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
