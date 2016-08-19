From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v6 2/2] clk: uniphier: add clock data for UniPhier SoCs
Date: Thu, 18 Aug 2016 17:28:26 -0700
Message-ID: <20160819002826.GT361@codeaurora.org>
References: <1470112223-24835-1-git-send-email-yamada.masahiro@socionext.com>
 <1470112223-24835-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1470112223-24835-3-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/02, Masahiro Yamada wrote:
> diff --git a/Documentation/devicetree/bindings/clock/uniphier-clock.txt b/Documentation/devicetree/bindings/clock/uniphier-clock.txt
> new file mode 100644
> index 0000000..1a4db8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/uniphier-clock.txt
> @@ -0,0 +1,134 @@
> +UniPhier clock controller
> +
> +
> +System clock
> +------------
> +
> +Required properties:
> +- compatible: should be one of the following:
> +    "socionext,uniphier-sld3-clock" - for PH1-sLD3 SoC.
> +    "socionext,uniphier-ld4-clock"  - for PH1-LD4 SoC.
> +    "socionext,uniphier-pro4-clock" - for PH1-Pro4 SoC.
> +    "socionext,uniphier-sld8-clock" - for PH1-sLD8 SoC.
> +    "socionext,uniphier-pro5-clock" - for PH1-Pro5 SoC.
> +    "socionext,uniphier-pxs2-clock" - for ProXstream2/PH1-LD6b SoC.
> +    "socionext,uniphier-ld11-clock" - for PH1-LD11 SoC.
> +    "socionext,uniphier-ld20-clock" - for PH1-LD20 SoC.
> +- #clock-cells: should be 1.
> +
> +Example:
> +
> +	sysctrl@61840000 {
> +		compatible = "socionext,uniphier-ld20-sysctrl",
> +			     "simple-mfd", "syscon";
> +		reg = <0x61840000 0x4000>;
> +
> +		clock {
> +			compatible = "socionext,uniphier-ld20-clock";
> +			#clock-cells = <1>;
> +		};
> +
> +		other nodes ...

What are the other nodes? Is there a document for the rest of the
MFD?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
