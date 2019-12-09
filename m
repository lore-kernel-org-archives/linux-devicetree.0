Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5652C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 12:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87E162077B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 12:00:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="exPaQpSi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbfLIMAw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 07:00:52 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:60940 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfLIMAv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 07:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8+8thKURUzCP/k4obrtyjj4C8ur3ZSOeZBOtDAyzwxs=; b=exPaQpSiFLPjwQonUDlLKUHfA3
        rkYWjOKfHN9+DZIeQzZpbQULbTTD8ymHqY8hawcmSwdkIphnx9mKFptQ8fdzCi+OepEnejiECBX7t
        tPbaIXho9p30yIHEZw9zPxHf+zr4gTrsq1m85P5UhbYE9s6YSJzgaUOcIXCMZbZAJWHvXs9PP9pUs
        wgjB41paa4S5qZXS9wDXpMob1LdnctKpeXbRHjdHQwWNcGwKlSbbbmwQvPy48rqsemWm77J+g4mt2
        ESbuPYT+qM3YfjU8d9bADRs842COo5mNGrmFDDQ+SOJvh8qmlwy1Vaw/7RK+WWsLO7qX3D6z6dFQw
        RntejQGw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:49966 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1ieHiQ-0002ns-25; Mon, 09 Dec 2019 12:00:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1ieHiP-0004wT-2O; Mon, 09 Dec 2019 12:00:37 +0000
In-Reply-To: <20191209120010.GG25745@shell.armlinux.org.uk>
References: <20191209120010.GG25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Jon Nettleton <jon@solid-run.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: lx2160a: add MDIO descriptions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ieHiP-0004wT-2O@rmk-PC.armlinux.org.uk>
Date:   Mon, 09 Dec 2019 12:00:37 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add MDIO descriptions to the lx2160a dtsi file, so we can use them in
the SolidRun Clearfog CX platform.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 0bd98f179bfa..617e1f1a2339 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -863,6 +863,26 @@
 			fsl,extts-fifo;
 		};
 
+		emdio1: mdio@8b96000 {
+			compatible = "fsl,fman-memac-mdio";
+			reg = <0x00 0x8b96000 0x00 0x1000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			little-endian;
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			status = "disabled";
+		};
+
+		emdio2: mdio@8b97000 {
+			compatible = "fsl,fman-memac-mdio";
+			reg = <0x00 0x8b97000 0x00 0x1000>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			little-endian;
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			status = "disabled";
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible = "fsl,qoriq-mc";
 			reg = <0x00000008 0x0c000000 0 0x40>,
-- 
2.20.1

