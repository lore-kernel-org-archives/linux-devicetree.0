From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] Documentation: dt: reset: Add TI syscon reset
 binding
Date: Tue, 21 Jun 2016 14:25:12 -0500
Message-ID: <20160621192512.GA29836@rob-hp-laptop>
References: <20160620184607.4380-1-afd@ti.com>
 <20160620184607.4380-2-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160620184607.4380-2-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 20, 2016 at 01:46:06PM -0500, Andrew F. Davis wrote:
> Add TI syscon reset controller binding. This will hook to the reset
> framework and use syscon/regmap to set reset bits. This allows reset
> control of individual SoC subsytems and devices with memory-mapped
> reset registers in a common register memory space.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> [s-anna@ti.com: revise the binding format]
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../devicetree/bindings/reset/ti-syscon-reset.txt  | 83 ++++++++++++++++++++++
>  include/dt-bindings/reset/ti-syscon.h              | 30 ++++++++
>  2 files changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>  create mode 100644 include/dt-bindings/reset/ti-syscon.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> new file mode 100644
> index 0000000..eb95bb5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> @@ -0,0 +1,83 @@
> +TI SysCon Reset Controller
> +=======================
> +
> +Almost all SoCs have hardware modules that require reset control in addition
> +to clock and power control for their functionality. The reset control is
> +typically provided by means of memory-mapped I/O registers. These registers are
> +sometimes a part of a larger register space region implementing various
> +functionalities. This register range is best represented as a syscon node to
> +allow multiple entities to access their relevant registers in the common
> +register space.
> +
> +A SysCon Reset Controller node defines a device that uses a syscon node
> +and provides reset management functionality for various hardware modules
> +present on the SoC.
> +
> +SysCon Reset Controller Node
> +============================
> +Each of the reset provider/controller nodes should be a child of a syscon
> +node and have the following properties.
> +
> +Required properties:
> +--------------------
> + - compatible		: Should be "syscon-reset"

SoC specific compatible? You have it in the example. Otherwise looks 
fine.

Rob
