From: Li Yang-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Review Request: New proposal for device tree clock binding.
Date: Thu, 5 Aug 2010 12:53:08 +0800
Message-ID: <F9BD3E0A8083BE4ABAA94D7EDD7E3F63108ED2@zch01exm26.fsl.freescale.net>
References: <AANLkTimm7G--LQHYBqPB1YCXQb7fSXPDaYsLq0p30DG1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTimm7G--LQHYBqPB1YCXQb7fSXPDaYsLq0p30DG1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

I have some comment on this proposal.

>Subject: Review Request: New proposal for device tree clock binding.
>
>Hi Ben (well, hello to everyone, but I'm particularly interested in Ben's
>feedback),
>
>Jeremy and I have been kicking around the clock binding, and we've come up
>with a new proposal that doesn't feel quite as forced to me.
>Please take a look and let me know what you think.  The link to the
>binding is below[1], but I've also copied the full text so that you can
>reply and comment.  The rational for the new binding can be found in talk
>page[2].
>
>[1] http://www.devicetree.org/ClockBindings
>[2] http://www.devicetree.org/Talk:ClockBindings
>
>---
>
>This page descibes the proposed OF clock bindings. These are a work-in-
>progress, and are based on some [http://patchwork.ozlabs.org/patch/31551/
>experimental work by benh].
>
>==Clock providers==
>
>Sources of clock signal can be represented by any node in the device tree.
>A mandatory "<tt>clock-outputs</tt>" property describes the clock outputs
>from this device.
>
>{|border=1
>!property
>!format
>!notes
>|-
>|<tt>clock-outputs</tt>
>|list of strings
>|specifies output clock signal names.
>|}
>
>For example:
>
>    oscillator {
>        clock-outputs = "ckil", "ckih";
>    };
>
>- this node defines a device with two clock outputs, the first named
>"ckil" and the second named "ckih".  Consumer nodes always reference
>clocks by name.  The names should reflect the clock output signal names
>for the device.
>
>==Clock consumers==
>
>A device connected to a clock signal needs a *-clock property for each
>clock that it is connected to.
>
>{|border=1
>!property
>!format
>!notes
>|-
>|<tt>*-clock</tt>
>|1 cell phandle to the clock provider, followed by a string containing
>the clock output name.
>|The name of this property should be the name of the clock input
>signal with a "-clock" suffix.
>|}
>
><tt>*-clock</tt> is named for the signal name for the ''clock input''
>of the device. it should describe the function of the signal for that
>device, rather than the name of the system-wide clock line. For example, a
>UART with two clocks - one for baud-rate clocking, and the other for
>register clocking - may have clock input properties named "baud-clock" and
>"register-clock".  The property value is a tuple containing the phandle to
>the clock provider and the name of the clock output signal.
>
>For example:
>
>    uart {
>        baud-clock = <&osc>, "ckil";
>        register-clock = <&ref>, "bus";
>    };
>
>
>This represents a device with two clock inputs, named "baud" and
>"register". The baud clock is connected to the "ckil" output of the "osc"
>device, and the register clock is connected to the "bus" output of the
>"ref" device.


Instead of having two items to identify a clock, I would suggest to have a node for each clock.  So that clock can be referenced by one handle.  Also we can have clock specific information defined in the clock node.  Here is the example I am planning to use on 85xx PMC.


                power@e0070{
                        compatible = "fsl,mpc8548-pmc", "fsl,p2020-pmc";
                        reg = <0xe0070 0x20>;

                        etsec1_clk: soc-clk@24{
                                fsl,pmcdr-mask = <0x00000080>;
                        };
                        etsec2_clk: soc-clk@25{
                                fsl,pmcdr-mask = <0x00000040>;
                        };
                        etsec3_clk: soc-clk@26{
                                fsl,pmcdr-mask = <0x00000020>;
                        };
                };

                enet0: ethernet@24000 {
                  ......
                        master-clock = <&etsec1_clk>;
			......


What do you think?

- Leo
