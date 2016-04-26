From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: marvell: add XOR node for Armada 3700
 SoC
Date: Tue, 26 Apr 2016 09:05:36 +0530
Message-ID: <20160426033536.GD2274@localhost>
References: <1460652818-14647-1-git-send-email-gregory.clement@free-electrons.com>
 <1460652818-14647-6-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460652818-14647-6-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: dmaengine@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Romain Perier <romain.perier@free-electrons.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 06:53:38PM +0200, Gregory CLEMENT wrote:
> From: Marcin Wojtas <mw@semihalf.com>
> 
> Armada 3700 SoC comprise one dual-channel XOR engine and this
> patch adds its according representation.

This need an ACK from ARM folks..

> 
> Signed-off-by: Marcin Wojtas <mw@semihalf.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> index ba9df7ff2a72..932783d82ea9 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -112,6 +112,19 @@
>  				status = "disabled";
>  			};
>  
> +			xor@60900 {
> +				compatible = "marvell,armada-3700-xor";
> +				reg = <0x60900 0x100
> +				       0x60b00 0x100>;
> +
> +				xor10 {
> +					interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +				};
> +				xor11 {
> +					interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +				};
> +			};
> +
>  			sata@e0000 {
>  				compatible = "marvell,armada-3700-ahci";
>  				reg = <0xe0000 0x2000>;
> -- 
> 2.5.0
> 

-- 
~Vinod
