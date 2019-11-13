Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AC5C43331
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 02:17:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E22021D7F
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 02:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573611469;
	bh=Yk0BthtfhCwG5HdWsol18bF1E9VmSioqlac3A/a++5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=RIbkKT5EHGMr5N3EWtJ1EvO6HBwiUSCNY19Npw3NOOvPwt5jS0O8gC9HZujrxfqHc
	 Jhso22jrrZ0EqaLldRQQj2/RO2voJClhMNaQ36ZjbRYL7x/XtDjwOfU/EwJZ08ptiK
	 721ma3ee9IDg7GnswTCMZFarpi01VZlB8HXyMX08=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbfKMCRk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 21:17:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:47974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729277AbfKMBz7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 20:55:59 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DEBE22474;
        Wed, 13 Nov 2019 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573610159;
        bh=Yk0BthtfhCwG5HdWsol18bF1E9VmSioqlac3A/a++5w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mNuzEANb/wLXvvYEq5GZfdOuVahIyEmuZDTqn+VsJRG/n2gXrkiCPqfuGHxkJFeCr
         De4BMUO7r8zgOB8MHpy1hWGhKl79b9w1dlDRdnb6mimXP442YEq0zaXaEnvazFjMKQ
         kTKV8pTEM2ngM9KEN4AK/Lhe+JlntUUp2rOcIvnY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Roger Quadros <rogerq@ti.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 202/209] ARM: dts: omap5: Fix dual-role mode on Super-Speed port
Date:   Tue, 12 Nov 2019 20:50:18 -0500
Message-Id: <20191113015025.9685-202-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015025.9685-1-sashal@kernel.org>
References: <20191113015025.9685-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Roger Quadros <rogerq@ti.com>

[ Upstream commit a763ecc15d0e37c3a15ff6825183061209832685 ]

OMAP5's Super-Speed USB port has a software mailbox register
that needs to be fed with VBUS and ID events from an external
VBUS/ID comparator.

Without this, Host role will not work correctly.

Fixes: 656c1a65ab55 ("ARM: dts: omap5: enable OTG role for DWC3 controller")
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/omap5-board-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/omap5-board-common.dtsi b/arch/arm/boot/dts/omap5-board-common.dtsi
index c2dc4199b4ec2..61a06f6add3ca 100644
--- a/arch/arm/boot/dts/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/omap5-board-common.dtsi
@@ -704,6 +704,7 @@
 };
 
 &dwc3 {
+	extcon = <&extcon_usb3>;
 	dr_mode = "otg";
 };
 
-- 
2.20.1

