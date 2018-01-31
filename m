From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v8 04/11] ARM: dts: r7s72100: Add Capture Engine Unit
 (CEU)
Date: Wed, 31 Jan 2018 11:07:44 +0300
Message-ID: <567f779c-591c-4798-a8d0-504d25c439de@cogentembedded.com>
References: <1517306302-27957-1-git-send-email-jacopo+renesas@jmondi.org>
 <1517306302-27957-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1517306302-27957-5-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com, geert@glider.be, hverkuil@xs4all.nl, mchehab@kernel.org, festevam@gmail.com, sakari.ailus@iki.fi, robh+dt@kernel.org, mark.rutland@arm.com, pombredanne@nexb.com
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 1/30/2018 12:58 PM, Jacopo Mondi wrote:

> Add Capture Engine Unit (CEU) node to device tree.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
>   arch/arm/boot/dts/r7s72100.dtsi | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index ab9645a..5fe62f9 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
[...]
> @@ -667,4 +667,13 @@
>   		power-domains = <&cpg_clocks>;
>   		status = "disabled";
>   	};
> +
> +	ceu: ceu@e8210000 {

    The DT spec dictates the generic node names should be used. For the R-Car 
VIN we use "video@...", hence I suggest that use the same here.

> +		reg = <0xe8210000 0x3000>;
> +		compatible = "renesas,r7s72100-ceu";
> +		interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&mstp6_clks R7S72100_CLK_CEU>;
> +		power-domains = <&cpg_clocks>;
> +		status = "disabled";
> +	};
>   };

MBR, Sergei
