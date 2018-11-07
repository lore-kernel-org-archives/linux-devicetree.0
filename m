From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 1/3] dt: bindings: add missing dt properties for
 WCN3990 wifi node
Date: Tue, 6 Nov 2018 16:07:01 -0800
Message-ID: <20181107000655.GA53622@google.com>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
 <1539172376-19269-2-git-send-email-govinds@codeaurora.org>
 <153976208916.5275.15753381614937010537@swboyd.mtv.corp.google.com>
 <20181102184315.GA130458@google.com>
 <154143558212.88331.5337286842567829007@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <154143558212.88331.5337286842567829007-n1Xw8LXHxjTHt/MElyovVYaSKrA+ACpX0E9HWUfgJXw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Nov 05, 2018 at 08:33:02AM -0800, Stephen Boyd wrote:
> Quoting Brian Norris (2018-11-02 11:43:17)
> > Hi Stephen and Govind,
> > 
> > I was chatting with Govind, and he seemed to be a bit stalled on this.
> > I'd encourage him to reply with whatever knowledge he has, because it's
> > a bit hard to give definitive answers when I don't know all the inner
> > workings here. (In fact, you, Stephen, probably know more than me about
> > how Qualcomm MSM chips work.)
> > 
> > First of all, I'll explain the limited bits I do know, and see how they
> > fit in below. I may be wrong.
> > 
> > WCN3990 is an external module, for supporting BT and Wifi RF components.
> > It has a host interface for the Wifi, but it's not something the host
> > knows how to talk to directly at all -- it's an "Analog IQ" interface,
> > between an internal SoC MAC and PHY processor. Instead, we talk to this
> > module via the System NOC (?). So while there are basically 2 distinct
> > hardware components (on-SoC coprocessors, various internal communication
> > buses, various shared memory regions, etc.; and the external WCN3990
> > module), there is almost no way for the main processor to "talk" to the
> > WCN3990 directly.
> > 
> > Another data point to throw into the mix: WCN3990 can apparently be used
> > on multiple different SoCs -- I see public announcments about SDM835
> > (and 660?), and I'm currently playing with it on SDM845. So perhaps
> > there is some value in understanding "WCN3990" as being distinct from
> > "WiFi MAC/PHY hardware and communication logic found on a MSM SoC." But
> > they do seem to be very tightly coupled...
> > 
> > Side note: there is also a BT component on the WCN3990 module, and we
> > *can* talk to that directly over UART. There's a separate binding going
> > in for that, and it's a much clearer separation to divide "UART
> > controller" and "BT/UART interface on WCN3990."
> 
> Thanks for the background. I wasn't aware of much about this driver but
> taking this information and skimming the driver makes my mental model
> believe that the register space here is a custom I/O region in the SoC
> used to read/write to the BT/WiFi chip that's outside the SoC. Similar
> to i2c, SPI, or even PCI, in the way that the I/O region in the SoC is
> essentially the controller that is connected to the external chip. It's
> like the hardware engineers stuck the PCI hardware blob inside the SoC
> and then made special pins and wires for the thing the PCI device used
> to do internally. Or is that completely wrong still?

I'd still say that's somewhat wrong :)

There is literally a separate processor [1] within the SoC that runs a
hodgepodge of firmware blobs. One of those is a Wifi firmware. We talk
to the Wifi firmware through that I/O region [2] (as well as various
memory-mappings we set up for DMA, etc.). These don't really translate
directly into operations "on the external chip." There is also a bunch
of WLAN logic (MAC / PHY hardware, including ADC/DAC conversion) that
lives on the SoC, and *that* logic drives the external chip for any RF
activity. The interface between the on-chip WLAN logic and the external
RF modules consists of a couple of analog IQ lines and some control
lines. But again, we never actually program anything from the
perspective of the host CPU that looks at all like "IQ" or "RF control"
commands.

To fit your PCI-like analogy: the SoC contains both the PCI controller
and half of the PCI device (all the brains), including all digital
interfaces the host CPU actually knows how to talk to.

[1] https://en.wikipedia.org/wiki/Qualcomm_Hexagon
[2] At least, that's how I understand it. This document is the only
thing I've seen (besides their driver code) that tells me what this I/O
region is ("membase" -- how nice!). It's just listed as an empty
RESERVED block on the only SoC documentation I have.

