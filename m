From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCHv6 1/3] dt-bindings: documentation: add clock bindings
 information for Stratix10
Date: Mon, 19 Mar 2018 11:08:30 -0700
Message-ID: <152148291051.242365.11482305337775703728@swboyd.mtv.corp.google.com>
References: <1519656455-14629-1-git-send-email-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519656455-14629-1-git-send-email-dinguyen@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-clk@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, mturquette@baylibre.com, dinguyen@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Dinh Nguyen (2018-02-26 06:47:33)
> diff --git a/Documentation/devicetree/bindings/clock/intc_stratix10.txt b/Documentation/devicetree/bindings/clock/intc_stratix10.txt
> new file mode 100644
> index 0000000..0652ff1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/intc_stratix10.txt
> @@ -0,0 +1,51 @@
> +Device Tree Clock bindings for Intel's SoCFPGA Stratix10 platform
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible : shall be
> +       "intel,stratix10-clkmgr"
> +
> +- reg : shall be the control register offset from CLOCK_MANAGER's base for the clock.
> +
> +- #clock-cells : from common clock binding, shall be set to 1.
> +
> +- clocks : Should contain fixed-clock sources, such as oscillators.
> +
> +Example:
> +       clkmgr: clock-controller@ffd10000 {
> +               compatible = "intel,stratix10-clkmgr";
> +               reg = <0xffd10000 0x1000>;
> +               #clock-cells = <1>;
> +
> +               clocks {

Why do we need a subnode for clocks inside of a clock controller node?

> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       cb_intosc_hs_div2_clk: cb-intosc-hs-div2-clk {
> +                               #clock-cells = <0>;
> +                               compatible = "fixed-clock";
> +                               clock-frequency = <25000000>;

What is this for? I would think oscillators go into the root of the DT
because they're on the board, not inside the clock controller.

> +                       };
> +
> +                       cb_intosc_ls_clk: cb-intosc-ls-clk {
> +                               #clock-cells = <0>;
> +                               compatible = "fixed-clock";
> +                               clock-frequency = <25000000>;
> +                       };
> +
> +                       f2s_free_clk: f2s-free-clk {
> +                               #clock-cells = <0>;
> +                               compatible = "fixed-clock";
> +                               clock-frequency = <25000000>;
> +                       };
> +
> +                       osc1: osc1 {
> +                               #clock-cells = <0>;
> +                               compatible = "fixed-clock";
> +                               clock-frequency = <25000000>;
> +                       };
> +               };
> +       };
