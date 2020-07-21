Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D813C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 14:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AAB720717
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 14:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Gq1jlFk0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgGUOki (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 10:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgGUOkh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jul 2020 10:40:37 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CE4C061794
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2020 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Dhty5Sxhw/XVEAw+4+wUIgmXHj8mvNTSJ2/dX0t017g=; b=Gq1jlFk00aFSQfVFUS63swdQas
        H/beyWZ4udFkDyP+ySYRbQ0spqkT2hwaD8xKACGRQ3Tk1ssSlRgwmgfYnlrlDzqdzcnyUE2Jfgr1K
        Bcwcq55LAOqQ+pfCSTrkGHD40fkDj2c7aszVDHPkq7s7MT/OlmdSRxeExEY1LLoN3RZY3vdicCXa/
        nRPZds+QgNDsx4OCSUUn2ebaCcYqyL0JDbDVJBcGanZay8sUOLRePm8YtdlUeNGh3EROkuvj2xQzS
        Pcyd2M3jc9isg9qx40Q4gmo21SQUvI9Bqtl/I15RlHdBr1tviqsSSV2UIM1PLcRXbea6R6KSz7xgq
        vEe5+U/w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43014 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jxtRZ-0004Qz-Dw; Tue, 21 Jul 2020 15:40:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jxtRZ-0003Ta-4h; Tue, 21 Jul 2020 15:40:33 +0100
In-Reply-To: <20200721143756.GT1605@shell.armlinux.org.uk>
References: <20200721143756.GT1605@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "David S. Miller" <davem@davemloft.net>
Subject: [PATCH v2 1/3] dt: update Marvell Armada 38x COMPHY binding
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jxtRZ-0003Ta-4h@rmk-PC.armlinux.org.uk>
Date:   Tue, 21 Jul 2020 15:40:33 +0100
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Update the Marvell Armada 38x COMPHY binding with an additional
optional register pair describing the location of an undocumented
system register controlling something to do with the Gigabit Ethernet
and COMPHY.  There is one bit for each COMPHY lane that may be using
the serdes, but exactly what this register does is completely unknown.

This register only appears to exist on Armada 38x devices, and not
other SoCs using the NETA ethernet block, so it seems logical that it
should be part of the COMPHY.

This is also how u-boot groups this register; it is dealt with as part
of the COMPHY initialisation there.

However, at the end of the day, due to the undocumented nature of this
register, we can only guess.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 .../devicetree/bindings/phy/phy-armada38x-comphy.txt   | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt b/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
index ad49e5c01334..8b5a7a28a35b 100644
--- a/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
+++ b/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
@@ -12,6 +12,13 @@ PCIe...).
 - #address-cells: should be 1.
 - #size-cells: should be 0.
 
+Optional properties:
+
+- reg-names: must be "comphy" as the first name, and "conf".
+- reg: must contain the comphy register location and length as the first
+    pair, followed by an optional configuration register address and
+    length pair.
+
 A sub-node is required for each comphy lane provided by the comphy.
 
 Required properties (child nodes):
@@ -24,7 +31,8 @@ A sub-node is required for each comphy lane provided by the comphy.
 
 	comphy: phy@18300 {
 		compatible = "marvell,armada-380-comphy";
-		reg = <0x18300 0x100>;
+		reg-names = "comphy", "conf";
+		reg = <0x18300 0x100>, <0x18460 4>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-- 
2.20.1

