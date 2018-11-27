Return-Path: <SRS0=g9Sy=OG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]:26834
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728512AbeK0U2M (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 27 Nov 2018 15:28:12 -0500
From: PETER CHEN <peter.chen@nxp.com>
Subject: [PATCH v3 0/4] usb: chipidea: imx: add HSIC support
Date: Tue, 27 Nov 2018 09:30:50 +0000
Message-ID: <20181127092824.22756-1-peter.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>, PETER CHEN <peter.chen@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Most of NXP (Freescale) i.mx USB part has HSIC support, in this series,
we add support for them, it should cover all imx6 and imx7d SoC.

@Schrempf, since some code logic have changed, please help to re-test
v3, thanks.

Changes for v3:
- Delete the internal API ci_ehci_override_wakeup_flag, and just use
  register read/write APIs. [Patch 1/4, 3/4]
- Using dedicated API usbmisc_imx6_hsic_get_reg_offset to calculate
  offset for HSIC controller. [Patch 2/4]
- Improve the comments for binding-doc, and add the dts example [Patch 4/4]

Changes for v2:
- Compile error reported by kbuild robot [Patch 2/4]
- Comment from Frieder Schrempf about code structure [Patch 2/4]
- Comment from Fabio about adding example for pinctrl [Patch 4/4]

Peter Chen (4):
  usb: chipidea: add flag for imx hsic implementation
  usb: chipidea: imx: add HSIC support
  usb: chipidea: host: override ehci->hub_control
  doc: usb: ci-hdrc-usb2: Add pinctrl properties for HSIC pin groups

 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |   8 +-
 drivers/usb/chipidea/ci_hdrc_imx.c                 | 140 +++++++++++++++++=
+---
 drivers/usb/chipidea/ci_hdrc_imx.h                 |   9 +-
 drivers/usb/chipidea/host.c                        |  93 ++++++++++++++
 drivers/usb/chipidea/usbmisc_imx.c                 | 140 +++++++++++++++++=
++++
 include/linux/usb/chipidea.h                       |   3 +
 6 files changed, 373 insertions(+), 20 deletions(-)

--=20
2.14.1
