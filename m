From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V2 1/3] phy: Add binding document for Pistachio USB2.0 PHY
Date: Tue, 5 May 2015 16:09:31 -0700
Message-ID: <CAL1qeaG=O7LYo6RRxEMZw2da=eKAp0Dd+LxhBX32TojyBkr=xA@mail.gmail.com>
References: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
	<1428444258-25852-2-git-send-email-abrestic@chromium.org>
	<20150505220116.GE17687@jhogan-linux.le.imgtec.org>
	<CAL1qeaFacmDaCW6VSp247HZx+RwJKjYTWQhu5qxjH5JE3ET6Nw@mail.gmail.com>
	<20150505224352.GA18183@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150505224352.GA18183-4bYivNCBEGTR3KXKvIWQxtm+Uo4AYnCiHZ5vskTnxNA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 5, 2015 at 3:43 PM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> On Tue, May 05, 2015 at 03:16:23PM -0700, Andrew Bresticker wrote:
>> Hi James,
>>
>> On Tue, May 5, 2015 at 3:01 PM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>> > Hi Andrew,
>> >
>> > On Tue, Apr 07, 2015 at 03:04:16PM -0700, Andrew Bresticker wrote:
>> >> Add a binding document for the USB2.0 PHY found on the IMG Pistachio SoC.
>> >>
>> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> >> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> >> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> >> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> >> ---
>> >> No changes from v1.
>> >> ---
>> >>  .../devicetree/bindings/phy/pistachio-usb-phy.txt  | 29 ++++++++++++++++++++++
>> >>  include/dt-bindings/phy/phy-pistachio-usb.h        | 16 ++++++++++++
>> >>  2 files changed, 45 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
>> >>  create mode 100644 include/dt-bindings/phy/phy-pistachio-usb.h
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
>> >> new file mode 100644
>> >> index 0000000..afbc7e2
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
>> >> @@ -0,0 +1,29 @@
>> >> +IMG Pistachio USB PHY
>> >> +=====================
>> >> +
>> >> +Required properties:
>> >> +--------------------
>> >> + - compatible: Must be "img,pistachio-usb-phy".
>> >> + - #phy-cells: Must be 0.  See ./phy-bindings.txt for details.
>> >> + - clocks: Must contain an entry for each entry in clock-names.
>> >> +   See ../clock/clock-bindings.txt for details.
>> >> + - clock-names: Must include "usb_phy".
>> >> + - img,cr-top: Must constain a phandle to the CR_TOP syscon node.
>> >> + - img,refclk: Indicates the reference clock source for the USB PHY.
>> >> +   See <dt-bindings/phy/phy-pistachio-usb.h> for a list of valid values.
>> >
>> > Possibly dumb question: why isn't the reference clock source specified
>> > in the normal ways like the "usb_phy" clock is?
>> >
>> > Does the value required here depend on what usb_phy clock gets muxed
>> > from or something?
>>
>> Right, the value indicates what clock "usb_phy" is: whether it comes
>> from the core clock controller, the XO crystal, or is some external
>> clock.  It's a mux internal to the PHY.
>
> Okay. If its a software controllable mux, is there a particular reason
> the DT doesn't describe it as such, i.e. have all 3 clock inputs, and
> the driver somehow work out which to use?

Well, I'm not sure how the driver would determine which clock to use
without a device-tree property like the one I've got here :).  Also,
all three clock need not be present.

-Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
