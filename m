From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: media: Add Allwinner
 V3s Camera Sensor Interface (CSI)
Date: Mon, 18 Dec 2017 16:35:51 +0800
Message-ID: <CAGb2v67JhMfba8Ao7WyrYikkxvTxX8WaBRqu3GkrhOCWndresg@mail.gmail.com>
References: <1510558344-45402-1-git-send-email-yong.deng@magewell.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBA743XIQKGQEDNOTL4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1510558344-45402-1-git-send-email-yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree@v>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 13, 2017 at 3:32 PM, Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org> wrote:
> Add binding documentation for Allwinner V3s CSI.
>
> Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/media/sun6i-csi.txt        | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt
>
> diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt b/Documentation/devicetree/bindings/media/sun6i-csi.txt
> new file mode 100644
> index 0000000..f3916a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
> @@ -0,0 +1,51 @@
> +Allwinner V3s Camera Sensor Interface
> +------------------------------
> +
> +Required properties:
> +  - compatible: value must be "allwinner,sun8i-v3s-csi"
> +  - reg: base address and size of the memory-mapped region.
> +  - interrupts: interrupt associated to this IP
> +  - clocks: phandles to the clocks feeding the CSI
> +    * bus: the CSI interface clock
> +    * mod: the CSI module clock
> +    * ram: the CSI DRAM clock
> +  - clock-names: the clock names mentioned above
> +  - resets: phandles to the reset line driving the CSI
> +
> +- ports: A ports node with endpoint definitions as defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +  Currently, the driver only support the parallel interface. So, a single port
> +  node with one endpoint and parallel bus is supported.
> +
> +Example:
> +
> +       csi1: csi@01cb4000 {

Drop the leading zero in the address part.

> +               compatible = "allwinner,sun8i-v3s-csi";
> +               reg = <0x01cb4000 0x1000>;
> +               interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&ccu CLK_BUS_CSI>,
> +                        <&ccu CLK_CSI1_SCLK>,

CSI also has an MCLK. Do you need that one?

ChenYu

> +                        <&ccu CLK_DRAM_CSI>;
> +               clock-names = "bus", "mod", "ram";
> +               resets = <&ccu RST_BUS_CSI>;
> +
> +               port {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       /* Parallel bus endpoint */
> +                       csi1_ep: endpoint {
> +                               remote-endpoint = <&adv7611_ep>;
> +                               bus-width = <16>;
> +                               data-shift = <0>;
> +
> +                               /* If hsync-active/vsync-active are missing,
> +                                  embedded BT.656 sync is used */
> +                               hsync-active = <0>; /* Active low */
> +                               vsync-active = <0>; /* Active low */
> +                               data-active = <1>;  /* Active high */
> +                               pclk-sample = <1>;  /* Rising */
> +                       };
> +               };
> +       };
> +
> --
> 1.8.3.1
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
