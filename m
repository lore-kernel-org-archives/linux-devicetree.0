Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113C6FA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 11:50:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9181222CF
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573213820;
	bh=4NXxofZg6m5oA+hNS+P7ZDwTsh2sBcyDS545n4/vvoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=VdLwVQNEaTFKgdg+DBCPKu4yOPNmcBNVnfa4ofNElVc8jPma8HsEU3YS5LlKSmskI
	 PLyzN6uIMN45LXOZyql52Dk1Qxxu6bZRT3tN2znFN817IpbKcBUFgHyfDEc+u2jkhd
	 6NInVgn8//fbWv9l1LvTmjX0F4IbtZ/KoT8TFjC4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732671AbfKHLuU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:50:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:36616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391676AbfKHLrv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 06:47:51 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4502A222C5;
        Fri,  8 Nov 2019 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573213671;
        bh=4NXxofZg6m5oA+hNS+P7ZDwTsh2sBcyDS545n4/vvoQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YJOL75LPfZfsa+TwHQXmvFA/nYcOZ9a4PWbsVRl3dNNEeA54hJlqCA2aReZed16rp
         PyVcq45gFKwk5+8UYhtMrUX6f4e9a4V6U6NWFq0nWY3sBtUvcUiqk1uLPcMD2IVNSZ
         v0y13nhVlt9XvIXrUFSMblsz7/h2E5sOB1JYMbbU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 23/44] ARM: dts: omap3-gta04: keep vpll2 always on
Date:   Fri,  8 Nov 2019 06:46:59 -0500
Message-Id: <20191108114721.15944-23-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108114721.15944-1-sashal@kernel.org>
References: <20191108114721.15944-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: "H. Nikolaus Schaller" <hns@goldelico.com>

[ Upstream commit 1ae00833e30c9b4af5cbfda65d75b1de12f74013 ]

This is needed to make the display and venc work properly.
Compare to omap3-beagle.dts.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/omap3-gta04.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index 0ea793e365e45..acd0a9deb116b 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -460,6 +460,12 @@
 	regulator-max-microvolt = <3150000>;
 };
 
+/* Needed to power the DPI pins */
+
+&vpll2 {
+	regulator-always-on;
+};
+
 &dss {
 	pinctrl-names = "default";
 	pinctrl-0 = < &dss_dpi_pins >;
-- 
2.20.1

