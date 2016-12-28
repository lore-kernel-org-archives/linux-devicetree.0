From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: document common IEEE 802.11 frequency properties
Date: Wed, 28 Dec 2016 16:59:54 +0100
Message-ID: <20161228155955.25518-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

This new file should be used for properties handled at higher level and
so usable with all drivers.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 .../devicetree/bindings/net/wireless/ieee80211.txt       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ieee80211.txt

diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.txt b/Documentation/devicetree/bindings/net/wireless/ieee80211.txt
new file mode 100644
index 0000000..c762769
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.txt
@@ -0,0 +1,16 @@
+Common IEEE 802.11 properties
+
+This provides documentation of common properties that are handled by a proper
+net layer and don't require extra driver code.
+
+Optional properties:
+ - ieee80211-min-center-freq : minimal supported frequency in KHz
+ - ieee80211-max-center-freq : maximal supported frequency in KHz
+
+Example:
+
+pcie@0,0 {
+	reg = <0x0000 0 0 0 0>;
+	ieee80211-min-center-freq = <2437000>;
+	ieee80211-max-center-freq = <2457000>;
+};
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
