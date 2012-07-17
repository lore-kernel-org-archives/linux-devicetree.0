From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v4] USB: host: Add Device tree support for ohci-exynos &
 ehci-s5p
Date: Tue, 17 Jul 2012 10:10:49 +0530
Message-ID: <1342500050-27470-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: l.majewski@samsung.com, a.kesavan@samsung.com, prashanth.g@samsung.com, kmpark@infradead.org, joshi@samsung.com, olofj@google.com, thomas.abraham@linaro.org, sshtylyov@mvista.com, av.tikhomirov@samsung.com
List-Id: devicetree@vger.kernel.org

Reworked third patch; other two got applied to 'usb-next' branch.

Changes from v3:
1) Change the function name from s5p_ehci_setup_gpio()
to s5p_setup_vbus_gpio(). 
2) Make s5p_setup_vbus_gpio() function to return void
instead of int.
3) Return void in case of failures.

Vivek Gautam (1):
  USB: ehci-s5p: Add vbus setup function to the s5p ehci glue layer

 drivers/usb/host/ehci-s5p.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
