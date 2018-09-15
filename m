From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH net-next 5/5] net: dsa: tag_gswip: Add gswip to dsa_tag_protocol_to_str()
Date: Sat, 15 Sep 2018 14:08:49 +0200
Message-ID: <20180915120849.24630-6-hauke@hauke-m.de>
References: <20180915120849.24630-1-hauke@hauke-m.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180915120849.24630-1-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

The gswip tag was missing in the dsa_tag_protocol_to_str() function, add it.

Fixes: 7969119293f5 ("net: dsa: Add Lantiq / Intel GSWIP tag support")
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 net/dsa/dsa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 5f73e96cc9e6..a69c1790bbfc 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -88,6 +88,9 @@ const char *dsa_tag_protocol_to_str(const struct dsa_device_ops *ops)
 #ifdef CONFIG_NET_DSA_TAG_EDSA
 		[DSA_TAG_PROTO_EDSA] = "edsa",
 #endif
+#ifdef CONFIG_NET_DSA_TAG_GSWIP
+		[DSA_TAG_PROTO_GSWIP] = "gswip",
+#endif
 #ifdef CONFIG_NET_DSA_TAG_KSZ
 		[DSA_TAG_PROTO_KSZ] = "ksz",
 #endif
-- 
2.11.0
