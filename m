Return-Path: <SRS0=Uwhs=M4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40074.outbound.protection.outlook.com ([40.107.4.74]:16160
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726990AbeJPMt4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 16 Oct 2018 08:49:56 -0400
From: Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/4] usb: chipidea: imx: add HSIC support 
Date: Tue, 16 Oct 2018 05:01:16 +0000
Message-ID: <20181016045846.2345-1-peter.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Most of NXP (Freescale) i.mx USB part has HSIC support, in this series,
we add support for them, it should cover all imx6 and imx7d. I have
no HSIC interface board which is supported by upstream kernel, so this
patches are only compiled ok, Frieder Schrempf, would you please
help me test it on your board? Thanks.

Peter Chen (4):
  usb: chipidea: add flag for imx hsic implementation
  usb: chipidea: imx: add HSIC support
  usb: chipidea: host: override ehci->hub_control
  doc: usb: ci-hdrc-usb2: Add pinctrl properties for HSIC pin groups

 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |   1 +
 drivers/usb/chipidea/ci_hdrc_imx.c                 | 153 +++++++++++++++++=
+---
 drivers/usb/chipidea/ci_hdrc_imx.h                 |   9 +-
 drivers/usb/chipidea/host.c                        |  98 +++++++++++++
 drivers/usb/chipidea/usbmisc_imx.c                 | 131 +++++++++++++++++=
+
 include/linux/usb/chipidea.h                       |   3 +
 6 files changed, 376 insertions(+), 19 deletions(-)

--=20
2.14.1
