From: <sean.wang@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: net: mediatek: update documentation for reset signals
Date: Wed, 21 Jun 2017 15:49:51 +0800
Message-ID: <302c3965ce2bde6354cee7614852096e6cfdf6b9.1498030300.git.sean.wang@mediatek.com>
References: <cover.1498030300.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1498030300.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Since there's no user for the property reset inside the ethernet node
for current supported MediaTek SoCs and boards, so it should be safe to
update reset property in the bindings to introduce more reset signals as
corresponding that commit 7c2adaf11036 ("reset: mediatek: Add MT2701 ethsys
reset controller include file") did in order to be referenced them from
within a devicetree file.

Cc: John Crispin <john@phrozen.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 Documentation/devicetree/bindings/net/mediatek-net.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
index c7194e8..4eea17e 100644
--- a/Documentation/devicetree/bindings/net/mediatek-net.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
@@ -15,8 +15,10 @@ Required properties:
 - clock-names: the names of the clock listed in the clocks property. These are
 	"ethif", "esw", "gp2", "gp1"
 - power-domains: phandle to the power domain that the ethernet is part of
-- resets: Should contain a phandle to the ethsys reset signal
-- reset-names: Should contain the reset signal name "eth"
+- resets: Should contain phandles to the ethsys reset signals
+- reset-names: Should contain the names of reset signal listed in the resets
+		property
+		These are "fe", "gmac" and "ppe"
 - mediatek,ethsys: phandle to the syscon node that handles the port setup
 - mediatek,pctl: phandle to the syscon node that handles the ports slew rate
 	and driver current
-- 
2.7.4
