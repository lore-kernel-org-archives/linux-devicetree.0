Return-Path: <SRS0=Zd16=V4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:57534 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388061AbfGaNjj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 31 Jul 2019 09:39:39 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: dts: rza2mevb: Fix numbering of Ethernet aliases
Date: Wed, 31 Jul 2019 15:39:36 +0200
Message-Id: <20190731133936.18228-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The two Ethernet ports on the RZA2MEVB development board are labeled
"Ether1" and "Ether2".  Reflect this numbering in the ethernet aliases.

Fixes: eb8be0276d903a23 ("ARM: dts: rza2mevb: add ethernet aliases")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Is this the right thing to do?
Can U-Boot live with the absence of ethernet0?

 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index d062d02865e7dfbb..0686bac4bfd8e191 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -18,8 +18,8 @@
 
 	aliases {
 		serial0 = &scif4;
-		ethernet0 = &ether0;
-		ethernet1 = &ether1;
+		ethernet1 = &ether0;
+		ethernet2 = &ether1;
 	};
 
 	chosen {
-- 
2.17.1
