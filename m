From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 2/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan portal(s)
Date: Tue, 28 Oct 2014 09:41:24 -0500
Message-ID: <044D58B4-690A-4CEA-B2DB-8AF4549D4AE2@codeaurora.org>
References: <1414487751-31568-1-git-send-email-Emilian.Medve@Freescale.com> <1414487751-31568-3-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1414487751-31568-3-git-send-email-Emilian.Medve@Freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Emil Medve <Emilian.Medve@freescale.com>
Cc: scottwood@Freescale.com, corbet@lwn.net, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, pawel.moll@arm.com, mark.rutland@arm.com, grant.likely@linaro.org, Geoff.Thorpe@Freescale.com, linuxppc-dev@ozlabs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Oct 28, 2014, at 4:15 AM, Emil Medve <Emilian.Medve@freescale.com> wrote:

> Portals are memory mapped interfaces to BMan that allow low-latency,
> lock-less interaction by software running on processor cores, accelerators
> and network interfaces with the BMan
> 
> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
> Change-Id: I6d245ffc14ba3d0e91d403ac7c3b91b75a9e6a95
> ---
> .../bindings/powerpc/fsl/bman-portals.txt          | 52 ++++++++++++++++++++++
> 1 file changed, 52 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt b/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt

similar comment about location of binding not being PPC specific.

> new file mode 100644
> index 0000000..02e0231
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/bman-portals.txt
> @@ -0,0 +1,52 @@
> +QorIQ DPAA Buffer Manager Portals Device Tree Binding
> +

Probably worth putting the text from the commit message here as well.

> +Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
> +
> +CONTENTS
> +
> +	- BMan Portal
> +	- Example
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
> +- interrupts
> +	Usage:		Required
> +	Value type:	<prop-encoded-array>
> +	Definition:	Standard property
> +
> +EXAMPLE
> +
> +The example below shows a (P4080) BMan portals container/bus node with two portals
> +
> +	bman-portals@ff4000000 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		ranges = <0 0xf 0xf4000000 0x200000>;
> +
> +		bman-portal@0 {
> +			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
> +			reg = <0x0 0x4000>, <0x100000 0x1000>;
> +			interrupts = <105 2 0 0>;
> +		};
> +		bman-portal@4000 {
> +			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
> +			reg = <0x4000 0x4000>, <0x101000 0x1000>;
> +			interrupts = <107 2 0 0>;
> +		};
> +	};
> -- 
> 2.1.2
> 

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

