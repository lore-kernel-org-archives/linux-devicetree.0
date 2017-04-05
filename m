From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] dt: bindings: add pmu0 regs for USB
 PHYs on Allwinner H3/V3s/A64
Date: Wed, 5 Apr 2017 18:28:20 +0530
Message-ID: <1524732c-b72f-61ce-8ae7-1d764f85c903@ti.com>
References: <20170405125053.6170-1-icenowy@aosc.io>
 <20170405125053.6170-2-icenowy@aosc.io>
Reply-To: kishon-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCOOP4VF5IDRBA6USPDQKGQELZRE65Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170405125053.6170-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Wednesday 05 April 2017 06:20 PM, Icenowy Zheng wrote:
> From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> 
> Allwinner H3/V3s/A64 SoCs have a special USB PHY0 that can route to two
> controllers: one is MUSB and the other is a EHCI/OHCI pair.
> 
> When it's routed to EHCI/OHCI pair, it will needs a "pmu0" regs to
> tweak, like other EHCI/OHCI pairs in Allwinner SoCs.
> 
> Add this to the binding of USB PHYs on Allwinner H3/V3s/A64.
> 
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Signed-off-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
> ---
> 
> Kishon, could you push this to 4.11?

Is this for the patch titled "phy: sun4i-usb: add support for V3s USB PHY" that
was added during the last merge window.

this patch looks simpler enough to be merged in this -rc cycle. However it
depends on Greg KH.

Thanks
Kishon

> 
>  Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> index e42334258185..005bc22938ff 100644
> --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> @@ -15,6 +15,7 @@ Required properties:
>  - reg : a list of offset + length pairs
>  - reg-names :
>    * "phy_ctrl"
> +  * "pmu0" for H3, V3s and A64
>    * "pmu1"
>    * "pmu2" for sun4i, sun6i or sun7i
>  - #phy-cells : from the generic phy bindings, must be 1
> 
