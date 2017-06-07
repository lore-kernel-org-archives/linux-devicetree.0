From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: interrupt-controller: add DT binding
 for the Marvell ICU
Date: Wed, 7 Jun 2017 17:33:17 -0500
Message-ID: <20170607223317.hkpak5y2oalktjqe@rob-hp-laptop>
References: <1496398017-6487-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1496398017-6487-3-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496398017-6487-3-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 02, 2017 at 12:06:53PM +0200, Thomas Petazzoni wrote:
> This commit adds the Device Tree binding documentation for the Marvell
> ICU interrupt controller, which collects wired interrupts from the
> devices located into the CP110 hardware block of Marvell Armada 7K/8K,
> and converts them into SPI interrupts in the GIC located in the AP
> hardware block, using the GICP extension.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../bindings/interrupt-controller/marvell,icu.txt  | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
> new file mode 100644
> index 0000000..3e7954c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
> @@ -0,0 +1,54 @@
> +Marvell ICU Interrupt Controller
> +--------------------------------
> +
> +The Marvell ICU (Interrupt Consolidation Unit) controller is
> +responsible for collecting all wired-interrupt sources in the CP and
> +communicating them to the GIC in the AP, the unit translates interrupt
> +requests on input wires to MSG memory mapped transactions to the GIC.
> +
> +Required properties:
> +
> +- compatible: Should be "marvell,cp110-icu"
> +
> +- reg: Should contain ICU registers location and length.
> +
> +- #interrupt-cells: Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 3.
> +
> +  The 1st cell is the group type of the ICU interrupt. Possible group
> +  types are:
> +
> +   ICU_GRP_NSR (0x0) : Shared peripheral interrupt, non-secure
> +   ICU_GRP_SR  (0x1) : Shared peripheral interrupt, secure
> +   ICU_GRP_SEI (0x4) : System error interrupt
> +   ICU_GRP_REI (0x5) : RAM error interrupt
> +
> +  The 2nd cell is the index of the interrupt in the ICU unit.
> +
> +  The 3rd cell is the type of the interrupt. See arm,gic.txt for
> +  details.
> +
> +- interrupt-controller: Identifies the node as an interrupt
> +  controller.
> +
> +- interrupt-parent: Indicates the node of the parent interrupt
> +  controller. Should be pointer to the GIC.
> +
> +- gicp: Should point to the GICP controller, the GIC extension that
> +  allows to trigger interrupts using MSG memory mapped transactions.
> +
> +Example:
> +
> +icu: interrupt-controller@1e0000 {
> +	compatible = "marvell,cp110-icu";
> +	reg = <0x1e0000 0x10>;
> +	#interrupt-cells = <3>;
> +	interrupt-controller;
> +	interrupt-parent = <&gic>;

If you have a parent, then you should have some interrupts. I guess that 
would be your ranges property? I suppose that is fine.

> +	marvell,gicp = <&gicp>;
> +};
> +
> +usb3h0: usb3@500000 {
> +	interrupt-parent = <&icu>;
> +	interrupts = <ICU_GRP_NSR 106 IRQ_TYPE_LEVEL_HIGH>;
> +};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
