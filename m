From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] cfg80211: reg: support ieee80211-(min|max)-center-freq DT properties
Date: Wed, 28 Dec 2016 16:59:55 +0100
Message-ID: <20161228155955.25518-2-zajec5@gmail.com>
References: <20161228155955.25518-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161228155955.25518-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

They allow specifying hardware limitations of supported channels. This
may be useful for specifying single band devices or devices that support
only some part of the whole band.
E.g. some tri-band routers have separated radios for lower and higher
part of 5 GHz band.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 net/wireless/reg.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 5dbac37..35ba5c7 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -1123,6 +1123,26 @@ const char *reg_initiator_name(enum nl80211_reg_initiator initiator)
 }
 EXPORT_SYMBOL(reg_initiator_name);
 
+static bool reg_center_freq_of_valid(struct wiphy *wiphy,
+				     struct ieee80211_channel *chan)
+{
+	struct device_node *np = wiphy_dev(wiphy)->of_node;
+	u32 val;
+
+	if (!np)
+		return true;
+
+	if (!of_property_read_u32(np, "ieee80211-min-center-freq", &val) &&
+	    chan->center_freq < KHZ_TO_MHZ(val))
+		return false;
+
+	if (!of_property_read_u32(np, "ieee80211-max-center-freq", &val) &&
+	    chan->center_freq > KHZ_TO_MHZ(val))
+		return false;
+
+	return true;
+}
+
 static uint32_t reg_rule_to_chan_bw_flags(const struct ieee80211_regdomain *regd,
 					  const struct ieee80211_reg_rule *reg_rule,
 					  const struct ieee80211_channel *chan)
@@ -1209,6 +1229,13 @@ static void handle_channel(struct wiphy *wiphy,
 		return;
 	}
 
+	if (!reg_center_freq_of_valid(wiphy, chan)) {
+		pr_debug("Disabling freq %d MHz as it's out of OF limits\n",
+			 chan->center_freq);
+		chan->flags |= IEEE80211_CHAN_DISABLED;
+		return;
+	}
+
 	regd = reg_get_regdomain(wiphy);
 
 	power_rule = &reg_rule->power_rule;
@@ -1741,6 +1768,13 @@ static void handle_channel_custom(struct wiphy *wiphy,
 		return;
 	}
 
+	if (!reg_center_freq_of_valid(wiphy, chan)) {
+		pr_debug("Disabling freq %d MHz as it's out of OF limits\n",
+			 chan->center_freq);
+		chan->flags |= IEEE80211_CHAN_DISABLED;
+		return;
+	}
+
 	power_rule = &reg_rule->power_rule;
 	bw_flags = reg_rule_to_chan_bw_flags(regd, reg_rule, chan);
 
-- 
2.10.1
