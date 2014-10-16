From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/4] ARM: dts: add RK3288 suspend support
Date: Thu, 16 Oct 2014 11:20:02 +0100
Message-ID: <20141016102001.GA24714@leverpostej>
References: <1413405987-16196-1-git-send-email-zyw@rock-chips.com>
 <1413406144-16329-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413406144-16329-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "zyw@rock-chips.com" <zyw@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "dianders@chromium.org" <dianders@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tony Xie <xxx@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 15, 2014 at 09:49:04PM +0100, zyw@rock-chips.com wrote:
> From: Chris Zhong <zyw@rock-chips.com>
> 
> add pmu_intmem subnode for suspend, add suspend pinctrl
> 
> Signed-off-by: Tony Xie <xxx@rock-chips.com>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> ---
> 
>  arch/arm/boot/dts/rk3288.dtsi |   11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 5950b0a..081af7a 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -241,6 +241,11 @@
>  		status = "disabled";
>  	};
>  
> +	pmu_intmem@ff720000 {
> +		compatible = "mmio-sram", "rockchip,rk3288-pmu-sram";

These strings should be the other way around -- the most specific string
should be first.

Mark.
