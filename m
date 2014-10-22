From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
 portal(s)
Date: Wed, 22 Oct 2014 15:29:31 +0100
Message-ID: <20141022142931.GA4010@leverpostej>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
 <1413986972-621-2-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413986972-621-2-git-send-email-Emilian.Medve@Freescale.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Emil Medve <Emilian.Medve@freescale.com>
Cc: "scottwood@freescale.com" <scottwood@freescale.com>, "galak@kernel.crashing.org" <galak@kernel.crashing.org>, "corbet@lwn.net" <corbet@lwn.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Pawel Moll <Pawel.Moll@arm.com>, "Geoff.Thorpe@freescale.com" <Geoff.Thorpe@freescale.com>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 22, 2014 at 03:09:30PM +0100, Emil Medve wrote:
> Portals are used by software running on processor cores, accelerators and
> network interfaces to communicate with the BMan

What exactly is a portal?

Is it a region of shared memory? A device?

I only received emails 2 and 3 of this series, so I'm lacking the
context necessary to understand the bindings.

> 
> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
> Change-Id: I6d245ffc14ba3d0e91d403ac7c3b91b75a9e6a95
> ---
>  .../bindings/powerpc/fsl/bman-portals.txt          | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt b/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
> new file mode 100644
> index 0000000..40e607e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
> @@ -0,0 +1,50 @@
> +QorIQ DPAA Buffer Manager Portals Device Tree Binding
> +
> +Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
> +
> +CONTENTS
> +
> +	- BMan Portal
> +	- Example
> +
> +NOTE:	The bindings described in this document are preliminary and subject to
> +	change

While we've tried that elsewhere, unstable DT bindings have been shown
to be a major source of pain. I'd feel rather uncomfortable accepting a
binding that we already believe to be insufficient to describe the
hardware.

What do you expect to change?

> +
> +BMan Portal Node
> +
> +PROPERTIES
> +
> +- compatible
> +	Usage:		Required
> +	Value type:	<stringlist>
> +	Definition:	Must include "fsl,bman-portal-<hardware revision>"
> +			May include "fsl,<SoC>-bman-portal" or "fsl,bman-portal"
> +
> +- reg
> +	Usage:		Required
> +	Value type:	<prop-encoded-array>
> +	Definition:	Two regions. The first is the cache-enabled region of
> +			the portal. The second is the cache-inhibited region of
> +			the portal
> +
> +EXAMPLE
> +
> +The example below shows a (P4080) BMan portals container/bus node with two portals

Is there any particular reason to place these under a simple-bus?

> +
> +	bman-portals@ff4000000 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		ranges = <0 0xf 0xf4000000 0x200000>;
> +
> +		bman-portal@0 {
> +			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
> +			reg = <0x0 0x4000 0x100000 0x1000>;

It would be easier to read is each entry had its own set of brackets.
Initially this looked to me like a single 64-bit address/size pair.

> +			interrupts = <105 2 0 0>;
> +		};

Given the description above, surely you need to know what the portal is
used for? Or is that queried from the portal?

Thanks,
Mark.

> +		bman-portal@4000 {
> +			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
> +			reg = <0x4000 0x4000 0x101000 0x1000>;
> +			interrupts = <107 2 0 0>;
> +		};
> +	};
> -- 
> 2.1.2
> 
> 
