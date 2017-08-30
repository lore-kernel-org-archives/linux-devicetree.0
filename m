From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: renesas: dw-hdmi: Drop bogus node name suffix
Date: Wed, 30 Aug 2017 13:05:43 +0300
Message-ID: <5881756.p5TDNJ9VNb@avalon>
References: <1504086781-4974-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1504086781-4974-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Wednesday, 30 August 2017 12:53:01 EEST Geert Uytterhoeven wrote:
> Node names should not use numerical suffixes if the nodes can be
> distinguished by unit-address.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> index 83382a422f309dba..19b57f1183f2af3b 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> @@ -37,7 +37,7 @@ Optional properties:
> 
>  Example:
> 
> -	hdmi0: hdmi0@fead0000 {
> +	hdmi0: hdmi@fead0000 {
>  		compatible = "renesas,r8a7795-dw-hdmi";
>  		reg = <0 0xfead0000 0 0x10000>;
>  		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;

-- 
Regards,

Laurent Pinchart
