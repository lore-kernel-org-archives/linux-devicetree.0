From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2 0/2] usb: exynos: Fix compatible strings used for device
Date: Thu, 24 Jan 2013 19:15:28 +0530
Message-ID: <1359035130-22667-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu, kgene.kim@samsung.com, thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, dianders@chromium.org, jg1.han@samsung.com, cpgs@samsung.com
List-Id: devicetree@vger.kernel.org

Using chip specific compatible string as it should be.
So fixing this for ehci-s5p, ohci-exynos and dwc3-exynos
which till now used a generic 'exynos' in their compatible strings.

Changes from v1:
	- Changing compatible string from "samsung,exynos5250-dwc3" to
	  "samsung,exynos5250-dwusb3" as per discussion happened in thread:
	  [PATCH 0/2] usb: exynos: Fix compatible strings used for device.

Vivek Gautam (2):
  usb: ehci-s5p/ohci-exynos: Fix compatible strings for the device
  usb: dwc3-exynos: Fix compatible strings for the device

 drivers/usb/dwc3/dwc3-exynos.c |    2 +-
 drivers/usb/host/ehci-s5p.c    |    2 +-
 drivers/usb/host/ohci-exynos.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.6.5
