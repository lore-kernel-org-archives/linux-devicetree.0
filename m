From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi panels
Date: Tue, 15 Nov 2016 02:27:29 +0200
Message-ID: <1479169649-11315-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The aa104xd12 and aa121td01 panels are LVDS panels, not DPI panels.
Use the correct DT bindings.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi | 3 ++-
 arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

Hello,

This patch is an example of how the panel-lvds bindings should be used for
display panels. It isn't meant to be merged upstream at the moment as the
bindings haven't been accepted yet but can already be used as both an example
and a test base for LVDS mode selection.

diff --git a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi b/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
index 65cb50f0c29f..238d14bb0ebe 100644
--- a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
+++ b/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
@@ -10,10 +10,11 @@
 
 / {
 	panel {
-		compatible = "mitsubishi,aa104xd12", "panel-dpi";
+		compatible = "mitsubishi,aa104xd12", "panel-lvds";
 
 		width-mm = <210>;
 		height-mm = <158>;
+		data-mapping = "jeida-18";
 
 		panel-timing {
 			/* 1024x768 @65Hz */
diff --git a/arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi b/arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi
index a07ebf8f6938..04aafd479775 100644
--- a/arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi
+++ b/arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi
@@ -10,10 +10,11 @@
 
 / {
 	panel {
-		compatible = "mitsubishi,aa121td01", "panel-dpi";
+		compatible = "mitsubishi,aa121td01", "panel-lvds";
 
 		width-mm = <261>;
 		height-mm = <163>;
+		data-mapping = "jeida-18";
 
 		panel-timing {
 			/* 1280x800 @60Hz */
-- 
Regards,

Laurent Pinchart
