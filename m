From: Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v3 3/6] usb:common Patch simplify usb_decode_set_clear_feature function.
Date: Thu, 31 Jan 2019 11:52:30 +0000
Message-ID: <1548935553-452-4-git-send-email-pawell@cadence.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548935553-452-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Patch adds usb_decode_test_mode and usb_decode_device_feature functions,
which allow to make more readable and simplify the
usb_decode_set_clear_feature function.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/common/debug.c | 83 ++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
index 824b3d793745..bdd529a686e4 100644
--- a/drivers/usb/common/debug.c
+++ b/drivers/usb/common/debug.c
@@ -29,6 +29,44 @@ static void usb_decode_get_status(__u8 bRequestType, __u16 wIndex,
 	}
 }
 
+static const char *usb_decode_device_feature(u16 wValue)
+{
+	switch (wValue) {
+	case USB_DEVICE_SELF_POWERED:
+		return "Self Powered";
+	case USB_DEVICE_REMOTE_WAKEUP:
+		return "Remote Wakeup";
+	case USB_DEVICE_TEST_MODE:
+		return "Test Mode";
+	case USB_DEVICE_U1_ENABLE:
+		return "U1 Enable";
+	case USB_DEVICE_U2_ENABLE:
+		return "U2 Enable";
+	case USB_DEVICE_LTM_ENABLE:
+		return "LTM Enable";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static const char *usb_decode_test_mode(u16 wIndex)
+{
+	switch (wIndex) {
+	case TEST_J:
+		return ": TEST_J";
+	case TEST_K:
+		return ": TEST_K";
+	case TEST_SE0_NAK:
+		return ": TEST_SE0_NAK";
+	case TEST_PACKET:
+		return ": TEST_PACKET";
+	case TEST_FORCE_EN:
+		return ": TEST_FORCE_EN";
+	default:
+		return ": UNKNOWN";
+	}
+}
+
 static void usb_decode_set_clear_feature(__u8 bRequestType,
 					 __u8 bRequest, __u16 wValue,
 					 __u16 wIndex, char *str)
@@ -37,50 +75,9 @@ static void usb_decode_set_clear_feature(__u8 bRequestType,
 	case USB_RECIP_DEVICE:
 		sprintf(str, "%s Device Feature(%s%s)",
 			bRequest == USB_REQ_CLEAR_FEATURE ? "Clear" : "Set",
-			({char *s;
-				switch (wValue) {
-				case USB_DEVICE_SELF_POWERED:
-					s = "Self Powered";
-					break;
-				case USB_DEVICE_REMOTE_WAKEUP:
-					s = "Remote Wakeup";
-					break;
-				case USB_DEVICE_TEST_MODE:
-					s = "Test Mode";
-					break;
-				case USB_DEVICE_U1_ENABLE:
-					s = "U1 Enable";
-					break;
-				case USB_DEVICE_U2_ENABLE:
-					s = "U2 Enable";
-					break;
-				case USB_DEVICE_LTM_ENABLE:
-					s = "LTM Enable";
-					break;
-				default:
-					s = "UNKNOWN";
-				} s; }),
+			usb_decode_device_feature(wValue),
 			wValue == USB_DEVICE_TEST_MODE ?
-			({ char *s;
-				switch (wIndex) {
-				case TEST_J:
-					s = ": TEST_J";
-					break;
-				case TEST_K:
-					s = ": TEST_K";
-					break;
-				case TEST_SE0_NAK:
-					s = ": TEST_SE0_NAK";
-					break;
-				case TEST_PACKET:
-					s = ": TEST_PACKET";
-					break;
-				case TEST_FORCE_EN:
-					s = ": TEST_FORCE_EN";
-					break;
-				default:
-					s = ": UNKNOWN";
-				} s; }) : "");
+			usb_decode_test_mode(wIndex) : "");
 		break;
 	case USB_RECIP_INTERFACE:
 		sprintf(str, "%s Interface Feature(%s)",
-- 
2.17.1
