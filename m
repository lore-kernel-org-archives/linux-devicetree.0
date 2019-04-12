From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/4] usb: dwc2: Another attempt handling rk3288's remote wake
 quirk
Date: Fri, 12 Apr 2019 15:41:45 -0700
Message-ID: <20190412224149.106971-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Minas Harutyunyan <hminas-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, ryandcase-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is another attempt to upstream the code to unwedge the rk3288's
"host" USB port when it sees a remote wakeup.  Previously I attempted
this [1] and it appears that Randy Li made some attempts too [2] which
resulted in at least the PHY bindings for the USB PHY landing as well
as the USB PHY support.  Nice!

Hopefully this addresses previous comments and could land this time?

[1] https://lkml.kernel.org/r/1446236275-12698-2-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
[2] https://lkml.kernel.org/r/1472939729-15187-4-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org


Douglas Anderson (4):
  dt-bindings: usb: dwc2: Document quirk to reset PHY upon wakeup
  usb: dwc2: optionally assert phy reset when waking up
  ARM: dts: rockchip: Hook resets up to USB PHYs on rk3288.
  ARM: dts: rockchip: Add quirk for resetting rk3288's dwc2 host on
    wakeup

 Documentation/devicetree/bindings/usb/dwc2.txt |  2 ++
 arch/arm/boot/dts/rk3288.dtsi                  |  7 +++++++
 drivers/usb/dwc2/core.h                        |  5 +++++
 drivers/usb/dwc2/core_intr.c                   | 12 ++++++++++++
 drivers/usb/dwc2/hcd.c                         | 16 +++++++++++++---
 drivers/usb/dwc2/platform.c                    |  9 +++++++++
 6 files changed, 48 insertions(+), 3 deletions(-)

-- 
2.21.0.392.gf8f6787159e-goog
