From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/3] dwc2 patches to allow wakeup on Rockchip rk3288
Date: Mon, 22 Jun 2015 16:52:21 -0700
Message-ID: <1435017144-2971-1-git-send-email-dianders@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Petr Mladek <pmladek-AlSwsSmVLrQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Robert Schlabbach <Robert.Schlabbach-hi6Y0CQ0nG0@public.gmane.org>, Gregory Herrero <gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Zhuang Jin Can <jin.can.zhuang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb
List-Id: devicetree@vger.kernel.org

This series of patches, together with
<https://patchwork.kernel.org/patch/6652341/> from Chris Zhong and a
dts change allow us to wake up from a USB device on rk3288 boards.
The patches were tested on rk3288-jerry in the chromeos-3.14 kernel.
The chromeos-3.14 kernel tested included a full set of dwc2 backports
from upstream, so this is expected to function upstream once we get
everything setup there.


Douglas Anderson (3):
  USB: Export usb_wakeup_enabled_descendants()
  Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
  USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled

 Documentation/devicetree/bindings/usb/dwc2.txt |  4 +++
 drivers/usb/core/hub.c                         |  7 ++--
 drivers/usb/dwc2/core.h                        |  2 ++
 drivers/usb/dwc2/platform.c                    | 45 ++++++++++++++++++++++++--
 include/linux/usb/hcd.h                        |  5 +++
 5 files changed, 58 insertions(+), 5 deletions(-)

-- 
2.4.3.573.g4eafbef

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
