From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 0/4] usb: dwc2: Another attempt handling rk3288's remote wake quirk
Date: Tue, 16 Apr 2019 14:53:47 -0700
Message-ID: <20190416215351.242246-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: amstan@chromium.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>, mka@chromium.org, ryandcase@chromium.org, jwerner@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is another attempt to upstream the code to unwedge the rk3288's
"host" USB port when it sees a remote wakeup.  Previously I attempted
this [1] and it appears that Randy Li made some attempts too [2] which
resulted in at least the PHY bindings for the USB PHY landing as well
as the USB PHY support.  Nice!

Hopefully this addresses previous comments and could land this time?

[1] https://lkml.kernel.org/r/1446236275-12698-2-git-send-email-dianders@chromium.org
[2] https://lkml.kernel.org/r/1472939729-15187-4-git-send-email-ayaka@soulik.info

Changes in v2:
- Cancel the work when dwc2 is freed (Matthias).

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
 drivers/usb/dwc2/hcd.c                         | 18 +++++++++++++++---
 drivers/usb/dwc2/platform.c                    |  9 +++++++++
 6 files changed, 50 insertions(+), 3 deletions(-)

-- 
2.21.0.593.g511ec345e18-goog
