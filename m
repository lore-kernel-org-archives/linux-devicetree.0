From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 1/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
Date: Tue, 28 Oct 2014 09:39:07 -0500
Message-ID: <5DC63911-AD43-4EDA-8675-8A28EDC3F491@codeaurora.org>
References: <1414487751-31568-1-git-send-email-Emilian.Medve@Freescale.com> <1414487751-31568-2-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1414487751-31568-2-git-send-email-Emilian.Medve@Freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Emil Medve <Emilian.Medve@freescale.com>
Cc: scottwood@Freescale.com, corbet@lwn.net, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, pawel.moll@arm.com, mark.rutland@arm.com, grant.likely@linaro.org, Geoff.Thorpe@Freescale.com, linuxppc-dev@ozlabs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Oct 28, 2014, at 4:15 AM, Emil Medve <Emilian.Medve@freescale.com> w=
rote:

> The Buffer Manager is part of the Data-Path Acceleration Architecture=
 (DPAA).
> BMan supports hardware allocation and deallocation of buffers belongi=
ng to
> pools originally created by software with configurable depletion thre=
sholds.
> This binding covers the CCSR space programming model
>=20
> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
> Change-Id: I3ec479bfb3c91951e96902f091f5d7d2adbef3b2
> ---
> .../devicetree/bindings/powerpc/fsl/bman.txt       | 95 +++++++++++++=
+++++++++
> 1 file changed, 95 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/bman=
=2Etxt

Should these really be in bindings/powerpc/fsl, aren=92t you guys using=
 this on ARM SoCs as well?

I can=92t remember if the TI guys had a HW allocator as part of their s=
imilar HW.  If so, possibly worth while to see where they have their bi=
nding.

>=20
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/bman.txt b=
/Documentation/devicetree/bindings/powerpc/fsl/bman.txt
> new file mode 100644
> index 0000000..d3fd1e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/bman.txt
> @@ -0,0 +1,95 @@
> +QorIQ DPAA Buffer Manager Device Tree Bindings
> +
> +Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
> +
> +CONTENTS
> +
> +	- BMan Node
> +	- BMan Private Memory Node
> +	- Example
> +
> +BMan Node
> +
> +PROPERTIES
> +
> +- compatible
> +	Usage:		Required
> +	Value type:	<stringlist>
> +	Definition:	Must include "fsl,bman"
> +			May include "fsl,<SoC>-bman"
> +
> +- reg
> +	Usage:		Required
> +	Value type:	<prop-encoded-array>
> +	Definition:	Registers region within the CCSR address space
> +
> +- interrupts
> +	Usage:		Required
> +	Value type:	<prop-encoded-array>
> +	Definition:	Standard property. The error interrupt
> +
> +- fsl,liodn
> +	Usage:		See pamu.txt
> +	Value type:	<prop-encoded-array>
> +	Definition:	PAMU property used for static LIODN assignment
> +
> +- fsl,iommu-parent
> +	Usage:		See pamu.txt
> +	Value type:	<phandle>
> +	Definition:	PAMU property used for dynamic LIODN assignment
> +
> +	For additional details about the PAMU/LIODN binding(s) see pamu.txt
> +
> +BMan Private Memory Node
> +
> +BMan requires a contiguous range of physical memory used for the bac=
king store
> +for BMan Free Buffer Proxy Records. This memory is reserved/allocate=
d as a node

=85 Proxy Records (FBPR).  This

[ so we get context for the acronym used later ]

> +under the /reserved-memory node
> +
> +The BMan FBPR memory node must be named "bman-fbpr"
> +
> +PROPERTIES
> +
> +- compatible
> +	Usage:		required
> +	Value type:	<stringlist>
> +	Definition:	Must inclide "fsl,bman-fbpr"
> +
> +The following constraints are relevant to the FBPR private memory:
> +	- The size must be 2^(size + 1), with size =3D 11..33. That is 4 Ki=
B to
> +	  16 GiB
> +	- The alignment must be a muliptle of the memory size
> +
> +The size of the FBPR must be chosen by observing the hardware featur=
es configured
> +via the RCW and that are relevant to a specific board (e.g. number o=
f MAC(s)
> +pinned-out, number of offline/host command FMan ports, etc.). The si=
ze configured
> +in the DT must reflect the hardware capabilities and not the specifi=
c needs of an
> +application

RCW doesn=92t have any context here

> +
> +For additional details about reserved memory regions see reserved-me=
mory.txt
> +
> +EXAMPLE
> +
> +The example below shows a BMan FBPR dynamic allocation memory node
> +
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		bman-fbpr {
> +			compatible =3D "fsl,bman-fbpr";
> +			alloc-ranges =3D <0 0 0xf 0xffffffff>;
> +			size =3D <0 0x1000000>;
> +			alignment =3D <0 0x1000000>;
> +		};
> +	};
> +
> +The example below shows a (P4080) BMan CCSR-space node
> +
> +	bman@31a000 {
> +		compatible =3D "fsl,bman";
> +		reg =3D <0x31a000 0x1000>;
> +		interrupts =3D <16 2 1 2>;
> +		fsl,liodn =3D <0x17>;

no fsl,iommu-parent in the example?

> +	};

Do you not need a phandle between the bman and the memory node?

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project

