From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [Patch v2 00/14] Add power management support for MXS PHY
Date: Tue, 22 Oct 2013 13:58:34 +0800
Message-ID: <1382421528-17897-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Felipe,

   The serial adds power management support for MXS PHY, it includes:

   - Add three common PHY API, .set_wakeup, .notify_suspend, notify_resume.
   - Related above API implementation at mxs phy driver
   - misc changes for mxs phy to support low power mode and wakeup.

Changes for v2:

- Add missing patches which introduce platform judgement code [1/14,2/14]
- re-order the patch sequence, like doc->dts->source file, 
the reviewers can know the meaning of dt properties before review source
- Add description of two IC problems exsiting at mxs PHY; change
"high speed" to "HS" and "non-high speed" to "FS/LS" [5/14]
- Change the dt property disconnect-line-without-vbus
that the separator should be "-" not the "_", meanwhile, related source
code has changed.
- Using one local variable to get the function return val to avoid long
condition statement. [13/14]

Peter Chen (14):
  usb: doc: phy-mxs: Add more compatible strings
  usb: phy-mxs: Add platform judgement code
  usb: phy-mxs: Add auto clock and power setting
  usb: doc: phy-mxs: update binding for adding anatop phandle
  ARM: dts: imx6: add anatop phandle for usbphy
  usb: phy-mxs: Add anatop regmap
  usb: phy: add notify suspend and resume callback
  usb: phy-mxs: Add implementation of nofity_suspend and notify_resume
  usb: phy-mxs: Enable IC fixes for mx6 SoC serial
  usb: doc: phy-mxs: update binding for adding disconnect line property
  ARM: dts: imx6: Add disconnect-line-without-vbus property for usbphy
  usb: phy: Add set_wakeup API
  usb: phy-mxs: Add implementation of set_wakeup
  usb: phy-mxs: Add system suspend/resume API

 Documentation/devicetree/bindings/usb/mxs-phy.txt |   12 +-
 arch/arm/boot/dts/imx6qdl.dtsi                    |    3 +
 drivers/usb/phy/phy-mxs-usb.c                     |  328 ++++++++++++++++++++-
 include/linux/usb/phy.h                           |   39 +++
 4 files changed, 367 insertions(+), 15 deletions(-)


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
