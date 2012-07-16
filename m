From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 0/3 v3] USB: host: Add Device tree support for ohci-exynos &
 ehci-s5p
Date: Mon, 16 Jul 2012 11:25:35 +0530
Message-ID: <1342418138-6192-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: l.majewski@samsung.com, a.kesavan@samsung.com, prashanth.g@samsung.com, kmpark@infradead.org, joshi@samsung.com, olofj@google.com, jg1.han@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org, sshtylyov@mvista.com
List-Id: devicetree@vger.kernel.org

Changes from v1:
1) Moved "struct of_device_id exynos_ehci_match[]"
to the next of "struct dev_pm_ops s5p_ehci_pm_ops" in ehci-s5p.c.
2) Rebased on 'usb-next' branch.

Vivek Gautam (3):
  USB: ohci-exynos: Add support for device tree
  USB: ehci-s5p: Add support for device tree
  USB: ehci-s5p: Add vbus setup function to the s5p ehci glue layer

 drivers/usb/host/ehci-s5p.c    |   47 ++++++++++++++++++++++++++++++++++++++++
 drivers/usb/host/ohci-exynos.c |   22 ++++++++++++++++++
 2 files changed, 69 insertions(+), 0 deletions(-)
