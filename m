From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v4 0/3] initialize (multiple) PHYs in xhci-plat
Date: Tue, 3 Oct 2017 01:18:05 +0200
Message-ID: <CAFBinCCyijSStzWmR6tO5kZkdyJx7-=OYcc1aw6s=LjSkRBNGA@mail.gmail.com>
References: <20170903213829.6589-1-martin.blumenstingl@googlemail.com>
 <CAFBinCCRM1e08styDV8uodkhonTUPyZrQAdYRz_bfUMe-YP1Rg@mail.gmail.com>
 <20170918084943.GA19123@kroah.com> <CAFBinCAweHXFbWrF9gW5f_+NeC9jChU1EkRsiLzkaKtOZkEREQ@mail.gmail.com>
 <1506947708.17300.21.camel@baylibre.com> <20171002124421.GA2324@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171002124421.GA2324-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Greg,

On Mon, Oct 2, 2017 at 2:44 PM, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Mon, Oct 02, 2017 at 02:35:08PM +0200, Jerome Brunet wrote:
>> On Sun, 2017-10-01 at 22:32 +0200, Martin Blumenstingl wrote:
>> > Hello Greg, Hello Mathias,
>> >
>> > On Mon, Sep 18, 2017 at 10:49 AM, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
>> > > On Sun, Sep 17, 2017 at 10:51:31PM +0200, Martin Blumenstingl wrote:
>> > > > Hello Mathias, Hello Greg,
>> > > >
>> > > > On Sun, Sep 3, 2017 at 11:38 PM, Martin Blumenstingl
>> > > > <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> > > > > This series is the outcome of a discussion with Felipe Balbi,
>> > > > > see [0] and [1].
>> > > > > The quick-summary of this is:
>> > > > > - dwc3 already takes one USB2 and one USB3 PHY and initializes these
>> > > > >   correct
>> > > > > - some other HCI platform drivers (like ehci-platform.c, xhci-mtk.c and
>> > > > >   ohci-platform.c) do not have a limitation on the number of PHYs - they
>> > > > >   support one PHY per actual host port
>> > > > > - Amlogic Meson GXL and GXM SoCs come with a dwc3 IP block which has two
>> > > > >   or three USB2 ports enabled on the internal root-hub. The SoCs also
>> > > > >   provide separate USB2 PHYs, one per port. All USB2 PHYs (which are
>> > > > >   internally "connected" to the dwc3 roothub) need to be powered on,
>> > > > >   otherwise USB devices cannot be enumerated (even if just one PHY is
>> > > > >   disabled and if the device is plugged into another, enabled port)
>> > > > >
>> > > > > In my first attempt to get USB supported on the GXL and GXM SoCs I tried
>> > > > > to work-around the problem that I could not pass multiple PHYs to the
>> > > > > dwc3 controller.
>> > > > > This was rejected by Rob Herring (which was definitely the thing to do
>> > > > > in
>> > > > > my opinion), see [2]
>> > > > >
>> > > > > This series adds a new "platform-roothub". This can be configured
>> > > > > through
>> > > > > devicetree by passing a child-node with "reg = <0>" to the USB
>> > > > > controller. Additionally there has to be a child-node for each port on
>> > > > > the root-hub. Each of the child-nodes takes a "phys" and "phy-names"
>> > > > > property. This allows modeling the root-hub in devicetree similar to the
>> > > > > USB device binding (documented in devicetree/bindings/usb/usb-
>> > > > > device.txt)
>> > > > > This avoids and backwards-compatibility problems (which was a concern
>> > > > > regardless of the solution, see [3]) since the binding for the root-hub
>> > > > > was previously not specified (and we're not using the "phys" property of
>> > > > > the controller, which might have served different purposes before,
>> > > > > depending on the drivers).
>> > > > >
>> > > > > Additionally this integrates the new platform-roothub into xhci-plat.c
>> > > > > which automatically enables it for the dwc3 driver (in host-mode).
>> > > > >
>> > > > >
>> > > > > Changes since RFCv3 at [6]:
>> > > > > - moved the DT binding change from patch #3 to patch #1 as suggested
>> > > > >   by Rob Herring (and slightly adjusted the commit message to account
>> > > > >   for that)
>> > > > > - added Tested-by from Chunfeng Yun (who confirmed that the whole
>> > > > >   concept and implementation works fine on Mediatek SoCs - many thanks
>> > > > >   again!) to patch #2
>> > > > > - added Rob Herring's ACK to patches 1 and 3
>> > > > > - dropped RFC status (RFCv3 -> PATCH v4)
>> > > >
>> > > > I just wanted to rebase this to v4.14-rc1 (now that this is out) -
>> > > > however I noticed that v4 still applies to v4.14-rc1 cleanly (the
>> > > > patches are still identical to v4 after rebasing).
>> > > >
>> > > > we have an ACK from the devicetree maintainers and a "Tested-by" for a
>> > > > Mediatek (= non-Amlogic) SoC.
>> > > > I already have patches for the Amlogic GXL/GXM platforms queued, those
>> > > > are just waiting on this series.
>> > > >
>> > > > what is still missing to get this series into v4.15?
>> > >
>> > > Well, we couldn't do anything until 4.14-rc1 is out, now that it is, let
>> > > us catch up on patch review please...
>> >
>> > OK, I understand that.
>> > please let me know once you've caught up with the review backlog - as
>> > I said I would like to get this into 4.15 if nothing else comes up
>> > during the code-review
>>
>> This series works well on the libretech-cc (le potato)
>> For the series:
>>
>> Tested-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>
> Hey, I have one of those boards now, was just about to try to get it to
> work.  Is this series necessary for it to run properly on 4.14-rc?
if you're speaking of the "libretech-cc (le potato)" board then indeed, it is

however, it's just one piece of the whole puzzle:
1) we need this series to initialize all USB PHYs correctly
2) we need to initialize the USB3 PHY with a basic driver, see this series: [0]
3) all the USB PHYs and the dwc3 controller has to be added to the
.dts files (no patchset was sent yet because I don't want to maintain
another series of patches as long as this one is not accepted yet)

I made a branch which includes all puzzle pieces: [1]
please let me know if this works for you!

PS: I will send an official patchset for the .dts changes once the
other two patchsets are accepted


Thank you for testing this!


Regards,
Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004780.html
[1] https://github.com/xdarklight/linux/commits/meson-gxl-usb-test-greg1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
