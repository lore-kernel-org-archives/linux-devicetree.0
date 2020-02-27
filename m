Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D9CC4BA24
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 12:06:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 302512467B
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 12:06:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="cAJJELBk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbgB0MGh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 07:06:37 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:36716 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728936AbgB0MGh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 07:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nCNdMaWEfduPAMCaE6L4kg6W7UcTSqXi+QarMl3lYVA=; b=cAJJELBkatdG6fb1vnsY+W7EOF
        zEWC8vEtjGIFYB44+yjg5BJYNTbW8XJSx9DT8MoA/iQEm9yLTYUQcT21HQ1GefUVIG13HE4rfVZ6R
        qCt7VEG0V7b7kvuHW5EKshh9Qg+jlw7c9Y9cheJZSF6Ae0Lozi2N8mK9+bVnVDon5l6F66wWyD9Ri
        KpcNTVU3yW2lm7c87kgNUfoambz2xppPqbRET4iryptXaEfyfIUIO4DYLTDknXMgdBiX3Mz/Uv0I3
        vJIs58jzGd+J2XCu5q8EayySI42dhW2B/RfnpM0/GrltAv+gLdHZFM9oWS+mTt/z+RpmO/JjulhKx
        uRwwRKrQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45872 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j7Hvw-0005OX-Ev; Thu, 27 Feb 2020 12:06:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j7Hvv-0004Vy-BO; Thu, 27 Feb 2020 12:06:27 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: lx2160a-cex7: add on-module eeproms
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1j7Hvv-0004Vy-BO@rmk-PC.armlinux.org.uk>
Date:   Thu, 27 Feb 2020 12:06:27 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Rabeeh Khoury <rabeeh@solid-run.com>

This patch adds 4 eeprom support on i2c mux channel #0 -
1. Bootable 512Kbit eeprom at address 0x50.
2. Memory SO-DIMMs SPD channels at 0x51 (upper SO-DIMM) and 0x53.
3. 2Kb eeprom at 0x57 will be used by SolidRun to hold manufacturing
   data.

Signed-off-by: Rabeeh Khoury <rabeeh@solid-run.com>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 .../boot/dts/freescale/fsl-lx2160a-cex7.dtsi  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 01c5420f334e..d87d16460875 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -59,6 +59,32 @@
 		#size-cells = <0>;
 		reg = <0x77>;
 
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c512";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,spd";
+				reg = <0x51>;
+			};
+
+			eeprom@53 {
+				compatible = "atmel,spd";
+				reg = <0x53>;
+			};
+
+			eeprom@57 {
+				compatible = "atmel,24c02";
+				reg = <0x57>;
+			};
+		};
+
 		i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.20.1

