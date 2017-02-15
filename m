From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: media: Add Renesas R-Car DRIF binding
Date: Wed, 15 Feb 2017 11:09:19 -0600
Message-ID: <20170215170919.lxmqryjxdo3uxil2@rob-hp-laptop>
References: <1486479757-32128-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <1486479757-32128-7-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486479757-32128-7-git-send-email-ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, crope-X3B1VOXEql0@public.gmane.org, chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 07, 2017 at 03:02:36PM +0000, Ramesh Shanmugasundaram wrote:
> Add binding documentation for Renesas R-Car Digital Radio Interface
> (DRIF) controller.
> 
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
>  .../devicetree/bindings/media/renesas,drif.txt     | 186 +++++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.txt b/Documentation/devicetree/bindings/media/renesas,drif.txt
> new file mode 100644
> index 0000000..6315609
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.txt
> @@ -0,0 +1,186 @@
> +Renesas R-Car Gen3 Digital Radio Interface controller (DRIF)
> +------------------------------------------------------------
> +
> +R-Car Gen3 DRIF is a SPI like receive only slave device. A general
> +representation of DRIF interfacing with a master device is shown below.
> +
> ++---------------------+                +---------------------+
> +|                     |-----SCK------->|CLK                  |
> +|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> +|                     |-----SD0------->|D0                   |
> +|                     |-----SD1------->|D1                   |
> ++---------------------+                +---------------------+
> +
> +As per the datasheet, each DRIF channel (drifn) is made up of two internal
> +channels (drifn0 & drifn1). These two internal channels share the common
> +CLK & SYNC. Each internal channel has its own dedicated resources like
> +irq, dma channels, address space & clock. This internal split is not
> +visible to the external master device.
> +
> +The device tree model represents each internal channel as a separate node.
> +The internal channels sharing the CLK & SYNC are tied together by their
> +phandles using a new property called "renesas,bonding". For the rest of
> +the documentation, unless explicitly stated, the word channel implies an
> +internal channel.
> +
> +When both internal channels are enabled they need to be managed together
> +as one (i.e.) they cannot operate alone as independent devices. Out of the
> +two, one of them needs to act as a primary device that accepts common
> +properties of both the internal channels. This channel is identified by a
> +new property called "renesas,primary-bond".
> +
> +To summarize,
> +   - When both the internal channels that are bonded together are enabled,
> +     the zeroth channel is selected as primary-bond. This channels accepts
> +     properties common to all the members of the bond.
> +   - When only one of the bonded channels need to be enabled, the property
> +     "renesas,bonding" or "renesas,primary-bond" will have no effect. That
> +     enabled channel can act alone as any other independent device.
> +
> +Required properties of an internal channel:
> +-------------------------------------------
> +- compatible: "renesas,r8a7795-drif" if DRIF controller is a part of R8A7795 SoC.
> +	      "renesas,rcar-gen3-drif" for a generic R-Car Gen3 compatible device.
> +	      When compatible with the generic version, nodes must list the
> +	      SoC-specific version corresponding to the platform first
> +	      followed by the generic version.
> +- reg: offset and length of that channel.
> +- interrupts: associated with that channel.
> +- clocks: phandle and clock specifier of that channel.
> +- clock-names: clock input name string: "fck".
> +- dmas: phandles to the DMA channels.
> +- dma-names: names of the DMA channel: "rx".
> +- renesas,bonding: phandle to the other channel.
> +
> +Optional properties of an internal channel:
> +-------------------------------------------
> +- power-domains: phandle to the respective power domain.
> +
> +Required properties of an internal channel when:
> +	- It is the only enabled channel of the bond (or)
> +	- If it acts as primary among enabled bonds
> +--------------------------------------------------------
> +- pinctrl-0: pin control group to be used for this channel.
> +- pinctrl-names: must be "default".
> +- renesas,primary-bond: empty property indicating the channel acts as primary
> +			among the bonded channels.
> +- port: child port node of a channel that defines the local and remote
> +	endpoints. The remote endpoint is assumed to be a third party tuner
> +	device endpoint.
> +
> +Optional endpoint property:
> +---------------------------
> +- renesas,sync-active  : Indicates sync signal polarity, 0/1 for low/high
> +			 respectively. This property maps to SYNCAC bit in the
> +			 hardware manual. The default is 1 (active high)

Why does this belong in the endpoint? I'd prefer to not have vendor 
specific properties in endpoints. Is this a property of the tuner or 
DRIF? 

> +
> +Example
> +--------
> +
> +SoC common dtsi file
> +
> +		drif00: rif@e6f40000 {
> +			compatible = "renesas,r8a7795-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg = <0 0xe6f40000 0 0x64>;
> +			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 515>;
> +			clock-names = "fck";
> +			dmas = <&dmac1 0x20>, <&dmac2 0x20>;
> +			dma-names = "rx", "rx";
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			renesas,bonding = <&drif01>;
> +			status = "disabled";

Don't put "status" in examples.

> +		};
> +
> +		drif01: rif@e6f50000 {
> +			compatible = "renesas,r8a7795-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg = <0 0xe6f50000 0 0x64>;
> +			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 514>;
> +			clock-names = "fck";
> +			dmas = <&dmac1 0x22>, <&dmac2 0x22>;
> +			dma-names = "rx", "rx";
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			renesas,bonding = <&drif00>;
> +			status = "disabled";
> +		};
> +
> +
> +Board specific dts file

Chip vs. board in not relevant to the binding doc. Please combine them 
here in your example.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
