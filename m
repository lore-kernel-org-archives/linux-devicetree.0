Return-Path: <SRS0=bipS=ZI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1678C432C3
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 11:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D191206E1
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 11:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="T0BiAl+p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfKPLHZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 16 Nov 2019 06:07:25 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:59658 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfKPLHZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 16 Nov 2019 06:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OctE5FvIy835G4DwtyE7u1YIdiiGzFepyWBHSoY2nX8=; b=T0BiAl+peEgFTgQQQ/QSvpy8bm
        g23kK4g25wUsK2QYNGYQzqJtz+GOlqxCHpIlTrcNnEemc5leCErWA0noHylQfz+xFUveDkOVLp/+y
        b1DzaWeOprGgpE6UXYwZRJXY8oHAuAPupsxa0lqyWervDdnFlbk5NFSQpQ58m763XlTSG4gd8xMcK
        iY2pgHIi9xQ8rc/b/sLFvSHYxAokfK3JG8+G6+VJSFfoqNENnx1Co8Lu9Q74y7QYmRzuMU97uABTa
        uNqmwlHNur12/xYi+qkIIPwM+mI6QQhNs+72gcuhzAua5Wl2Z3g8CjYHu6mUpMPwvX7G3Elgj5Bpw
        9zbrUX4w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:37618 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1iVvux-00078I-Fc; Sat, 16 Nov 2019 11:07:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1iVvuv-0002sk-Sw; Sat, 16 Nov 2019 11:07:02 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Gregory Clement <gregory.clement@bootlin.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: uDPU: remove i2c-fast-mode
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1iVvuv-0002sk-Sw@rmk-PC.armlinux.org.uk>
Date:   Sat, 16 Nov 2019 11:07:01 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The I2C bus violates the timing specifications when run in fast mode
on the uDPU, so switch to 100kHz mode.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
index e31813a4f972..2ac1d9ae1e25 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
@@ -119,12 +119,14 @@
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins>;
+	/delete-property/mrvl,i2c-fast-mode;
 };
 
 &i2c1 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
+	/delete-property/mrvl,i2c-fast-mode;
 
 	lm75@48 {
 		status = "okay";
-- 
2.20.1

