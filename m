From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V1] clk: qcom: Add qpnp clock divider support
Date: Tue, 18 Jul 2017 16:08:27 -0700
Message-ID: <20170718230827.GE18179@codeaurora.org>
References: <1499945536-18281-1-git-send-email-tirupath@codeaurora.org>
 <1499945536-18281-2-git-send-email-tirupath@codeaurora.org>
 <20170714210837.GK22780@codeaurora.org>
 <f488d813-9dcc-4d32-c40c-fa15bfdd2cf9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f488d813-9dcc-4d32-c40c-fa15bfdd2cf9@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tirupathi Reddy T <tirupath@codeaurora.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/18, Tirupathi Reddy T wrote:
> 
> On 7/15/2017 2:38 AM, Stephen Boyd wrote:
> >On 07/13, Tirupathi Reddy wrote:
> >>diff --git a/Documentation/devicetree/bindings/clock/clk-qpnp-div.txt b/Documentation/devicetree/bindings/clock/clk-qpnp-div.txt
> >>new file mode 100644
> >>index 0000000..03b7b70
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/clock/clk-qpnp-div.txt
> >>@@ -0,0 +1,52 @@
> >>+Qualcomm Technologies, Inc. QPNP clock divider (clkdiv)
> >>+
> >>+clkdiv configures the clock frequency of a set of outputs on the PMIC.
> >>+These clocks are typically wired through alternate functions on
> >>+gpio pins.
> >>+
> >>+=======================
> >>+Supported Properties
> >>+=======================
> >>+
> >>+- compatible
> >>+	Usage:      required
> >>+	Value type: <string>
> >>+	Definition: should be "qcom,qpnp-clkdiv".
> >>+
> >>+- reg
> >>+	Usage:      required
> >>+	Value type: <prop-encoded-array>
> >>+	Definition: Addresses and sizes for the memory of this CLKDIV
> >>+		    peripheral.
> >>+
> >>+- qcom,cxo-freq
> >>+	Usage:      required
> >>+	Value type: <u32>
> >>+	Definition: The frequency of the crystal oscillator (CXO) clock in Hz.
> >CXO should be a parent clk then. This could have clocks and
> >clock-names properties for that and then be hooked up to
> >xo_board.
> Sure. I will address in the next patch set.
> >>+
> >>+- qcom,clkdiv-id
> >>+	Usage:      required
> >>+	Value type: <u32>
> >>+	Definition: Integer value specifies the hardware identifier of this
> >>+		    CLKDIV peripheral.
> >This is to name the clk? You could use clock-output-names as
> >that's more standard. But this is also sort of confusing. If
> >there are multiple clkdivs then it would be good to combine them
> >into one device node assuming they're all next to each other.
> >This would be similar to how we handle gpios and regulators. Then
> >the naming is simple enough to be an incrementing number.
> Yes, multiple clkdivs present. We add sub-nodes for each clkdiv and
> parse them inside driver as separate clock.

Please just roll them all into one node instead of a node per
clk on the PMIC.

> >>+#define Q_DIV_PERIOD_NS(cxo_clk, div)	(NSEC_PER_SEC / (cxo_clk / div))
> >>+#define Q_ENABLE_DELAY_NS(cxo_clk, div)	(2 * Q_CXO_PERIOD_NS(cxo_clk) + \
> >>+					(3 * Q_DIV_PERIOD_NS(cxo_clk, div)))
> >>+#define Q_DISABLE_DELAY_NS(cxo_clk, div) \
> >>+					(3 * Q_DIV_PERIOD_NS(cxo_clk, div))
> >>+
> >>+#define CLK_QPNP_DIV_OFFSET		1
> >>+
> >>+enum q_clk_div_factor {
> >>+	Q_CLKDIV_XO_DIV_1_0 = 0,
> >>+	Q_CLKDIV_XO_DIV_1,
> >>+	Q_CLKDIV_XO_DIV_2,
> >>+	Q_CLKDIV_XO_DIV_4,
> >>+	Q_CLKDIV_XO_DIV_8,
> >>+	Q_CLKDIV_XO_DIV_16,
> >>+	Q_CLKDIV_XO_DIV_32,
> >>+	Q_CLKDIV_XO_DIV_64,
> >>+	Q_CLKDIV_MAX_ALLOWED,
> >Please make #defines for these instead of enum.
> We used enum primarily for easy debug at runtime. For an example,
> The "div_factor" field
> of "struct q_clkdiv" would always show the enumerated value which
> would help in
> determining the configured absolute divider value rather than
> spending time in mapping
> register bit values to absolute divider value.

Ok. I can't find a good reference, but typically we don't do this
in kernel drivers and just use #defines instead. Please just do
that. It seems simple enough to know to translate the number to a
power of 2 after reading it.

> >
> >>+};
> >>+
> >>+enum q_clkdiv_state {
> >>+	DISABLE = false,
> >>+	ENABLE = true,
> >>+};
> >Uh no. Just use bool.
> Sure. I will address in the next patch set.
> >
> >>+
> >>+struct q_clkdiv {
> >>+	struct regmap		*regmap;
> >>+	struct device		*dev;
> >>+
> >>+	u16			base;
> >>+	spinlock_t		lock;
> >>+
> >>+	/* clock properties */
> >>+	struct clk_hw		hw;
> >>+	unsigned int		cxo_hz;
> >Drop.
> cxo_hz is required to be populated at driver initialization and
> being used at runtime
> for calculating the div value to be applied.
> >
> >>+	enum q_clk_div_factor	div_factor;
> >>+	bool			enabled;
> >Shouldn't be needed. Read the hardware instead.
> This enabled field is required for the typical handling of set_rate
> in qpnp_clkdiv_config_freq_div().

You can't read the hardware in set_rate op?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
