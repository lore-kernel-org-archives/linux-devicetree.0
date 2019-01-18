Return-Path: <SRS0=ctnT=P2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr730097.outbound.protection.outlook.com ([40.107.73.97]:58688
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727481AbfARO2Y (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 18 Jan 2019 09:28:24 -0500
From: Ken Sloat <KSloat@aampglobal.com>
Subject: [PATCH v2 2/2] media: atmel-isc: Update device tree binding
 documentation
Date: Fri, 18 Jan 2019 14:28:17 +0000
Message-ID: <20190118142803.70160-2-ksloat@aampglobal.com>
References: <20190118142803.70160-1-ksloat@aampglobal.com>
In-Reply-To: <20190118142803.70160-1-ksloat@aampglobal.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "eugen.hristev@microchip.com" <eugen.hristev@microchip.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Ken Sloat <ksloat@aampglobal.com>

Update device tree binding documentation specifying how to
enable BT656 with CRC decoding.

Signed-off-by: Ken Sloat <ksloat@aampglobal.com>
---
 Changes in v2:
 -Use correct media "bus-type" dt property.
=20
 Documentation/devicetree/bindings/media/atmel-isc.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/atmel-isc.txt b/Docume=
ntation/devicetree/bindings/media/atmel-isc.txt
index bbe0e87c6188..2d4378dfd6c8 100644
--- a/Documentation/devicetree/bindings/media/atmel-isc.txt
+++ b/Documentation/devicetree/bindings/media/atmel-isc.txt
@@ -21,6 +21,11 @@ Required properties for ISC:
 - pinctrl-names, pinctrl-0
 	Please refer to pinctrl-bindings.txt.
=20
+Optional properties for ISC:
+- bus-type
+	When set to 6, Bt.656 decoding (embedded sync) with CRC decoding
+	is enabled.
+
 ISC supports a single port node with parallel bus. It should contain one
 'port' child node with child 'endpoint' node. Please refer to the bindings
 defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
--=20
2.17.1
