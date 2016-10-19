From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 16/18] dt-bindings: Document img,boston-clock binding
Date: Tue, 18 Oct 2016 17:46:04 -0700
Message-ID: <20161019004604.GS8871@codeaurora.org>
References: <20161005171824.18014-1-paul.burton@imgtec.com>
 <2468748.fALFhzhDcI@np-p-burton>
 <CAL_Jsq+PkQmkkLMjiurmHegewpc6n_ntUMsik8oMZdM2nXHQ6g@mail.gmail.com>
 <2330857.F1IQS18Qic@np-p-burton>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2330857.F1IQS18Qic@np-p-burton>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/11, Paul Burton wrote:
> On Tuesday, 11 October 2016 15:06:46 BST Rob Herring wrote:
> > On Tue, Oct 11, 2016 at 11:00 AM, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> 
> wrote:
> > > On Monday, 10 October 2016 08:01:21 BST Rob Herring wrote:
> > >> On Wed, Oct 05, 2016 at 06:18:22PM +0100, Paul Burton wrote:
> > >> > Add device tree binding documentation for the clocks provided by the
> > >> > MIPS Boston development board from Imagination Technologies, and a
> > >> > header file describing the available clocks for use by device trees &
> > >> > driver.
> > >> > 
> > >> > Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> > >> > Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > >> > Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > >> > Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > >> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > >> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > >> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > >> > 
> > >> > ---
> > >> > 
> > >> > Changes in v3: None
> > >> > Changes in v2:
> > >> > - Add BOSTON_CLK_INPUT to expose the input clock.
> > >> > 
> > >> >  .../devicetree/bindings/clock/img,boston-clock.txt | 27
> > >> >  ++++++++++++++++++++++ include/dt-bindings/clock/boston-clock.h
> > >> >  
> > >> >   | 14 +++++++++++ 2 files changed, 41 insertions(+)
> > >> >  
> > >> >  create mode 100644
> > >> >  Documentation/devicetree/bindings/clock/img,boston-clock.txt create
> > >> >  mode
> > >> >  100644 include/dt-bindings/clock/boston-clock.h
> > >> > 
> > >> > diff --git
> > >> > a/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> > >> > b/Documentation/devicetree/bindings/clock/img,boston-clock.txt new file
> > >> > mode 100644
> > >> > index 0000000..c01ea60
> > >> > --- /dev/null
> > >> > +++ b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> > >> > @@ -0,0 +1,27 @@
> > >> > +Binding for Imagination Technologies MIPS Boston clock sources.
> > >> > +
> > >> > +This binding uses the common clock binding[1].
> > >> > +
> > >> > +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > >> > +
> > >> > +Required properties:
> > >> > +- compatible : Should be "img,boston-clock".
> > >> > +- #clock-cells : Should be set to 1.
> > >> > +  Values available for clock consumers can be found in the header
> > >> > file:
> > >> > +    <dt-bindings/clock/boston-clock.h>
> > >> > +- regmap : Phandle to the Boston platform register system controller.
> > >> > +  This should contain a phandle to the system controller node covering
> > >> > the
> > >> > +  platform registers provided by the Boston board.
> > >> 
> > >> Can you just make the clock node a child of the system controller and
> > >> drop this?
> > >> 
> > >> Rob
> > > 
> > > Hi Rob,
> > > 
> > > (Apologies to anyone who received my last; my mail client seems to be
> > > misconfigured & previously sent HTML mail.)
> > > 
> > > As I mentioned before technically that could be done, but it would really
> > > not be at all reflective of the hardware & so seems somewhat contrary to
> > > the purpose of a device tree.
> > 
> > Given that you need a reference back to the system controller, it does
> > match the h/w. The system controller h/w contains various functions,
> > therefore the system controller node should contain nodes for those
> > functions (or the sys ctrlr itself could be the clock provider node
> > with no child nodes). Otherwise, what is the parent of the clock node?
> > Root? Root should generally be the top level devices of the SoC,
> > though it gets used for things which have no good parent.
> > 
> > Rob
> 
> Hi Rob,
> 
> The "system controller" here is a bunch of registers which contain information 
> about the system - nothing more & nothing less. There are a few random bits of 
> functionality such as system level reset exposed through them, but things like 
> clocks are not part of some coherent block of hardware known as the system 
> controller. The register exposing information about the clocks has no actual 
> connection to the clocks at all - it's just a dumb register whose value is 
> filled in by whomever generates the FPGA bitfile. 

This sounds pretty much how every clk controller or syscon/mfd is
made. A dumb register set that controls a bunch of hard macros
placed by hardware designers. It just so happens that there are
other things in this register set that aren't clk controls.

> I don't see how that can be 
> reasonably seen as the clocks being a child of this ecclectic bunch of 
> registers.

Can you further describe what being a child device means to you?
There must be some reason why a child device is wrong from your
perspective that isn't coming across here.

> 
> Perhaps the use of syscon has been misleading here? I'm using the syscon code 
> purely as a nice way to obtain a regmap to that bunch of registers. Please 
> believe me when I say I know this hardware well enough to know that there 
> isn't a coherent block of system controller hardware that provides the clocks 
> here.
> 

The problem I have, from a DT perspective, is that the clks are
not on the board. Clks that live on the board go to the root of
the DT tree under / or some container clks node. In this case the
clks are in the SoC, so they should go into the SoC node, not the
root. But the SoC node should have a reg property for each child
node, and this node wouldn't have a reg property because it uses
a regmap, so from a DT perspective that's also the wrong place to
put this node.

Therefore, the best solution is to make the clk controller node a
child of the syscon, and then the reg property doesn't exist in
the clk controller node. This also nicely removes any linuxism of
needing to have a regmap property (regmap is not really a
hardware concept and is fairly linux specific) because we can
grab the regmap handle from the parent device/node.

Technically having the child node for the clk controller part is
abusing DT. We should really only have one node for the syscon,
which probes a driver that then creates platform devices in
software to match up with other drivers for the specific
functions that are accessible through the dumb register set. But
since we have MFD/syscons quite often, and things get sort of
messy when all these different things are going on within one
node and thus one big driver, we allow MFDs to be described in DT
with sub-nodes that are for the sub-functions so that we can have
drivers match up appropriately. Otherwise we're left with a big
driver for the MFD that becomes sort of like a board file to
register sub devices, or a mash up of all these different
functions that use one struct device.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
