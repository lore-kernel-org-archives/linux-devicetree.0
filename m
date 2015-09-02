From: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 0/2] ARM: dts: rockchip: pull up cts lines
Date: Wed,  2 Sep 2015 16:27:57 -0700
Message-ID: <1441236479-4941-1-git-send-email-amstan@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Neil Hendin <nhendin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The flow control lines from a user accessible UART are optional,
the user might not have anything connected to those pins.
In order to prevent random interrupts happening and noise affecting
the cts pin should be pulled up.

The only boards affected (that care about uart*_cts ) are the veyron
chromeos devices and the firefly. Veyron already has something like that,
which I now have to remove in the second patch. Firefly uses uart0_cts
for the wifi chip communications, same thing as veyron, so it should be
fine having it.

Changes in v2:
- Restrict changes only to cts pin, leave rts alone
- CC people with the firefly board
- New patch removing redundant pullup code from veyron
- cover letter

Alexandru M Stan (2):
  ARM: dts: rockchip: pull up cts lines on rk3288
  ARM: dts: rockchip: Remove specific cts pullup from veyron

 arch/arm/boot/dts/rk3288-veyron.dtsi | 12 ------------
 arch/arm/boot/dts/rk3288.dtsi        |  8 ++++----
 2 files changed, 4 insertions(+), 16 deletions(-)

-- 
2.5.0.457.gab17608

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