> > On Wed, Oct 17, 2018 at 12:41:29AM -0700, Stephen Boyd wrote:
> > > Quoting Govind Singh (2018-10-10 04:52:54)
> > > > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> > > > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> > 
> > > > @@ -55,7 +63,8 @@ Optional properties:
> > > >  - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
> > > >                                      the length can vary between hw versions.
> > > >  - <supply-name>-supply: handle to the regulator device tree node
> > > > -                          optional "supply-name" is "vdd-0.8-cx-mx".
> > > > +                          optional "supply-name" are "vdd-0.8-cx-mx",
> > > > +                          "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
> > > 
> > > Why can't the wifi firmware manage these regulators itself?
> > 
> > In my understanding:
> > At least 3 of those (all the supplies Govind is adding) are external
> > pins on the RF module. Why do you assume these are something the
> > firmware can control? In the schematics I'm looking at, this seems to be
> > connected to a PMIC. While it's certainly possible this is something the
> > Q6 processor (running modem and Wifi firmware) can control, it doesn't
> > seem obvious to me that they *must* be able to.
> > 
> > So I guess I'd say: why not represent these regulators in the device
> > tree? It seems like a valid hardware description (like I said, 3 power
> > rail pins on an external module).
> 
> Agreed. I want to specify the regulators in DT. I'm mostly asking if
> there is firmware that runs and can control these regulators itself. If
> so, then I'm lost why that firmware can't manage these itself and let us
> ignore these requirements and never specify them in DT. Presumably there
> isn't firmware that can manage it?

That's my presumption. But I guess someone from Qualcomm would have to
give you a definitive answer here, as I'm not really an expert on
Qualcomm firmware.

> > Now, your *next* paragraph might have hairier points :)
> > 
> > > And these names don't seem to match any sort of schematic or really
> > 
> > Which names? I see these pin names on the WCN3990 datasheets I see:
> > 
> >  VDD18_IO
> >  VDD18_XO
> >  VDD33_CH0
> >  VDD33_CH1
> >  VDD13_RFA
> > 
> > 3 of those match the 3 Govind is adding, and they appear to line up with
> > what I see in schematics.
> 
> Yes those three match up, but the other one, vdd-0.8-cx-mx, looks like
> the CX and MX power supplies that are typical of Qualcomm designs so
> maybe those regulators are used for the I/O region inside the SoC
> instead of the off-SoC chip?

Good point. This document already wasn't so clear, because basically
everything is optional (I believe Govind is going to fix that), so it's
not clear what was actually intended for use with this WCN3990 binding.
But in practice, it looks like Qualcomm is trying to use this on
"WCN3990", and it does end up pointing at a pin directly on the SoC. I
would probably assume that's dealing with some SoC I/O region, yes. (But
I don't really know for sure.)

So if we're really going for splitting the "WCN3990" (external module)
from the "SDM845 WLAN logic", then we have 3 regulators for the former,
and 1 for the latter.

> > > describe what this device is. From what I can tell, we've combined the
> > 
> > I've described "waht the device is" above to the best of my knowledge.
> > If you're just looking at schematics, you might possibly be thrown by
> > the fact that WCN3990 is packaged in a module provided by other vendors,
> > so it might be labeled by that vendor on the schematic, not by the
> > Qualcomm WCN3990 name.
> 
> Thanks!
> 
> > 
> > > there's something in the SoC, and there's something outside the SoC, and
> > > these two things are connected by having two nodes and a phandle between
> > > them?
> > 
> > Why phandle? Under what bus would you place the WCN3990? As per my
> > description above, there is really no way to talk to it directly. So if
> > anything, it seems like it would be a subnode of the node we're
> > describing here.
> 
> I'm not tied to having a phandle at all. I'm mostly trying to make the
> following distinction in DT. If a node is under the soc node, it has a
> reg property and represents a hardware block inside the SoC. Any

The above (reg property) is true.

> regulators or clocks that the node uses should also either be provided
> inside the SoC, or be pins on the SoC that the device can be connected
> to. Otherwise, if those regulators aren't going to pins for the SoC,

The clocks are all for the SoC.

The only piece that doesn't fit is 3 of the 4 regulators -- they appear
to be for the external module, not for the SoC component.

> then it means we have a mash-up of two devices in one place in the DT
> hierarchy. This is what doesn't look proper to me, and it's why we would
> want to split the node into two nodes, the SoC part and the module part
> for the off-SoC WCN chip.
> 
> And yes, from what you've told me here it would make sense to make the
> WCN chip a subnode of this SoC node instead of a phandle connecting the
> two.

I could begrudgingly agree with that.

