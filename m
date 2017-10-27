From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v7 usb-next 4/4] dt-bindings: usb: xhci: include the
 roothub and a device in the example
Date: Fri, 27 Oct 2017 15:55:13 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1710271550360.1355-100000@iolanthe.rowland.org>
References: <CAFBinCALbByzAiAqTOzGj6XHASGwWX34xg7GKf=Fa6_eiCEnkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCALbByzAiAqTOzGj6XHASGwWX34xg7GKf=Fa6_eiCEnkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 27 Oct 2017, Martin Blumenstingl wrote:

> Hi Rob,
> 
> On Fri, Oct 27, 2017 at 5:29 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Mon, Oct 23, 2017 at 11:57:18PM +0200, Martin Blumenstingl wrote:
> >> This extends the existing example from the USB xHCI binding
> >> documentation so it includes the roothub and an actual device.
> >> The goal of this is to show that the roothub is specified alongside the
> >> actual devices on the USB bus (which is important because a device on
> >> the USB bus - for example a hub - might need it's own phys / phy-names
> >> properties. modelling the roothub as separate device and not nesting the
> >> other devices on the bus below the roothub allows us to keep the
> >> properties, for example the PHYs, separated).
> >>
> >> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> >> ---
> >>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 23 ++++++++++++++++++++++
> >>  1 file changed, 23 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> >> index 5b49ba9f2f9a..20e5ce2b016a 100644
> >> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> >> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> >> @@ -42,4 +42,27 @@ Example:
> >>               compatible = "generic-xhci";
> >>               reg = <0xf0931000 0x8c8>;
> >>               interrupts = <0x0 0x4e 0x0>;
> >> +
> >> +             #address-cells = <1>;
> >> +             #size-cells = <0>;
> >> +
> >> +             /* see usb-roothub.txt */
> >> +             roothub@0 {
> >> +                     compatible = "usb1d6b,3", "usb1d6b,2";
> >> +                     #address-cells = <1>;
> >> +                     #size-cells = <0>;
> >> +                     reg = <0>;
> >> +
> >> +                     port@1 {
> >> +                             reg = <1>;
> >> +                             phys = <&usb2_phy1>, <&usb3_phy1>;
> >> +                             phy-names = "usb2-phy", "usb3-phy";
> >> +                     };
> >> +             };
> >> +
> >> +             /* see usb-device.txt */
> >> +             hub: genesys@1 {
> >
> > What do the 0 and 1 addresses correspond to?
> 0 is the address of the root-hub, 1 is the first device on the root-hub
> based on my previous dt-binding patch Arnd assumed that the devices
> would be moved in the hierarchy: [0]
> however, my understanding is that (at least for now) the root-hub node
> (identified by reg = <0>) is used to describe only the root-hub (which
> allows initializing the PHYs), not the devices that are connected to
> it
> 
> here's an example from my Khadas VIM (which matches the example from
> my patch, except: a) it has a different USB hub connected at port 1 b)
> it has two ports on the root-hub)
> this is a stripped and commented version of "cat /sys/kernel/debug/usb/devices"
> 
> T:  Bus=02 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=5000 MxCh= 0
> D:  Ver= 3.00 Cls=09(hub  ) Sub=00 Prot=03 MxPS= 9 #Cfgs=  1
> P:  Vendor=1d6b ProdID=0003 Rev= 3.14
> -> (USB3 root-hub from a dwc3 controller) in the device-tree example
> this belongs to &usb/roothub@0
> 
> T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=480  MxCh= 2
> D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=1d6b ProdID=0002 Rev= 3.14
> -> (USB2 root-hub from a dwc3 controller) in the device-tree example
> this also belongs to &usb/roothub@0
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 4
> D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=1a40 ProdID=0801 Rev= 1.00
> -> (USB2 hub soldered to the board, connected to root-hub port 1) in
> the device-tree example this belongs to &usb/genesys@1
> 
> T:  Bus=01 Lev=02 Prnt=02 Port=02 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=090c ProdID=1000 Rev= 7.22
> -> USB thumb drive connected to the USB hub, not listed in the
> device-tree example but it would be listed below &usb/genesys@1

Two things to be aware of:

    1.	/sys/kernel/debug/usb/devices has an off-by-one error in the
	"Port=" field.  Every value you see should actually be one
	higher than it is.  It has been this way for many, many years
	so we can't fix it now.

    2.	Port numbers are meaningless for root hubs, because root hubs
	by definition are not connected to any upstream USB ports.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
