Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75836C43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 12:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D4A7206D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 12:41:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="FkKtLdhW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfLPMla (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 07:41:30 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:38966 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727512AbfLPMla (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 07:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8ZlRStca0Y9D95lcKR6/7QOox2XpAHGpd5QG6VTQ8ks=; b=FkKtLdhWjhT0KpjsX5G9GAzZtv
        Tz8hZhbb6s9T9pJfVyGVH23zyUr7pAkTjyes+DsHm6b+w4jIAGqNv4rQUI8MDmKvAMqg5Y0hCn4Dc
        sDe+ArMvueHz5EJtvOoZBi1dOONFG723JXYYHCFk6d/XYCfu2+RO5ywD9k6EL6moJDVie0RNeusAD
        UOPerjAihMopBUPTaTyaz6QpxbJq+OYEqyizS73qpk6ho0/h5XPA1iodKrTcAPi8Vf1sCBJsSzlhS
        uh6V5cET0AsrLgR0j/uvscfKphjoqdzgd5IJHPnkHDka6B8WCSDIt5Au59PRELZJYharVni3yrsTH
        ufAQEMrw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35812 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igpge-0007Ql-H3; Mon, 16 Dec 2019 12:41:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igpgd-0008Qe-TQ; Mon, 16 Dec 2019 12:41:19 +0000
In-Reply-To: <20191216124042.GH25745@shell.armlinux.org.uk>
References: <20191216124042.GH25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Jon Nettleton <jon@solid-run.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: lx2160a: add emdio2 node
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igpgd-0008Qe-TQ@rmk-PC.armlinux.org.uk>
Date:   Mon, 16 Dec 2019 12:41:19 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a description for the emdio2 controller to the lx2160a dtsi file,
so we can use it in the SolidRun Clearfog CX platform.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 1d09b3c650f1..af650e123eae 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -874,6 +874,16 @@
 			status = "disabled";
 		};
 
+		emdio2: mdio@8b97000 {
+			compatible = "fsl,fman-memac-mdio";
+			reg = <0x0 0x8b97000 0x0 0x1000>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			little-endian;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible = "fsl,qoriq-mc";
 			reg = <0x00000008 0x0c000000 0 0x40>,
-- 
2.20.1