> > In favor of your separation though: there are many ways to utilize
> > WCN3990 apparently, and I'd imagine the binding might change a bit
> > depending on the SoC (e.g., different clocks?). So there might be value
> > in describing the SDM{835,845,...whatever}-wifi-soc-components vs.
> > external WCN3990. Additionally, I don't know if it's even possible to
> > utilize a different RF module with the same SoC (is there a possibility
> > of a, e.g., WCN3991 that can use the same SoC logic?).
> 
> Sure. Does it matter though? Even one-off solutions would be better off
> if we described what's going on at the board-level so that it isn't
> confusing to readers of the schematic and the dts file.

I suppose it has some limited value.

Side note: I don't even know what I'd call the top-level node. As of
yet, everything Qualcomm has submitted for Wifi here has used the name
WCN3990 (which is the name of the external RF chip) with no reference to
the SoC used (I've only been testing SDM845). I don't even know how much
needs to change (e.g., the Wifi firmware?) if this were to be used on
SDM835 or some other SoC. Maybe we just call it "qcom,sdm845-wifi", with
a "qcom,wcn3990-wifi" subnode (distinguished from "qcom,wcn3990-bt",
which shows up under a UART). Like:

	wifi: wifi@18800000 {
		compatible = "qcom,sdm845-wifi";
		reg = <...>
		clocks = <...>
		vdd-0.8-cx-mx-supply = <...>
		... interrupts, etc. ...

		rf { // I don't know what to call this node. Suggestions
		     // welcome.
			compatible = "qcom,wcn3990-wifi";
			vdd-1.8-xo-supply = <...>;
			vdd-1.3-rfa-supply = <...>;
			vdd-3.3-ch0-supply = <...>;
		};
	};

> Plus, it would
> allow the module creator to deliver a dts file for the module without
> having to involve the SoC bits and clearly split things so that the SoC
> dts file can be written without board assumptions.

Nice joke -- you actually think a module vendor ever looks at this
stuff? :D

In general, all regulator properties tend to be board-specific. So in
any case, the SoC dts tends to leave the regulators out, and the board
file has to know how to find the right node(s) and plug in regulators.
e.g., this isn't that hard:

&wifi {
	foo-supply = <&soc_power_rail>;
	bar-supply = <&external_module_power_rail>;
};

And it's really not much different than:

&wifi {
	foo-supply = <&soc_power_rail>;
};

&rf {
	bar-supply = <&external_module_power_rail>;
};

Anyway, I think that's mostly beside the point.

> > But I'm still not totally convinced that splitting this up really makes
> > much sense. Is there other precedent for splitting out a separate node
> > for something that we don't talk to at all (no digital interface)? Or do
> > we just need a more accurate compatible property, that describes the
> > fact that this is a SDM845+WCN3990 combination? The only thing that
> > software would ever do with the separate node is look it up to find the
> > regulators to power it on.
> > 
> 
> Agreed, it may seem like overkill, but I'll argue that this part allows
> us to easily see where the division of clocks and regulators is, instead
> of having to mentally untangle the external module from the internal SoC
> bits. I started to compare the AHB and the SNOC bus types in the ath10k
> driver but then I decided they were just a little bit different from
> each other to where this split wouldn't help that code.

Yeah...I tried to look into some schematics for some of the Google Wifi
devices that use that driver, for comparison. It actually appears to me
like the IPQ4019 SoC is even more highly-integrated -- the only external
components are some Front-End Modules (?), which do little more than
some amplification, and RX/TX switching. You can find some basic product
info for one of these under the Skyworks SKY85717 name. In practice, we
don't even really have a separate regulator for them (they just run off
one of the main system power rails), and there is zero software
interface to them.

So in that case, the IPQ4019 / AHB stuff is really an "all-in-one" SoC
component, in my understanding. *Maybe* we could split out some
description of the FEM if it really had a set of regulators we needed to
describe. But that seems like overkill.

> So like you say, if in the future the same SNOC hardware block will be
> used with a different WCN chip that has different clock and power
> requirements it would be very easy to integrate that by writing a new
> sub-device node and driver and doing this split. I admit that there
> would be some new work in the ath10k driver to support sub-device
> drivers that the bus layer communicates with and it may conflict with
> the way the PCI designs are implemented, but I would still argue this is
> better from a DT implementer perspective because we can see what things
> are on the board and what things are in the SoC.

If we were to split out a subnode, I doubt we'd actually make a
sub-device and driver -- we'd just have the top-level device look down
into its sub-node to pull out the tiny bits (a few regulators and maybe
a 'compatible' property) that it needs. But then, DT is not supposed to
describe drivers (haha), so that shouldn't be relevant here.

Brian
