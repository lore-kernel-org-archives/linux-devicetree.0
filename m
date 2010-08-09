From: Li Yang-R58472 <r58472@freescale.com>
Subject: RE: Review Request: New proposal for device tree clock binding.
Date: Mon, 9 Aug 2010 12:50:05 +0800
Message-ID: <F9BD3E0A8083BE4ABAA94D7EDD7E3F63109216@zch01exm26.fsl.freescale.net>
References: <AANLkTimm7G--LQHYBqPB1YCXQb7fSXPDaYsLq0p30DG1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Class: urn:content-classes:message
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss <devicetree-discuss@ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev@ozlabs.org
List-Id: devicetree@vger.kernel.org

It looks like the previous sending didn't hit the mailing list.  Resend.

Hi Grant,

I have some comment on this proposal.

>Subject: Review Request: New proposal for device tree clock binding.
>
>Hi Ben (well, hello to everyone, but I'm particularly interested in 
>Ben's feedback),
>
>Jeremy and I have been kicking around the clock binding, and we've come 
>up with a new proposal that doesn't feel quite as forced to me.
>Please take a look and let me know what you think.  The link to the 
>binding is below[1], but I've also copied the full text so that you can 
>reply and comment.  The rational for the new binding can be found in 
>talk page[2].
>
>[1] http://www.devicetree.org/ClockBindings
>[2] http://www.devicetree.org/Talk:ClockBindings
>
>---
>
>This page descibes the proposed OF clock bindings. These are a work-in- 
>progress, and are based on some 
>[http://patchwork.ozlabs.org/patch/31551/
>experimental work by benh].
>
>==Clock providers==
>
>Sources of clock signal can be represented by any node in the device tree.
>A mandatory "<tt>clock-outputs</tt>" property describes the clock 
>outputs from this device.
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
>device, rather than the name of the system-wide clock line. For 
>example, a UART with two clocks - one for baud-rate clocking, and the 
>other for register clocking - may have clock input properties named 
>"baud-clock" and "register-clock".  The property value is a tuple 
>containing the phandle to the clock provider and the name of the clock output signal.
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
