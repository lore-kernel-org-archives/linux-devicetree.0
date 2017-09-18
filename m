From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v4 0/3] initialize (multiple) PHYs in xhci-plat
Date: Mon, 18 Sep 2017 10:49:43 +0200
Message-ID: <20170918084943.GA19123@kroah.com>
References: <20170903213829.6589-1-martin.blumenstingl@googlemail.com>
 <CAFBinCCRM1e08styDV8uodkhonTUPyZrQAdYRz_bfUMe-YP1Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFBinCCRM1e08styDV8uodkhonTUPyZrQAdYRz_bfUMe-YP1Rg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 17, 2017 at 10:51:31PM +0200, Martin Blumenstingl wrote:
> Hello Mathias, Hello Greg,
> 
> On Sun, Sep 3, 2017 at 11:38 PM, Martin Blumenstingl
> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> > This series is the outcome of a discussion with Felipe Balbi,
> > see [0] and [1].
> > The quick-summary of this is:
> > - dwc3 already takes one USB2 and one USB3 PHY and initializes these
> >   correct
> > - some other HCI platform drivers (like ehci-platform.c, xhci-mtk.c and
> >   ohci-platform.c) do not have a limitation on the number of PHYs - they
> >   support one PHY per actual host port
> > - Amlogic Meson GXL and GXM SoCs come with a dwc3 IP block which has two
> >   or three USB2 ports enabled on the internal root-hub. The SoCs also
> >   provide separate USB2 PHYs, one per port. All USB2 PHYs (which are
> >   internally "connected" to the dwc3 roothub) need to be powered on,
> >   otherwise USB devices cannot be enumerated (even if just one PHY is
> >   disabled and if the device is plugged into another, enabled port)
> >
> > In my first attempt to get USB supported on the GXL and GXM SoCs I tried
> > to work-around the problem that I could not pass multiple PHYs to the
> > dwc3 controller.
> > This was rejected by Rob Herring (which was definitely the thing to do in
> > my opinion), see [2]
> >
> > This series adds a new "platform-roothub". This can be configured through
> > devicetree by passing a child-node with "reg = <0>" to the USB
> > controller. Additionally there has to be a child-node for each port on
> > the root-hub. Each of the child-nodes takes a "phys" and "phy-names"
> > property. This allows modeling the root-hub in devicetree similar to the
> > USB device binding (documented in devicetree/bindings/usb/usb-device.txt)
> > This avoids and backwards-compatibility problems (which was a concern
> > regardless of the solution, see [3]) since the binding for the root-hub
> > was previously not specified (and we're not using the "phys" property of
> > the controller, which might have served different purposes before,
> > depending on the drivers).
> >
> > Additionally this integrates the new platform-roothub into xhci-plat.c
> > which automatically enables it for the dwc3 driver (in host-mode).
> >
> >
> > Changes since RFCv3 at [6]:
> > - moved the DT binding change from patch #3 to patch #1 as suggested
> >   by Rob Herring (and slightly adjusted the commit message to account
> >   for that)
> > - added Tested-by from Chunfeng Yun (who confirmed that the whole
> >   concept and implementation works fine on Mediatek SoCs - many thanks
> >   again!) to patch #2
> > - added Rob Herring's ACK to patches 1 and 3
> > - dropped RFC status (RFCv3 -> PATCH v4)
> I just wanted to rebase this to v4.14-rc1 (now that this is out) -
> however I noticed that v4 still applies to v4.14-rc1 cleanly (the
> patches are still identical to v4 after rebasing).
> 
> we have an ACK from the devicetree maintainers and a "Tested-by" for a
> Mediatek (= non-Amlogic) SoC.
> I already have patches for the Amlogic GXL/GXM platforms queued, those
> are just waiting on this series.
> 
> what is still missing to get this series into v4.15?

Well, we couldn't do anything until 4.14-rc1 is out, now that it is, let
us catch up on patch review please...

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
