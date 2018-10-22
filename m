Return-Path: <SRS0=/AVO=NC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr10066.outbound.protection.outlook.com ([40.107.1.66]:36974
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726784AbeJVN76 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Oct 2018 09:59:58 -0400
From: Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 0/4] usb: chipidea: imx: add HSIC support
Date: Mon, 22 Oct 2018 05:42:53 +0000
Message-ID: <20181022054031.14027-1-peter.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>, Peter Chen <peter.chen@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Most of NXP (Freescale) i.mx USB part has HSIC support, in this series,
we add support for them, it should cover all imx6 and imx7d SoC.

Changes for v2:
- Compile error reported by kbuild robot [Patch 2/4]
- Comment from Frieder Schrempf about code structure [Patch 2/4]
- Comment from Fabio about adding example for pinctrl [Patch 4/4]

Peter Chen (4):
  usb: chipidea: add flag for imx hsic implementation
  usb: chipidea: imx: add HSIC support
  usb: chipidea: host: override ehci->hub_control
  doc: usb: ci-hdrc-usb2: Add pinctrl properties for HSIC pin groups

 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |   1 +
 drivers/usb/chipidea/ci_hdrc_imx.c                 | 140 +++++++++++++++++=
+---
 drivers/usb/chipidea/ci_hdrc_imx.h                 |   9 +-
 drivers/usb/chipidea/host.c                        |  98 +++++++++++++++
 drivers/usb/chipidea/usbmisc_imx.c                 | 130 +++++++++++++++++=
++
 include/linux/usb/chipidea.h                       |   3 +
 6 files changed, 362 insertions(+), 19 deletions(-)

--=20
2.14.1
