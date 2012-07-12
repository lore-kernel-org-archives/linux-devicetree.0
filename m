From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 0/3 v2] USB: host: Add Device tree support for ohci-exynos &
 ehci-s5p
Date: Thu, 12 Jul 2012 11:25:09 +0530
Message-ID: <1342072512-29945-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: l.majewski@samsung.com, a.kesavan@samsung.com, prashanth.g@samsung.com, kmpark@infradead.org, joshi@samsung.com, jg1.han@samsung.com, jy0922.shim@samsung.com, sshtylyov@mvista.com, olofj@google.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: devicetree@vger.kernel.org

From: Ajay Kumar <ajaykumar.rs@samsung.com>

Changes from v1:
1) Added comment to explain inclusion of dma_mask through pdata.
2) Replaced gpio_request() with gpio_request_one()
3) Removed gpio_set_value()

This patchset is based and tested on 3.5 rc5.
Abhilash Kesavan (1):
  USB: ehci-s5p: Add vbus setup function to the s5p ehci glue layer

Vivek Gautam (2):
  USB: ohci-exynos: Add support for device tree
  USB: ehci-s5p: Add support for device tree

 drivers/usb/host/ehci-s5p.c    |   47 ++++++++++++++++++++++++++++++++++++++++
 drivers/usb/host/ohci-exynos.c |   22 ++++++++++++++++++
 2 files changed, 69 insertions(+), 0 deletions(-)
