From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 00/17] Add power management support for mxs phy
Date: Tue, 3 Dec 2013 15:36:54 +0800
Message-ID: <1386056231-17258-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Felipe & Shawn,

The serial adds power management support for MXS PHY, it includes:

- Add three common PHY APIs, .set_wakeup, .notify_suspend, notify_resume.
- Related above API implementation at mxs phy driver
- misc changes and bug fixes for mxs phy to support low power mode and wakeup.

It is based on Greg's usb-next, 3.13-rc1.

Changes for v4:
- Using MXS_PHY_HAS_ANATOP to indicate which platform has anatop module
- Using mxs_phy_data to instead of mxs_phy_platform_flag
- Create is_xxx_phy() MACRO
- Add imx6sl support, and pass the test [5/17]
- Add one additional binding doc for compatible string [1/17]
- Introduce controller id to access un-regulator register region
[14/17] [15/17]
- Add waiting stable time before phy clock switches to AHB clock
(from 32K) [13/17]
- Fix one problem that only using the 1st controller register
at mxs_phy_disconnect_line [16/17]
- Fix one problem for low speed connection at very rare cases [17/17]
- Some typos


Changes for v3:
- Using flag bit to indicate SoC features/bugs, so we can remove
platform_device_id.
- Remove 3 unnecessary dts/doc patches due to above change
- Several comment change

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

Peter Chen (17):
  usb: doc: phy-mxs: Add more compatible strings
  usb: phy-mxs: Add platform judgement code
  usb: phy-mxs: Add auto clock and power setting
  usb: doc: phy-mxs: update binding for adding anatop phandle
  ARM: dts: imx6: add anatop phandle for usbphy
  usb: phy-mxs: Add anatop regmap
  usb: phy: add notify suspend and resume callback
  usb: phy-mxs: Add implementation of nofity_suspend and notify_resume
  usb: phy-mxs: Enable IC fixes for related SoCs
  usb: phy: Add set_wakeup API
  usb: phy-mxs: Add implementation of set_wakeup
  usb: phy-mxs: Add system suspend/resume API
  usb: phy-mxs: Add sync time after controller clear phcd
  ARM: dts: imx: add mxs phy controller id
  usb: phy-mxs: add controller id
  usb: phy-mxs: fix the problem by only using 1st controller's register
  usb: phy-mxs: do not set PWD.RXPWD1PT1 for low speed connection

 Documentation/devicetree/bindings/usb/mxs-phy.txt |    5 +-
 arch/arm/boot/dts/imx23.dtsi                      |    1 +
 arch/arm/boot/dts/imx28.dtsi                      |    2 +
 arch/arm/boot/dts/imx6qdl.dtsi                    |    4 +
 arch/arm/boot/dts/imx6sl.dtsi                     |    4 +
 drivers/usb/phy/phy-mxs-usb.c                     |  398 ++++++++++++++++++++-
 include/linux/usb/phy.h                           |   39 ++
 7 files changed, 437 insertions(+), 16 deletions(-)

-- 
1.7.8


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
