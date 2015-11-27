From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/3] ARM: dts: dove: add Dove divider clocks
Date: Fri, 27 Nov 2015 21:12:12 +0100
Message-ID: <20151127201212.GE14645@lunn.ch>
References: <E1a24wu-0004jh-3M@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1a24wu-0004jh-3M@rmk-PC.arm.linux.org.uk>
Sender: linux-clk-owner@vger.kernel.org
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 10:23:32PM +0000, Russell King wrote:
> Add the Dove divider clocks to the Dove dtsi file.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Acked-by: Andrew Lunn <andrew@lunn.ch>

	  Andrew

> ---
>  arch/arm/boot/dts/dove.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
> index 179121630ad7..ea36a262d056 100644
> --- a/arch/arm/boot/dts/dove.dtsi
> +++ b/arch/arm/boot/dts/dove.dtsi
> @@ -459,6 +459,12 @@
>  					#clock-cells = <1>;
>  				};
>  
> +				divider_clk: core-clock@0064 {
> +					compatible = "marvell,dove-divider-clock";
> +					reg = <0x0064 0x8>;
> +					#clock-cells = <1>;
> +				};
> +
>  				pinctrl: pin-ctrl@0200 {
>  					compatible = "marvell,dove-pinctrl";
>  					reg = <0x0200 0x14>,
> -- 
> 2.1.0
> 
