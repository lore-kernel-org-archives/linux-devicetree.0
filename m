From: Josh Cartwright <josh.cartwright@ni.com>
Subject: [PATCH] arm: l2cc: doc: fix device tree example typo
Date: Tue, 23 Oct 2012 19:53:06 -0500
Message-ID: <20121024005306.GA32126@beefymiracle.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The list of attributes above details the use of the 'filter-ranges'
property, but the example improperly used 'filter-latency'.  Make these
consistent by fixing up the example.

Signed-off-by: Josh Cartwright <josh.cartwright@ni.com>
---
 Documentation/devicetree/bindings/arm/l2cc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
index 7ca5216..7c3ee3a 100644
--- a/Documentation/devicetree/bindings/arm/l2cc.txt
+++ b/Documentation/devicetree/bindings/arm/l2cc.txt
@@ -37,7 +37,7 @@ L2: cache-controller {
         reg = <0xfff12000 0x1000>;
         arm,data-latency = <1 1 1>;
         arm,tag-latency = <2 2 2>;
-        arm,filter-latency = <0x80000000 0x8000000>;
+        arm,filter-ranges = <0x80000000 0x8000000>;
         cache-unified;
         cache-level = <2>;
 	interrupts = <45>;
-- 
1.8.0
