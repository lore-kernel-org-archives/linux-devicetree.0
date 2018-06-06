Return-Path: <SRS0=QZ+J=IY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:30444 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932239AbeFFG5G (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Jun 2018 02:57:06 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r8a77990: ebisu: enable USB2.0 host
Date: Wed,  6 Jun 2018 15:56:11 +0900
Message-Id: <1528268171-19276-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1528268171-19276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1528268171-19276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables USB2.0 host (EHCI/OHCI) for r8a77990 Ebisu board.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 1be10c9..76fa244 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -47,10 +47,18 @@
 	};
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <48000000>;
 };
 
+&ohci0 {
+	status = "okay";
+};
+
 &pfc {
 	avb_pins: avb {
 		mux {
-- 
1.9.1

