Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9CCC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 00:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E74DD2078D
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 00:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591661930;
	bh=xpvaaBkLd79clqel1Y5dEhDBT9B2XLcDO9yj95ulUmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=R14xDCRedLZEtz4kU71PRmnDRgbB2ajNOZXky7OQeSyavXxDdgBwY8sNNDllrskY8
	 9akI4Wa4YmpnJqzo/a4Tu0a1uJVC0BnojmVCmjy19HJ4rPSh42K3TX0Pr5NJ1onctw
	 C7b46T1m8jSRfzX92ANGuHY51NlYOMlCixcrP5XU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731056AbgFIASe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 20:18:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:40816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730644AbgFHXSb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Jun 2020 19:18:31 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD9F020872;
        Mon,  8 Jun 2020 23:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591658311;
        bh=xpvaaBkLd79clqel1Y5dEhDBT9B2XLcDO9yj95ulUmU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TOV6b3cxqoJIVkW8C5dUqzWagINHv8lOlo1CnlEWcta/+kE+j9XIoEYV82vGNaNlg
         opkBS0VFDpMIYc0YsIqSAv2CwAGZWS+a4xUjyioktq9SNTMK6dect2kMs/7SacquGS
         nagGDi3zLEAJ+T5AxyFtwgmDOXQOT8/BbkbirzzI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Lubomir Rintel <lkundrak@v3.sk>, Arnd Bergmann <arnd@arndb.de>,
        Sasha Levin <sashal@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 312/606] ARM: dts: mmp3: Drop usb-nop-xceiv from HSIC phy
Date:   Mon,  8 Jun 2020 19:07:17 -0400
Message-Id: <20200608231211.3363633-312-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Lubomir Rintel <lkundrak@v3.sk>

[ Upstream commit 24cf6eef79a7e85cfd2ef9dea52f769c9192fc6e ]

"usb-nop-xceiv" is good enough if we don't lose the configuration done
by the firmware, but we'd really prefer a real driver.

Unfortunately, the PHY core is odd in that when the node is compatible
with "usb-nop-xceiv", it ignores the other compatible strings. Let's
just remove it.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Cc: <stable@vger.kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/mmp3.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mmp3.dtsi b/arch/arm/boot/dts/mmp3.dtsi
index 3e28f0dc9df4..1e25bf998ab5 100644
--- a/arch/arm/boot/dts/mmp3.dtsi
+++ b/arch/arm/boot/dts/mmp3.dtsi
@@ -202,8 +202,7 @@ usb_otg0: usb-otg@d4208000 {
 			};
 
 			hsic_phy0: hsic-phy@f0001800 {
-				compatible = "marvell,mmp3-hsic-phy",
-					     "usb-nop-xceiv";
+				compatible = "marvell,mmp3-hsic-phy";
 				reg = <0xf0001800 0x40>;
 				#phy-cells = <0>;
 				status = "disabled";
@@ -224,8 +223,7 @@ hsic0: hsic@f0001000 {
 			};
 
 			hsic_phy1: hsic-phy@f0002800 {
-				compatible = "marvell,mmp3-hsic-phy",
-					     "usb-nop-xceiv";
+				compatible = "marvell,mmp3-hsic-phy";
 				reg = <0xf0002800 0x40>;
 				#phy-cells = <0>;
 				status = "disabled";
-- 
2.25.1

