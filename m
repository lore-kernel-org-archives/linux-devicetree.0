From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: display: amlogic: DT fix
 s/resets-names/reset-names/
Date: Fri, 2 Mar 2018 15:52:38 +0100
Message-ID: <d2be8243-caf1-32e3-bda2-b454a2cc147c@baylibre.com>
References: <1519998993-14398-1-git-send-email-geert+renesas@glider.be>
 <1519998993-14398-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519998993-14398-4-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Chanho Min <chanho.min@lge.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/03/2018 14:56, Geert Uytterhoeven wrote:
> Fixes: 8cceda5349377e30 ("dt-bindings: Add bindings for the Amlogic Meson dw-hdmi extension")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v4:
>   - Add Acked-by,
> 
> v3:
>   - New.
> ---
>  Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
> index bf4a18047309a5f8..d8f6268849f43621 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
> @@ -43,7 +43,7 @@ Required properties:
>    and the Amlogic Meson venci clocks as described in
>    Documentation/devicetree/bindings/clock/clock-bindings.txt,
>    the clocks are soc specific, the clock-names should be "iahb", "isfr", "venci"
> -- resets, resets-names: must have the phandles to the HDMI apb, glue and phy
> +- resets, reset-names: must have the phandles to the HDMI apb, glue and phy
>    resets as described in :
>    Documentation/devicetree/bindings/reset/reset.txt,
>    the reset-names should be "hdmitx_apb", "hdmitx", "hdmitx_phy"
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
