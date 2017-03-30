From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 1/2] ARM: keystone: Create new binding for K2G ICE evm
Date: Thu, 30 Mar 2017 10:29:06 -0500
Message-ID: <20170330152907.12595-2-fcooper@ti.com>
References: <20170330152907.12595-1-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170330152907.12595-1-fcooper@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, linux@armlinux.org.uk, ssantosh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
List-Id: devicetree@vger.kernel.org

Add a new binding for the new K2G Industrial Communication Engine evm.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 Documentation/devicetree/bindings/arm/keystone/keystone.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/keystone/keystone.txt b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
index 48f6703..f310bad 100644
--- a/Documentation/devicetree/bindings/arm/keystone/keystone.txt
+++ b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
@@ -37,3 +37,6 @@ Boards:
 
 -  K2G EVM
    compatible = "ti,k2g-evm", "ti,k2g", "ti-keystone"
+
+-  K2G Industrial Communication Engine EVM
+   compatible = "ti,k2g-ice", "ti,k2g", "ti-keystone"
-- 
2.10.0
