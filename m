From: =?iso-8859-1?Q?Br=FCns=2C_Stefan?= <Stefan.Bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH 1/5] dt-bindings: allow dwmac-sun8i to use
 other devices' exported regmap
Date: Wed, 11 Apr 2018 14:36:19 +0000
Message-ID: <2600251.cZke1zkLXN@sbruens-linux>
References: <20180411141641.14675-1-icenowy@aosc.io>
 <20180411141641.14675-2-icenowy@aosc.io>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBZF2XDLAKGQEXJ3UAUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180411141641.14675-2-icenowy-h8G6r0blFSE@public.gmane.org>
Content-Language: en-US
Content-ID: <D7F87D293F40A54E820A5050931C2521-KnNo0XtUZUuELgA04lAiVw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "icenowy-h8G6r0blFSE@public.gmane.org" <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mittwoch, 11. April 2018 16:16:37 CEST Icenowy Zheng wrote:
> On some Allwinner SoCs the EMAC clock register needed by dwmac-sun8i is
> in another device's memory space. In this situation dwmac-sun8i can use
> a regmap exported by the other device with only the EMAC clock register.
> 
> Document this situation in the dwmac-sun8i device tree binding
> documentation.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
> b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt index
> 3d6d5fa0c4d5..0c5f63a80617 100644
> --- a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
> +++ b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
> @@ -20,8 +20,9 @@ Required properties:
>  - phy-handle: See ethernet.txt
>  - #address-cells: shall be 1
>  - #size-cells: shall be 0
> -- syscon: A phandle to the syscon of the SoC with one of the following
> - compatible string:
> +- syscon: A phandle to a device which exports the EMAC clock register as a
> + regmap or to the syscon of the SoC with one of the following compatible
... regmap, or ...

> + string:
string_s_:

>    - allwinner,sun8i-h3-system-controller
>    - allwinner,sun8i-v3s-system-controller
>    - allwinner,sun50i-a64-system-controller

Kind regards,

Stefan
