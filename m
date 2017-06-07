From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: interrupt-controller: add DT binding
 for the Marvell GICP
Date: Wed, 7 Jun 2017 17:24:20 -0500
Message-ID: <20170607222420.perbnsnmizhyl42f@rob-hp-laptop>
References: <1496398017-6487-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1496398017-6487-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496398017-6487-2-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 02, 2017 at 12:06:52PM +0200, Thomas Petazzoni wrote:
> This commit adds the Device Tree binding documentation for the Marvell
> GICP, an extension to the GIC that allows to trigger GIC SPI interrupts
> using memory transactions. It is used by the ICU unit in the Marvell
> CP110 block to turn wired interrupts inside the CP into SPI interrupts
> at the GIC level in the AP.

Sounds like an MSI block?

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../bindings/interrupt-controller/marvell,gicp.txt | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
> new file mode 100644
> index 0000000..3fc36963
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
> @@ -0,0 +1,24 @@
> +Marvell GICP Controller
> +-----------------------
> +
> +GICP is a Marvell extension of the GIC that allows to trigger GIC SPI
> +interrupts by doing a memory transaction. It is used by the ICU
> +located in the Marvell CP110 to turn wired interrupts inside the CP
> +into GIC SPI interrupts.
> +
> +Required properties:
> +
> +- compatible: Must be "marvell,ap806-gicp"
> +
> +- reg: Must be the address and size of the GICP SPI registers
> +
> +- marvell,spi-ranges: tuples of GIC SPI interrupts ranges available
> +  for this GICP

These are base+size?

> +
> +Example:
> +
> +gicp_spi: gicp-spi@3f0040 {
> +	compatible = "marvell,ap806-gicp";
> +	reg = <0x3f0040 0x10>;
> +	marvell,spi-ranges = <64 64>, <288 64>;
> +};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
