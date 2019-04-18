From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 0/5] USB: dwc2: Allow wakeup from suspend; enable for rk3288-veyron
Date: Wed, 17 Apr 2019 17:13:51 -0700
Message-ID: <20190418001356.124334-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, heiko@sntech.de
Cc: Alan Stern <stern@rowland.harvard.edu>, Artur Petrosyan <Arthur.Petrosyan@synopsys.com>, amstan@chromium.org, linux-rockchip@lists.infradead.org, William Wu <william.wu@rock-chips.com>, linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Randy Li <ayaka@soulik.info>, zyw@rock-chips.com, mka@chromium.org, ryandcase@chromium.org, Amelie Delaunay <amelie.delaunay@st.com>, jwerner@chromium.org, dinguyen@opensource.altera.com, Elaine Zhang <zhangqing@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, linux-arm-kernel@lists.infradead.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, Jon Flatley <jf>
List-Id: devicetree@vger.kernel.org

This re-hashes two older series I posted a long time ago, re-basing
them to mainline.  ...well, technically, atop another dwc2 series I
recently posted:

* usb: dwc2: Another attempt handling rk3288's remote wake quirk
  https://lkml.kernel.org/r/20190416215351.242246-1-dianders@chromium.org
  https://lore.kernel.org/patchwork/cover/1062972/

In general I've tried to add links to each patch pointing to relevant
older discussion.  Here are overall links to the cover letters though.
Note that for the previous "allow wakeup" series the discussion was
scattered a bit between the original post and the repost.

* usb: dwc2: bus suspend/resume that's not hibernate
  https://lkml.kernel.org/r/1446237173-15263-1-git-send-email-dianders@chromium.org
  https://lore.kernel.org/patchwork/patch/613761/

* dwc2 patches to allow wakeup on Rockchip rk3288
  https://lkml.kernel.org/r/1435017144-2971-1-git-send-email-dianders@chromium.org
  https://lore.kernel.org/patchwork/cover/572944/

* dwc2 patches to allow wakeup on Rockchip rk3288 (REPOST)
  https://lkml.kernel.org/r/1436207224-21849-1-git-send-email-dianders@chromium.org
  https://lore.kernel.org/patchwork/cover/576120/

I'm hoping there's a better chance of these things landing this time
around, but I guess we'll see.  ;-)

In case it's helpful I've put what I tested (which is based on Heiko's
for-next branch and includes patches to enable deep suspend plus two
other s2r fixes) at:

https://chromium.googlesource.com/chromiumos/third_party/kernel/+log/refs/sandbox/dianders/190417-testing-dwc2-wakeup

Changes in v2:
- Rebased to mainline atop rk3288 remote wake quirk series.
- rk3288-veyron dts patch new for v2.

Douglas Anderson (5):
  usb: dwc2: bus suspend/resume for hosts with
    DWC2_POWER_DOWN_PARAM_NONE
  USB: Export usb_wakeup_enabled_descendants()
  Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
  USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled
  ARM: dts: rockchip: Allow wakeup from rk3288-veyron's dwc2 USB ports

 .../devicetree/bindings/usb/dwc2.txt          |  3 +
 arch/arm/boot/dts/rk3288-veyron.dtsi          |  2 +
 drivers/usb/core/hub.c                        |  7 +-
 drivers/usb/dwc2/core.h                       |  5 ++
 drivers/usb/dwc2/hcd.c                        | 84 ++++++++++++-------
 drivers/usb/dwc2/platform.c                   | 43 +++++++++-
 include/linux/usb/hcd.h                       |  5 ++
 7 files changed, 113 insertions(+), 36 deletions(-)

-- 
2.21.0.593.g511ec345e18-goog
