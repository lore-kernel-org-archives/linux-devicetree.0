From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v4 2/4] ARM64: dts: rockchip: add core dtsi file for
 RK3399 SoCs
Date: Thu, 28 Apr 2016 09:03:53 -0700
Message-ID: <20160428160353.GA95284@google.com>
References: <1461743693-10671-1-git-send-email-jay.xu@rock-chips.com>
 <1461743693-10671-3-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461743693-10671-3-git-send-email-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianqun Xu <jay.xu@rock-chips.com>
Cc: lintao@rock-chips.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, heiko@sntech.de, huangtao@rock-chips.com, davidriley@chromium.org, dianders@chromium.org, jwerner@chromium.org, smbarber@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Heiko, Jianqun,

On Wed, Apr 27, 2016 at 03:54:51PM +0800, Jianqun Xu wrote:
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> new file mode 100644
> index 0000000..5a8a915
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -0,0 +1,1022 @@
[...]
> +	sdhci: sdhci@fe330000 {
> +		compatible = "rockchip,rk3399-sdhci-5.1", "arasan,sdhci-5.1";

Not to rain on the parade too much, as this is already applied, but is
the "rockchip,rk3399-sdhci-5.1" string documented anywhere? I don't see
it.

> +		reg = <0x0 0xfe330000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_EMMC>, <&cru ACLK_EMMC>;
> +		clock-names = "clk_xin", "clk_ahb";
> +		status = "disabled";
> +	};

[...]

Brian
