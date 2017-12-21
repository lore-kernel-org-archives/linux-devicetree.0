From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: media: Add Allwinner V3s Camera
 Sensor Interface (CSI)
Date: Thu, 21 Dec 2017 10:49:35 +0800
Message-ID: <20171221104935.663812085b616935ca3046de@magewell.com>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
        <1501131697-1359-3-git-send-email-yong.deng@magewell.com>
        <20171219115327.ofs5xwwimpn7x72n@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171219115327.ofs5xwwimpn7x72n-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 19 Dec 2017 13:53:28 +0200
Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org> wrote:

> Hi Yong,
> 
> On Thu, Jul 27, 2017 at 01:01:36PM +0800, Yong Deng wrote:
> > Add binding documentation for Allwinner V3s CSI.
> > 
> > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> 
> DT bindings should precede the driver.

OK.

> 
> > ---
> >  .../devicetree/bindings/media/sun6i-csi.txt        | 49 ++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt b/Documentation/devicetree/bindings/media/sun6i-csi.txt
> > new file mode 100644
> > index 0000000..f8d83f6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
> > @@ -0,0 +1,49 @@
> > +Allwinner V3s Camera Sensor Interface
> > +------------------------------
> > +
> > +Required properties:
> > +  - compatible: value must be "allwinner,sun8i-v3s-csi"
> 
> What are sun6i and sun8i? Is this device first present in sun6i SoCs,
> whereas you have only defined bindings for sun8i?

Yes, some sun6i SoCs has the almost same CSI module.
There is only V3s on my hand. So, I only tested it on V3s. But
some people work on the others.

> 
> > +  - reg: base address and size of the memory-mapped region.
> > +  - interrupts: interrupt associated to this IP
> > +  - clocks: phandles to the clocks feeding the CSI
> > +    * ahb: the CSI interface clock
> > +    * mod: the CSI module clock
> > +    * ram: the CSI DRAM clock
> > +  - clock-names: the clock names mentioned above
> > +  - resets: phandles to the reset line driving the CSI
> > +
> > +- ports: A ports node with endpoint definitions as defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> 
> Please document mandatory and optional endpoint properties relevant for the
> hardware.

I have added below commit in my v3:
Currently, the driver only support the parallel interface. So, a single port
node with one endpoint and parallel bus is supported.

> 
> > +
> > +Example:
> > +
> > +	csi1: csi@01cb4000 {
> > +		compatible = "allwinner,sun8i-v3s-csi";
> > +		reg = <0x01cb4000 0x1000>;
> > +		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks = <&ccu CLK_BUS_CSI>,
> > +			 <&ccu CLK_CSI1_SCLK>,
> > +			 <&ccu CLK_DRAM_CSI>;
> > +		clock-names = "ahb", "mod", "ram";
> > +		resets = <&ccu RST_BUS_CSI>;
> > +
> > +		port {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			/* Parallel bus endpoint */
> > +			csi1_ep: endpoint {
> > +				remote-endpoint = <&adv7611_ep>;
> > +				bus-width = <16>;
> > +				data-shift = <0>;
> > +
> > +				/* If hsync-active/vsync-active are missing,
> > +				   embedded BT.656 sync is used */
> > +				hsync-active = <0>; /* Active low */
> > +				vsync-active = <0>; /* Active low */
> > +				data-active = <1>;  /* Active high */
> > +				pclk-sample = <1>;  /* Rising */
> > +			};
> > +		};
> > +	};
> > +
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
> e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org


Thanks,
Yong
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
