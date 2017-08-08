From: "'Kishon Vijay Abraham I' via linux-sunxi" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH 1/8] dt-bindings: phy: sun4i-usb-phy: Add
 property descriptions for H3
Date: Tue, 8 Aug 2017 17:46:33 +0530
Message-ID: <c7dfc4e8-7a4e-e57d-e1e8-16f0a56cd505@ti.com>
References: <20170803081411.22389-1-wens@csie.org>
 <20170803081411.22389-2-wens@csie.org>
Reply-To: kishon-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCOOP4VF5IDRBMGXU3GAKGQEVTOTQWI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20170803081411.22389-2-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Thursday 03 August 2017 01:44 PM, Chen-Yu Tsai wrote:
> The Allwinner H3 SoC has 4 USB PHYs, so it needs four sets of pmu
> regions, clocks, resets, and optional vbus properties. These were
> not described when the H3 compatible string was added.
> 
> Fixes: 626a630e003c ("phy-sun4i-usb: Add support for the host usb-phys
> 		      found on the H3 SoC")
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Rob, can you give your Acked-by for this patch?

Thanks
Kishon
> ---
>  Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> index 005bc22938ff..893dd01dfe64 100644
> --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> @@ -17,18 +17,21 @@ Required properties:
>    * "phy_ctrl"
>    * "pmu0" for H3, V3s and A64
>    * "pmu1"
> -  * "pmu2" for sun4i, sun6i or sun7i
> +  * "pmu2" for sun4i, sun6i, sun7i or sun8i-h3
> +  * "pmu3" for sun8i-h3
>  - #phy-cells : from the generic phy bindings, must be 1
>  - clocks : phandle + clock specifier for the phy clocks
>  - clock-names :
>    * "usb_phy" for sun4i, sun5i or sun7i
>    * "usb0_phy", "usb1_phy" and "usb2_phy" for sun6i
>    * "usb0_phy", "usb1_phy" for sun8i
> +  * "usb0_phy", "usb1_phy", "usb2_phy" and "usb3_phy" for sun8i-h3
>  - resets : a list of phandle + reset specifier pairs
>  - reset-names :
>    * "usb0_reset"
>    * "usb1_reset"
> -  * "usb2_reset" for sun4i, sun6i or sun7i
> +  * "usb2_reset" for sun4i, sun6i, sun7i or sun8i-h3
> +  * "usb3_reset" for sun8i-h3
>  
>  Optional properties:
>  - usb0_id_det-gpios : gpio phandle for reading the otg id pin value
> @@ -37,6 +40,7 @@ Optional properties:
>  - usb0_vbus-supply : regulator phandle for controller usb0 vbus
>  - usb1_vbus-supply : regulator phandle for controller usb1 vbus
>  - usb2_vbus-supply : regulator phandle for controller usb2 vbus
> +- usb3_vbus-supply : regulator phandle for controller usb3 vbus
>  
>  Example:
>  	usbphy: phy@0x01c13400 {
> 
