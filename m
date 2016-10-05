From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/2] devicetree: Add vendor prefix for Nexbox
Date: Wed,  5 Oct 2016 10:09:39 +0200
Message-ID: <1475654980-16414-2-git-send-email-narmstrong@baylibre.com>
References: <1475654980-16414-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475654980-16414-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, carlo@caione.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Nexbox is an IPTV set-top-box distributor, mainly with Amlogic SoCs:
        https://www.inexbox.com

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index a9999a3..ecb360f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -182,6 +182,7 @@ neonode		Neonode Inc.
 netgear	NETGEAR
 netlogic	Broadcom Corporation (formerly NetLogic Microsystems)
 netxeon		Shenzhen Netxeon Technology CO., LTD
+nexbox	Nexbox
 newhaven	Newhaven Display International
 nintendo	Nintendo
 nokia	Nokia
-- 
1.9.1
