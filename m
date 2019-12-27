Return-Path: <SRS0=sOYF=2R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998C4C2D0C6
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 17:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6DFBC206F4
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 17:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577468681;
	bh=2LVKP5wHC3Q3pLHcTk7kp0vNarcQe3gdDziwMZJxLoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=iCoQEvdsibagvtnT5O34hEx7Uc/uLXf2YRo5lq0HktDPzHGCpfhU16F3gbFABr0+v
	 c94TX814f0CrUYeZGy7c85U0BTxOowv9TSWiN5mNPgOhsqGlhUCzw/pZL5fonnZg06
	 Th4tW+jVqd3tal3Rd5Gg7iOiYdcjsGzBi3kA8uLU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbfL0Rok (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Dec 2019 12:44:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:42872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728512AbfL0Roh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Dec 2019 12:44:37 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44111206CB;
        Fri, 27 Dec 2019 17:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577468677;
        bh=2LVKP5wHC3Q3pLHcTk7kp0vNarcQe3gdDziwMZJxLoQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L0TbfMoGVyEHSsqEKnis/AD/ETy01s4CBubu7ZcCHsgsbM8wZ5dn3t7mrByPqtU5m
         C0cnZpZ6stPfqAVRdq/cJ5NbOip95S6blpXN1tNzlPvrU2uM/h0ssCmpM3Ncg65cQs
         rtpbTiE9ADkKw2lbe2bHhu/2kuasgcwv27t6ojw4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 36/84] ARM: dts: am437x-gp/epos-evm: fix panel compatible
Date:   Fri, 27 Dec 2019 12:43:04 -0500
Message-Id: <20191227174352.6264-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227174352.6264-1-sashal@kernel.org>
References: <20191227174352.6264-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

[ Upstream commit c6b16761c6908d3dc167a0a566578b4b0b972905 ]

The LCD panel on AM4 GP EVMs and ePOS boards seems to be
osd070t1718-19ts. The current dts files say osd057T0559-34ts. Possibly
the panel has changed since the early EVMs, or there has been a mistake
with the panel type.

Update the DT files accordingly.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/am437x-gp-evm.dts  | 2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index 5b97c20c5ed4..8a17eca2bc97 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -83,7 +83,7 @@
 		};
 
 	lcd0: display {
-		compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
+		compatible = "osddisplays,osd070t1718-19ts", "panel-dpi";
 		label = "lcd";
 
 		backlight = <&lcd_bl>;
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index 6502d3397653..12735cf9674b 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -45,7 +45,7 @@
 	};
 
 	lcd0: display {
-		compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
+		compatible = "osddisplays,osd070t1718-19ts", "panel-dpi";
 		label = "lcd";
 
 		backlight = <&lcd_bl>;
-- 
2.20.1

