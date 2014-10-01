From: Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 5/6] ARM: document Tronsmart compatible properties
Date: Wed,  1 Oct 2014 23:29:45 +0200
Message-ID: <1412198986-26534-6-git-send-email-b.galvani@gmail.com>
References: <1412198986-26534-1-git-send-email-b.galvani@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412198986-26534-1-git-send-email-b.galvani@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Carlo Caione <carlo@caione.org>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jerry Cao <jerry.cao@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Beniamino Galvani <b.galvani@gmail.com>
List-Id: devicetree@vger.kernel.org

Document device tree bindings for Tronsmart devices.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 Documentation/devicetree/bindings/arm/tronsmart.txt | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tronsmart.txt

diff --git a/Documentation/devicetree/bindings/arm/tronsmart.txt b/Documentation/devicetree/bindings/arm/tronsmart.txt
new file mode 100644
index 0000000..bd29d60
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tronsmart.txt
@@ -0,0 +1,7 @@
+Tronsmart Platforms Device Tree Bindings
+---------------------------------------
+
+Vega S89 Elite TV box
+
+Required root node properties:
+    - compatible = "tronsmart,vega-s89e";
-- 
1.9.1
