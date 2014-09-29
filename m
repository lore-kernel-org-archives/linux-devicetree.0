From: zhang.lyra@gmail.com
Subject: [PATCH 6/6] Documentation: Add entry for Spreadtrum's Shark64 SoC
Date: Mon, 29 Sep 2014 19:48:34 +0800
Message-ID: <1411991314-6636-7-git-send-email-zhang.lyra@gmail.com>
References: <1411991314-6636-1-git-send-email-zhang.lyra@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411991314-6636-1-git-send-email-zhang.lyra@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, galak@codeaurora.org, broonie@linaro.org, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, artagnon@gmail.com, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "chunyan.zhang" <chunyan.zhang@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

From: "chunyan.zhang" <chunyan.zhang@spreadtrum.com>

Adds a devicetree binding documentation for Spreadtrum's Shark64 SoC.

Signed-off-by: chunyan.zhang <chunyan.zhang@spreadtrum.com>
---
 Documentation/devicetree/bindings/arm/sprd.txt |    6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/sprd.txt

diff --git a/Documentation/devicetree/bindings/arm/sprd.txt b/Documentation/devicetree/bindings/arm/sprd.txt
new file mode 100644
index 0000000..b6dc143
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/sprd.txt
@@ -0,0 +1,6 @@
+Spreadtrum Platforms Device Tree Bindings
+----------------------------------------------------
+
+Shark64 Board
+Required root node properties:
+        - compatible = "sprd,shark64";
-- 
1.7.9.5
