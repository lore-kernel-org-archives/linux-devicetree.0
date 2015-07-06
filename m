From: Douglas Anderson <dianders@chromium.org>
Subject: [REPOST PATCH 0/3] dwc2 patches to allow wakeup on Rockchip rk3288
Date: Mon,  6 Jul 2015 11:27:01 -0700
Message-ID: <1436207224-21849-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Youn <johnyoun@synopsys.com>, Felipe Balbi <balbi@ti.com>
Cc: linux-usb@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Julius Werner <jwerner@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Alexandru Stan <amstan@chromium.org>, lyz@rock-chips.com, linux-rockchip@lists.infradead.org, Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.cz>, Alan Stern <stern@rowland.harvard.edu>, devicetree@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>, Matthew Garrett <mjg59@coreos.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pratyush Anand <pratyush.anand@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Peter Chen <peter.chen@freescale.com>, Gregory Herrero <gregory.herrero@intel.com>, Robert
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
