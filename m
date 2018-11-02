From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 1/3] dt: bindings: add missing dt properties for
 WCN3990 wifi node
Date: Fri, 2 Nov 2018 11:43:17 -0700
Message-ID: <20181102184315.GA130458@google.com>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
 <1539172376-19269-2-git-send-email-govinds@codeaurora.org>
 <153976208916.5275.15753381614937010537@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <153976208916.5275.15753381614937010537-n1Xw8LXHxjTHt/MElyovVYaSKrA+ACpX0E9HWUfgJXw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen and Govind,

I was chatting with Govind, and he seemed to be a bit stalled on this.
I'd encourage him to reply with whatever knowledge he has, because it's
a bit hard to give definitive answers when I don't know all the inner
workings here. (In fact, you, Stephen, probably know more than me about
how Qualcomm MSM chips work.)

First of all, I'll explain the limited bits I do know, and see how they
fit in below. I may be wrong.

WCN3990 is an external module, for supporting BT and Wifi RF components.
It has a host interface for the Wifi, but it's not something the host
knows how to talk to directly at all -- it's an "Analog IQ" interface,
between an internal SoC MAC and PHY processor. Instead, we talk to this
module via the System NOC (?). So while there are basically 2 distinct
hardware components (on-SoC coprocessors, various internal communication
buses, various shared memory regions, etc.; and the external WCN3990
module), there is almost no way for the main processor to "talk" to the
WCN3990 directly.

Another data point to throw into the mix: WCN3990 can apparently be used
on multiple different SoCs -- I see public announcments about SDM835
(and 660?), and I'm currently playing with it on SDM845. So perhaps
there is some value in understanding "WCN3990" as being distinct from
"WiFi MAC/PHY hardware and communication logic found on a MSM SoC." But
they do seem to be very tightly coupled...

Side note: there is also a BT component on the WCN3990 module, and we
*can* talk to that directly over UART. There's a separate binding going
in for that, and it's a much clearer separation to divide "UART
controller" and "BT/UART interface on WCN3990."

On Wed, Oct 17, 2018 at 12:41:29AM -0700, Stephen Boyd wrote:
> Quoting Govind Singh (2018-10-10 04:52:54)
> > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt

> > @@ -55,7 +63,8 @@ Optional properties:
> >  - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
> >                                      the length can vary between hw versions.
> >  - <supply-name>-supply: handle to the regulator device tree node
> > -                          optional "supply-name" is "vdd-0.8-cx-mx".
> > +                          optional "supply-name" are "vdd-0.8-cx-mx",
> > +                          "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
> 
> Why can't the wifi firmware manage these regulators itself?

In my understanding:
At least 3 of those (all the supplies Govind is adding) are external
pins on the RF module. Why do you assume these are something the
firmware can control? In the schematics I'm looking at, this seems to be
connected to a PMIC. While it's certainly possible this is something the
Q6 processor (running modem and Wifi firmware) can control, it doesn't
seem obvious to me that they *must* be able to.

So I guess I'd say: why not represent these regulators in the device
tree? It seems like a valid hardware description (like I said, 3 power
rail pins on an external module).

Now, your *next* paragraph might have hairier points :)

> And these names don't seem to match any sort of schematic or really

Which names? I see these pin names on the WCN3990 datasheets I see:

 VDD18_IO
 VDD18_XO
 VDD33_CH0
 VDD33_CH1
 VDD13_RFA

3 of those match the 3 Govind is adding, and they appear to line up with
what I see in schematics.

> describe what this device is. From what I can tell, we've combined the

I've described "waht the device is" above to the best of my knowledge.
If you're just looking at schematics, you might possibly be thrown by
the fact that WCN3990 is packaged in a module provided by other vendors,
so it might be labeled by that vendor on the schematic, not by the
Qualcomm WCN3990 name.

> off-SoC wifi module with the on-SoC wifi I/O space into one DT node here
> and then relied on that node to make some driver probe in the kernel to
> do wifi stuff. Can we model this properly by actually showing that

I'll remind you that "properly" is often highly subjective :)

> there's something in the SoC, and there's something outside the SoC, and
> these two things are connected by having two nodes and a phandle between
> them?

Why phandle? Under what bus would you place the WCN3990? As per my
description above, there is really no way to talk to it directly. So if
anything, it seems like it would be a subnode of the node we're
describing here.

In favor of your separation though: there are many ways to utilize
WCN3990 apparently, and I'd imagine the binding might change a bit
depending on the SoC (e.g., different clocks?). So there might be value
in describing the SDM{835,845,...whatever}-wifi-soc-components vs.
external WCN3990. Additionally, I don't know if it's even possible to
utilize a different RF module with the same SoC (is there a possibility
of a, e.g., WCN3991 that can use the same SoC logic?).

But I'm still not totally convinced that splitting this up really makes
much sense. Is there other precedent for splitting out a separate node
for something that we don't talk to at all (no digital interface)? Or do
we just need a more accurate compatible property, that describes the
fact that this is a SDM845+WCN3990 combination? The only thing that
software would ever do with the separate node is look it up to find the
regulators to power it on.

Brian

> >  
> >  Example (to supply the calibration data alone):
> >  
> > @@ -133,8 +142,10 @@ wifi@18000000 {
> >                 compatible = "qcom,wcn3990-wifi";
> >                 reg = <0x18800000 0x800000>;
> >                 reg-names = "membase";
> > -               clocks = <&clock_gcc clk_aggre2_noc_clk>;
> > -               clock-names = "smmu_aggre2_noc_clk"
> > +               clocks = <&clock_gcc clk_aggre2_noc_clk>,
> > +                        <&clock_gcc clk_rf_clk2_pin>;
> > +               clock-names = "smmu_aggre2_noc_clk",
> > +                             "cxo_ref_clk_pin";
> >                 interrupts =
> >                            <0 130 0 /* CE0 */ >,
> >                            <0 131 0 /* CE1 */ >,
