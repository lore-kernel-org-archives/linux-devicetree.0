Return-Path: <SRS0=Uwhs=M4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ve1eur01on0074.outbound.protection.outlook.com ([104.47.1.74]:41568
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727528AbeJPMul (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 16 Oct 2018 08:50:41 -0400
From: Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties for HSIC
 pin groups
Date: Tue, 16 Oct 2018 05:01:28 +0000
Message-ID: <20181016045846.2345-5-peter.chen@nxp.com>
References: <20181016045846.2345-1-peter.chen@nxp.com>
In-Reply-To: <20181016045846.2345-1-peter.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>
List-ID: <devicetree@vger.kernel.org>

For USB HSIC, the data and strobe pin needs to be pulled down
at default, we consider it as "idle" state. When the USB host
is ready to be used, the strobe pin needs to be pulled up,
we consider it as "active" state.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Docum=
entation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 529e51879fb2..10c8d793ea49 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -81,6 +81,7 @@ Optional properties:
   mux state of 1 indicates host mode.
 - mux-control-names: Shall be "usb_switch" if mux-controls is specified.
 - pinctrl-names: Names for optional pin modes in "default", "host", "devic=
e"
+  Or names for HSIC "idle" and "active" pin modes.
 - pinctrl-n: alternate pin modes
=20
 i.mx specific properties
--=20
2.14.1
