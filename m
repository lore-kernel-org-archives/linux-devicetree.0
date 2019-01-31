From: Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v3 4/6] usb:common Simplify usb_decode_get_set_descriptor function.
Date: Thu, 31 Jan 2019 11:52:31 +0000
Message-ID: <1548935553-452-5-git-send-email-pawell@cadence.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548935553-452-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Patch moves switch responsible for decoding descriptor type
outside snprintf. It's little improves code readability.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/common/debug.c | 111 +++++++++++++++++++------------------
 1 file changed, 57 insertions(+), 54 deletions(-)

diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
index bdd529a686e4..a2fbcefe1ea0 100644
--- a/drivers/usb/common/debug.c
+++ b/drivers/usb/common/debug.c
@@ -104,62 +104,65 @@ static void usb_decode_get_set_descriptor(__u8 bRequestType, __u8 bRequest,
 					  __u16 wValue, __u16 wIndex,
 					  __u16 wLength, char *str)
 {
+	char *s;
+
+	switch (wValue >> 8) {
+	case USB_DT_DEVICE:
+		s = "Device";
+		break;
+	case USB_DT_CONFIG:
+		s = "Configuration";
+		break;
+	case USB_DT_STRING:
+		s = "String";
+		break;
+	case USB_DT_INTERFACE:
+		s = "Interface";
+		break;
+	case USB_DT_ENDPOINT:
+		s = "Endpoint";
+		break;
+	case USB_DT_DEVICE_QUALIFIER:
+		s = "Device Qualifier";
+		break;
+	case USB_DT_OTHER_SPEED_CONFIG:
+		s = "Other Speed Config";
+		break;
+	case USB_DT_INTERFACE_POWER:
+		s = "Interface Power";
+		break;
+	case USB_DT_OTG:
+		s = "OTG";
+		break;
+	case USB_DT_DEBUG:
+		s = "Debug";
+		break;
+	case USB_DT_INTERFACE_ASSOCIATION:
+		s = "Interface Association";
+		break;
+	case USB_DT_BOS:
+		s = "BOS";
+		break;
+	case USB_DT_DEVICE_CAPABILITY:
+		s = "Device Capability";
+		break;
+	case USB_DT_PIPE_USAGE:
+		s = "Pipe Usage";
+		break;
+	case USB_DT_SS_ENDPOINT_COMP:
+		s = "SS Endpoint Companion";
+		break;
+	case USB_DT_SSP_ISOC_ENDPOINT_COMP:
+		s = "SSP Isochronous Endpoint Companion";
+		break;
+	default:
+		s = "UNKNOWN";
+		break;
+	}
+
 	sprintf(str, "%s %s Descriptor(Index = %d, Length = %d)",
 		bRequest == USB_REQ_GET_DESCRIPTOR ? "Get" : "Set",
-		({ char *s;
-			switch (wValue >> 8) {
-			case USB_DT_DEVICE:
-				s = "Device";
-				break;
-			case USB_DT_CONFIG:
-				s = "Configuration";
-				break;
-			case USB_DT_STRING:
-				s = "String";
-				break;
-			case USB_DT_INTERFACE:
-				s = "Interface";
-				break;
-			case USB_DT_ENDPOINT:
-				s = "Endpoint";
-				break;
-			case USB_DT_DEVICE_QUALIFIER:
-				s = "Device Qualifier";
-				break;
-			case USB_DT_OTHER_SPEED_CONFIG:
-				s = "Other Speed Config";
-				break;
-			case USB_DT_INTERFACE_POWER:
-				s = "Interface Power";
-				break;
-			case USB_DT_OTG:
-				s = "OTG";
-				break;
-			case USB_DT_DEBUG:
-				s = "Debug";
-				break;
-			case USB_DT_INTERFACE_ASSOCIATION:
-				s = "Interface Association";
-				break;
-			case USB_DT_BOS:
-				s = "BOS";
-				break;
-			case USB_DT_DEVICE_CAPABILITY:
-				s = "Device Capability";
-				break;
-			case USB_DT_PIPE_USAGE:
-				s = "Pipe Usage";
-				break;
-			case USB_DT_SS_ENDPOINT_COMP:
-				s = "SS Endpoint Companion";
-				break;
-			case USB_DT_SSP_ISOC_ENDPOINT_COMP:
-				s = "SSP Isochronous Endpoint Companion";
-				break;
-			default:
-				s = "UNKNOWN";
-				break;
-			} s; }), wValue & 0xff, wLength);
+		s, wValue & 0xff, wLength);
 }
 
 static void usb_decode_get_configuration(__u16 wLength, char *str)
-- 
2.17.1
