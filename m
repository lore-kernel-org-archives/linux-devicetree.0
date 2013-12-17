From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [PATCH] mmc: atmel-mci: document clock properties
Date: Tue, 17 Dec 2013 10:36:17 +0100
Message-ID: <1387272977-4523-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Rob Landley <rob@landley.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

Document the clock properties required by the atmel-mci driver.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 .../devicetree/bindings/mmc/atmel-hsmci.txt        |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt b/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt
index 0a85c70..07ad020 100644
--- a/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt
+++ b/Documentation/devicetree/bindings/mmc/atmel-hsmci.txt
@@ -13,6 +13,9 @@ Required properties:
 - #address-cells: should be one. The cell is the slot id.
 - #size-cells: should be zero.
 - at least one slot node
+- clock-names: tuple listing input clock names.
+	Required elements: "mci_clk"
+- clocks: phandles to input clocks.
 
 The node contains child nodes for each slot that the platform uses
 
@@ -24,6 +27,8 @@ mmc0: mmc@f0008000 {
 	interrupts = <12 4>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	clock-names = "mci_clk";
+	clocks = <&mci0_clk>;
 
 	[ child node definitions...]
 };
-- 
1.7.9.5
