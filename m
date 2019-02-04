Return-Path: <SRS0=1YNY=QL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr810130.outbound.protection.outlook.com ([40.107.81.130]:8258
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731568AbfBDOSW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 4 Feb 2019 09:18:22 -0500
From: Ken Sloat <KSloat@aampglobal.com>
Subject: [PATCH v3 2/2] media: atmel-isc: Update device tree binding
 documentation
Date: Mon, 4 Feb 2019 14:18:14 +0000
Message-ID: <20190204141756.234563-2-ksloat@aampglobal.com>
References: <20190204141756.234563-1-ksloat@aampglobal.com>
In-Reply-To: <20190204141756.234563-1-ksloat@aampglobal.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "eugen.hristev@microchip.com" <eugen.hristev@microchip.com>
Cc: Ken Sloat <KSloat@aampglobal.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>, "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Ken Sloat <ksloat@aampglobal.com>

Update device tree binding documentation specifying how to
enable BT656 with CRC decoding and specify properties for
default parallel bus type.

Signed-off-by: Ken Sloat <ksloat@aampglobal.com>
---
 Changes in v2:
 -Use correct media "bus-type" dt property.

 Changes in v3:
 -Specify default bus type.
 -Document optional parallel bus flags.

 .../devicetree/bindings/media/atmel-isc.txt       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/atmel-isc.txt b/Docume=
ntation/devicetree/bindings/media/atmel-isc.txt
index bbe0e87c6188..db3749a3964f 100644
--- a/Documentation/devicetree/bindings/media/atmel-isc.txt
+++ b/Documentation/devicetree/bindings/media/atmel-isc.txt
@@ -21,6 +21,21 @@ Required properties for ISC:
 - pinctrl-names, pinctrl-0
 	Please refer to pinctrl-bindings.txt.
=20
+Optional properties for ISC:
+- bus-type
+	When set to 6, Bt.656 decoding (embedded sync) with CRC decoding
+	is enabled. If omitted, then the default bus-type is parallel and
+	the additional properties to follow can be specified:
+- hsync-active
+	Active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
+	If unspecified, this signal is set as active HIGH.
+- vsync-active
+	Active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
+	If unspecified, this signal is set as active HIGH.
+- pclk-sample
+	Sample data on rising (1) or falling (0) edge of the pixel clock
+	signal. If unspecified, data is sampled on the rising edge.
+
 ISC supports a single port node with parallel bus. It should contain one
 'port' child node with child 'endpoint' node. Please refer to the bindings
 defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
--=20
2.17.1
