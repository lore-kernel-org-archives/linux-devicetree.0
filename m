From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] soc: rockchip: add bindings for Rockchip grf
Date: Tue, 23 Feb 2016 16:15:55 -0600
Message-ID: <20160223221555.GA7531@rob-hp-laptop>
References: <1456210864-29037-1-git-send-email-jay.xu@rock-chips.com>
 <1456210864-29037-2-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456210864-29037-2-git-send-email-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "jianqun.xu" <jay.xu@rock-chips.com>
Cc: heiko@sntech.de, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, linus.walleij@linaro.org, sjoerd.simons@collabora.co.uk, jwerner@chromium.org, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dianders@chromium.org, davidriley@chromium.org, smbarber@chromium.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 03:01:01PM +0800, jianqun.xu wrote:
> From: Jianqun Xu <jay.xu@rock-chips.com>
> 
> Add devicetree bindings for Rockchip grf which found on
> Rockchip SoCs.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
> changes in v2:
> - add grf.txt (Heiko)
> 
>  .../devicetree/bindings/soc/rockchip/grf.txt       | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> new file mode 100644
> index 0000000..7fb0410
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
> @@ -0,0 +1,35 @@
> +* Rockchip General Register Files (GRF)
> +
> +The general register file will be used to do static set by software, which
> +is composed of many registers for system control.
> +
> +From RK3368 SoCs, the GRF is divided into two sections,
> +- GRF, used for general non-secure system,
> +- PMUGRF, used for always on sysyem

s/sysyem/system/

Otherwise:

Acked-by: Rob Herring <robh@kernel.org>

> +
> +Required Properties:
> +
> +- compatible: GRF should be one of the followings
> +   - "rockchip,rk3066-grf", "syscon": for rk3066
> +   - "rockchip,rk3188-grf", "syscon": for rk3188
> +   - "rockchip,rk3228-grf", "syscon": for rk3228
> +   - "rockchip,rk3288-grf", "syscon": for rk3288
> +   - "rockchip,rk3368-grf", "syscon": for rk3368
> +   - "rockchip,rk3399-grf", "syscon": for rk3399
> +- compatible: PMUGRF should be one of the followings
> +   - "rockchip,rk3368-pmugrf", "syscon": for rk3368
> +   - "rockchip,rk3399-pmugrf", "syscon": for rk3399
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +Example: GRF and PMUGRF of RK3399 SoCs
> +
> +	pmugrf: syscon@ff320000 {
> +		compatible = "rockchip,rk3399-pmugrf", "syscon";
> +		reg = <0x0 0xff320000 0x0 0x1000>;
> +	};
> +
> +	grf: syscon@ff770000 {
> +		compatible = "rockchip,rk3399-grf", "syscon";
> +		reg = <0x0 0xff770000 0x0 0x10000>;
> +	};
> -- 
> 1.9.1
> 
> 
