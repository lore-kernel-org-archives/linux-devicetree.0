Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18361C432C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 22:53:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF826222DC
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 22:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jE0yLV83"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbfKSWxV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 17:53:21 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:58588 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfKSWxV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 17:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0HyaIqYya6CA1uTTflYMH3tQcKHaSfwjbif8Y6O6VL0=; b=jE0yLV83/8kuXt8h0Grf1wN8AX
        qz2MkdtLgK0ABNRC38s45VUMVC1zz1qnbaeGQGTS/wCJahNp9cUaGz0toZxllfZMnFN1Q3k3V/XyI
        ilA/cZqqwS8s8Bs1lmf/+ya97GZsR8faMmNefGSqQJRdXZzq8WIPpXS2rc6YoxbuzukTtZSjgnJhC
        I3M9hSF74EGKUFo5zPFzYorL7DxKff/5CiSx4McqMXzXQrGTbaljum08wh9PduCF1lyIydX99EFuF
        VFkUieYyfITpWrjAZA41E/Pf2hDTGJkf1QyoJUcWR8Bi0IVQHhb54BUthhVvQg3EDWDBT5P/FW2cK
        CUiZsk8A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39670 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1iXCMr-0004Ir-CI; Tue, 19 Nov 2019 22:53:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1iXCMq-00040q-Bm; Tue, 19 Nov 2019 22:53:04 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Gregory Clement <gregory.clement@bootlin.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: uDPU: SFP cages support 3W modules
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1iXCMq-00040q-Bm@rmk-PC.armlinux.org.uk>
Date:   Tue, 19 Nov 2019 22:53:04 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SFP cages are designed to support up to 3W modules, such as G.hn,
G.fast and MoCA modules. Although there is no way for such modules to
declare to software that they consume 3W, we document in DT that this
is the designed power level for these cages.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
index 2ac1d9ae1e25..7eb6c1796cef 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
@@ -69,6 +69,7 @@
 		mod-def0-gpio = <&gpiosb 3 GPIO_ACTIVE_LOW>;
 		tx-disable-gpio = <&gpiosb 4 GPIO_ACTIVE_HIGH>;
 		tx-fault-gpio = <&gpiosb 5 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <3000>;
 	};
 
 	sfp_eth1: sfp-eth1 {
@@ -78,6 +79,7 @@
 		mod-def0-gpio = <&gpiosb 8 GPIO_ACTIVE_LOW>;
 		tx-disable-gpio = <&gpiosb 9 GPIO_ACTIVE_HIGH>;
 		tx-fault-gpio = <&gpiosb 10 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <3000>;
 	};
 };
 
-- 
2.20.1

