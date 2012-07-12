From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 0/2 v2] USB: host: Add Device tree support for dwc3-exynos
Date: Thu, 12 Jul 2012 11:30:01 +0530
Message-ID: <1342072803-15939-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: l.majewski@samsung.com, a.kesavan@samsung.com, prashanth.g@samsung.com, kmpark@infradead.org, joshi@samsung.com, jg1.han@samsung.com, jy0922.shim@samsung.com, sshtylyov@mvista.com, olofj@google.com
List-Id: devicetree@vger.kernel.org

Changes from v1:
1) Added comment to explain inclusion of dma_mask through pdata.
2) Replaced gpio_request() with gpio_request_one()
3) Removed gpio_set_value()

This patchset is based and tested on 3.5 rc5.

Abhilash Kesavan (1):
  USB: dwc3-exynos: Add vbus setup function to the exynos dwc3 glue
    layer

Vivek Gautam (1):
  USB: dwc3-exynos: Add support for device tree

 drivers/usb/dwc3/dwc3-exynos.c |   47 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)
