From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] Documentation: dt: reset: Add syscon reset binding
Date: Fri, 18 Mar 2016 11:39:18 -0500
Message-ID: <20160318163918.GA13101@rob-hp-laptop>
References: <1457646365-1723-1-git-send-email-afd@ti.com>
 <1457646365-1723-2-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457646365-1723-2-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 10, 2016 at 03:46:04PM -0600, Andrew F. Davis wrote:
> Add syscon reset controller binding. This will hook to the reset
> framework and use syscon/regmap to set reset bits. This allows
> reset control of individual SoC subsytems and devices with
> memory-mapped reset registers in a common register memory
> space.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> [s-anna@ti.com: revise the binding format]
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../devicetree/bindings/reset/syscon-reset.txt     | 114 +++++++++++++++++++++
>  include/dt-bindings/reset/syscon.h                 |  23 +++++
>  2 files changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/syscon-reset.txt
>  create mode 100644 include/dt-bindings/reset/syscon.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/syscon-reset.txt b/Documentation/devicetree/bindings/reset/syscon-reset.txt
> new file mode 100644
> index 0000000..02bc9e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/syscon-reset.txt
> @@ -0,0 +1,114 @@
> +SysCon Reset Controller
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
> + - #reset-cells		: Should be 1. Please see the reset consumer node below
> +			  for usage details
> + - #address-cells	: Should be 1
> + - #size-cells		: Should be 0
> +
> +SysCon Reset Child Node
> +============================
> +Each reset provider/controller node should have a child node for each reset
> +it would like to expose to consumers.

A node per register bit... Now I'm only more convinced this is too low 
level.

> +
> +Required properties:
> +--------------------
> + - reg			: This reset's number, this will be used to reference
> +			  this reset by consumers of this reset

Now you have a made up index unrelated to anything in the h/w. Sometimes 
that's unavoidable, but your prior version did.

> + - reset-control	: Contains the reset control register information
> +			  Should contain 3 cells defined as:
> +			    Cell #1 : register offset of the reset
> +			              control/status register from the syscon
> +			              register base
> +			    Cell #2 : bit shift value for the reset in the
> +			              respective reset control/status register
> +			    Cell #3 : polarity of the reset bit. Should be 1 or
> +				      RESET_ASSERT_SET for resets that are
> +				      asserted when the bit is set, 0 or
> +				      RESET_ASSERT_CLEAR for resets that are
> +				      asserted when the bit is cleared
> +
> +Optional properties:
> +--------------------
> + - reset-status		: Contains the reset status register information. The
> +			  contents of this property are the equivalent to
> +			  reset-control as defined above. If this property is
> +			  not present and the toggle flag is not set, the
> +			  reset register is assumed to be the same as the
> +			  control register
> + - toggle		: Mark this reset as a toggle only reset, this is used
> +			  when no status register is available.
