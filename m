Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83544C4BA24
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 12:06:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BC5424695
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 12:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="UF0XdIpR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728971AbgB0MGa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 07:06:30 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:36700 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728936AbgB0MGa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 07:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=A6Y0hamrvdB8Gl43C4Ib9/2XL6AKOLLuJGlKQlOcKPI=; b=UF0XdIpRDXvFodPSMg5hy/HRFu
        DXpVUQJKhrhX9oFWyf4kdg4wLqeBNWTpkmh7PncHbCjmC5+h4wfWN0LQv/pl0Hw7f+H/UXEHyfxKD
        gOhY6Fc3JhkRbG+G/yxH6TZLvz3rirFiBNzDUmdP283QDJrhYESV/eR+FTRNPGlEt+ldaA1lAOvU+
        KujyMVghPiiIoTe8TUPt8Ol06EmMii+FqL7XIne4NXjSXzxKLufJEU3chLClhwSb1//mtiWs5nXQX
        WgnZhRvl/zK1Tq6HpGZ5tn/+h6ttDXmtElbK6xtgOYcsD/ti8pwT202Gex+xXAlwjeRxhL9WOsOD+
        pwDruUlg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:58334 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j7Hvq-0005OO-O2; Thu, 27 Feb 2020 12:06:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1j7Hvq-0004Vn-5w; Thu, 27 Feb 2020 12:06:22 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: lx2160a-cex7: add support for ltc3882 regulator
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1j7Hvq-0004Vn-5w@rmk-PC.armlinux.org.uk>
Date:   Thu, 27 Feb 2020 12:06:22 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the LTC3882 regulator so that the hardware monitoring
can be used with this device.  This regulator provides the 0.78V
supply for the LX2160A.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 071e21678f77..01c5420f334e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -73,6 +73,17 @@
 			};
 		};
 
+		i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			regulator@5c {
+				compatible = "lltc,ltc3882";
+				reg = <0x5c>;
+			};
+		};
+
 		i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.20.1

