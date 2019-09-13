From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Fix PWM3
Date: Fri, 13 Sep 2019 10:23:37 +0200
Message-ID: <20190913082336.266xwzvigpggnt3z@verge.net.au>
References: <20190912103143.985-1-kieran.bingham+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190912103143.985-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@glider.be>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 11:31:43AM +0100, Kieran Bingham wrote:
> The pwm3 was incorrectly added with a compatible reference to the
> renesas,pwm-r8a7790 (H2) due to a single characther ommision.
> 
> Fix the compatible string.
> 
> Fixes: de625477c632 ("arm64: dts: renesas: r8a779{7|8}0: add PWM support")
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index 2c4ab70e2a39..74c2c0024e45 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -652,7 +652,7 @@
>  		};
>  
>  		pwm3: pwm@e6e33000 {
> -			compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
> +			compatible = "renesas,pwm-r8a77970", "renesas,pwm-rcar";
>  			reg = <0 0xe6e33000 0 8>;
>  			#pwm-cells = <2>;
>  			clocks = <&cpg CPG_MOD 523>;
> -- 
> 2.20.1
> 
