From: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v3 2/3] usb: core: hcd: use ascii2utf16le() in ascii2desc()
Date: Mon, 6 Feb 2017 15:03:39 +0100
Message-ID: <7bab6fef9bd50794ae1d0635b8f11f7befa922b4.1486388711.git.richard.leitner@skidata.com>
References: <cover.1486388711.git.richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1486388711.git.richard.leitner@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, keescook@chromium.org, dev@g0hl1n.net, Richard Leitner <richard.leitner@skidata.com>
List-Id: devicetree@vger.kernel.org

As string.c now provides ascii2utf16le() use it in ascii2desc() for
converting the string descriptor.

Furthermore fix checkpatch.pl issues in ascii2desc().

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/usb/core/hcd.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 479e223..9f84548 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -407,27 +407,25 @@ MODULE_PARM_DESC(authorized_default,
  * USB String descriptors can contain at most 126 characters; input
  * strings longer than that are truncated.
  */
-static unsigned
-ascii2desc(char const *s, u8 *buf, unsigned len)
+static unsigned int
+ascii2desc(char const *s, u8 *buf, unsigned int len)
 {
-	unsigned n, t = 2 + 2*strlen(s);
+	unsigned int t = 2 + 2 * strlen(s);
 
 	if (t > 254)
 		t = 254;	/* Longest possible UTF string descriptor */
 	if (len > t)
 		len = t;
+	if (!len)
+		return 0;
 
 	t += USB_DT_STRING << 8;	/* Now t is first 16 bits to store */
+	*buf++ = t;
+	if (len < 2)
+		return len;
+	*buf++ = t >> 8;
 
-	n = len;
-	while (n--) {
-		*buf++ = t;
-		if (!n--)
-			break;
-		*buf++ = t >> 8;
-		t = (unsigned char)*s++;
-	}
-	return len;
+	return ascii2utf16le(s, buf, (len - 2)) + 2;
 }
 
 /**
-- 
2.1.4
