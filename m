From: Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 6/6] ARM: meson: document meson8 compatible properties
Date: Wed,  1 Oct 2014 23:29:46 +0200
Message-ID: <1412198986-26534-7-git-send-email-b.galvani@gmail.com>
References: <1412198986-26534-1-git-send-email-b.galvani@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412198986-26534-1-git-send-email-b.galvani@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Carlo Caione <carlo@caione.org>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jerry Cao <jerry.cao@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Beniamino Galvani <b.galvani@gmail.com>
List-Id: devicetree@vger.kernel.org

Add device tree bindings documentation for Amlogic Meson8 SoCs.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 7eece72..8fe8150 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -2,7 +2,9 @@ Amlogic MesonX device tree bindings
 -------------------------------------------
 
 Boards with the Amlogic Meson6 SoC shall have the following properties:
+  Required root node property:
+    compatible: "amlogic,meson6"
 
-Required root node property:
-
-compatible = "amlogic,meson6";
+Boards with the Amlogic Meson8 SoC shall have the following properties:
+  Required root node property:
+    compatible: "amlogic,meson8";
-- 
1.9.1
