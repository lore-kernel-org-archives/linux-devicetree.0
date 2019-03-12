From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 11/15] [NOT FOR MERGE] dt-bindings: Add a binding for
 a mailbox-backed interrupt controller
Date: Tue, 12 Mar 2019 08:42:08 -0500
Message-ID: <20190312134208.GA2017@bogus>
References: <20190302042951.53671-1-samuel@sholland.org>
 <20190302042951.53671-12-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190302042951.53671-12-samuel@sholland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jassi Brar <jassisinghbrar@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 01, 2019 at 10:29:47PM -0600, Samuel Holland wrote:
> This is a somewhat generic binding for an interrupt controller/forwarder
> implemented in firmware and communicated with using a mailbox.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../interrupt-controller/mbox-intc.txt        | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mbox-intc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mbox-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/mbox-intc.txt
> new file mode 100644
> index 000000000000..a0eb7904ca83
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mbox-intc.txt
> @@ -0,0 +1,33 @@
> +Mailbox-backed Interrupt Controller
> +===================================

Probably never really going to be generic as every mailbox protocol is 
different.

> +
> +This binding represents an interrupt controller implemented in firmware,
> +that uses a mailbox channel to signal and acknowledge interrupts.
> +
> +Device Node:
> +============
> +
> +Required properties:
> +--------------------
> +- compatible:		Must be one of the following strings:
> +			- allwinner,sunxi-msgbox-intc
> +- interrupt-controller:	Signifies that this node is an interrupt controller.
> +- #interrupt-cells:	Must be 1.

No edge/level control?

> +- mboxes:		phandle for the mailbox controller and channel
> +			specifier. If the mailbox controller has unidirectional
> +			channels, two entries are required (see below).
> +- mbox-names:		Only required for unidirectional mailbox channels. In
> +			that case, it must contain the strings "tx" and "rx"
> +			(where "tx" and "rx" are from Linux's perspective, not

/Linux/the OS/

> +			the direction the interrupts are traveling).
> +
> +Example:
> +--------
> +
> +	msgbox_intc: interrupt-controller {
> +		compatible = "allwinner,sunxi-msgbox-intc";
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +		mboxes = <&msgbox 6>, <&msgbox 7>;
> +		mbox-names = "tx", "rx";
> +	};
> -- 
> 2.19.2
> 
