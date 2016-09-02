From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 24/26] dt-bindings: Document img,boston-clock binding
Date: Fri, 2 Sep 2016 07:54:33 -0500
Message-ID: <20160902125433.GA4066@rob-hp-laptop>
References: <20160826153725.11629-1-paul.burton@imgtec.com>
 <20160826153725.11629-25-paul.burton@imgtec.com>
 <20160826174446.GX19826@codeaurora.org>
 <f0633969-1df4-64c9-a003-8745ad331bc8@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <f0633969-1df4-64c9-a003-8745ad331bc8@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 04:53:01PM +0100, Paul Burton wrote:
> On 26/08/16 18:44, Stephen Boyd wrote:
> > On 08/26, Paul Burton wrote:
> >> diff --git a/Documentation/devicetree/bindings/clock/img,boston-clock.txt b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> >> new file mode 100644
> >> index 0000000..c01ea60
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> >> @@ -0,0 +1,27 @@
> >> +Binding for Imagination Technologies MIPS Boston clock sources.
> >> +
> >> +This binding uses the common clock binding[1].
> >> +
> >> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> >> +
> >> +Required properties:
> >> +- compatible : Should be "img,boston-clock".
> >> +- #clock-cells : Should be set to 1.
> >> +  Values available for clock consumers can be found in the header file:
> >> +    <dt-bindings/clock/boston-clock.h>
> >> +- regmap : Phandle to the Boston platform register system controller.
> >> +  This should contain a phandle to the system controller node covering the
> >> +  platform registers provided by the Boston board.
> >> +
> >> +Example:
> >> +
> >> +	clk_boston: clock {
> >> +		compatible = "img,boston-clock";
> >> +		#clock-cells = <1>;
> >> +		regmap = <&plat_regs>;
> > 
> > Isn't syscon more standard than regmap as the property name? Is
> > there a binding for the plat_regs device? Is there any reason the
> > clks can't be populated in that syscon driver?
> 
> Hi Stephen,
> 
> The plat_regs device doesn't have a custom driver, it simply makes use
> of the generic "syscon" driver which can provide a regmap.
> 
> It would be possible to register the clocks from a register for the
> plat_regs device, but I don't think it would make much sense. The
> platform registers in question are essentially just a convenient place
> where various bits of information about the system are exposed,
> including the clock frequencies but also other bits & pieces like
> connectivity of PCIe controllers or I/O coherence units, the RTL
> revision of the CPU or the wrapper RTL that runs on this FPGA-based
> board, a register that allows for resetting the board, etc. It's not a
> single piece of hardware, more a dumping ground for miscellanea. So in
> my opinion using the syscon approach works best here, and drivers for
> well defined pieces of hardware or functionality can reference that
> syscon to retrieve the regmap.

That is all quite common for any SoC. Whether it's 2 nodes or 2 drivers 
are independent questions. You can easily have 1 node and 2 drivers. The 
decision factor is really how many registers we're dealing with. We 
don't want to end up with a node per register or register field. That's 
too fine grained.

> As for whether "syscon" is a more standard property name than "regmap",
> both seem to be used based on a grep of
> Documentation/devicetree/bindings/. I believe I picked up use of
> "regmap" from the generic syscon-poweroff & syscon-reboot drivers, which
> both use "regmap" as a property name.

syscon is much more common.

Avoid the phandle altogether and make this a child node.

Rob
