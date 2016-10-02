From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFC 1/3] Documentation: dt-bindings: add IEEE 802.11 binding documentation
Date: Mon,  3 Oct 2016 00:50:57 +0200
Message-ID: <20161002225059.16757-2-martin.blumenstingl@googlemail.com>
References: <20161002225059.16757-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161002225059.16757-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the documentation for the generic IEEE 802.111 binding, which
currently allows enabling and disabling the 2.4GHz and 5GHz band.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/net/wireless/ieee80211.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ieee80211.txt

diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.txt b/Documentation/devicetree/bindings/net/wireless/ieee80211.txt
new file mode 100644
index 0000000..41fab97
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.txt
@@ -0,0 +1,12 @@
+The following properties are common to the IEEE 802.11 controllers:
+
+- enable-ieee80211-2ghz: indicates that the 2.4GHz frequency band should be
+  enabled for this device. This must not be used together with the
+  "disable-ieee80211-2ghz" at the same time.
+- enable-ieee80211-5ghz: indicates that the 5GHz frequency band should be
+  enabled for this device. This must not be used together with the
+  "disable-ieee80211-5ghz" at the same time.
+- disable-ieee80211-2ghz: indicates that the 2.4GHz frequency band should be
+  disabled for this device.
+- disable-ieee80211-5ghz: indicates that the 5GHz frequency band should be
+  disabled for this device
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
