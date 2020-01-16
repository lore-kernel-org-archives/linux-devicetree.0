Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979AFC33CB6
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 17:33:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E07F246A3
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579196007;
	bh=8Flq+0IPg2YLkKNvbKUs/GHrA0VMXFzGii5N095zoIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gl3t6lcd8Ee9i5NHx7+z1yZnqyOqE/e4eiuf+yE0qAn2ikMO4VddcM9A5EJcqC3Aj
	 7C/K8OlSKb18Fbb4WSE2WZgLew9vLd8J0a8+mY+wesKz+5/hForxEWeieErlQiA2Xq
	 SYCHtFUihvjG4AKj2LEQ8p7/BlVhBHNjQUWAnr+0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404452AbgAPRa2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 12:30:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:43088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404450AbgAPRa2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jan 2020 12:30:28 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 410E124731;
        Thu, 16 Jan 2020 17:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579195828;
        bh=8Flq+0IPg2YLkKNvbKUs/GHrA0VMXFzGii5N095zoIc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fu9MXidAD7N6NUyaU/AFMByMzDvJebnid4Lw3Jspjhs0VjrKl/7VFEZnU3iHFVJ4B
         B8vGnjNmu2PivP5CYQRUgXptuVIFD3el5ZEhQEoQ0CatsDMN3BluhczqEZPJxyT/hu
         zM4e0CNLrY/JKI3Osafb4lBUwyhsCaz2ra+vp1NE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 335/371] arm64: dts: meson-gxl-s905x-khadas-vim: fix gpio-keys-polled node
Date:   Thu, 16 Jan 2020 12:23:27 -0500
Message-Id: <20200116172403.18149-278-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Christian Hewitt <christianshewitt@gmail.com>

[ Upstream commit d5f6fa904ecbadbb8e9fa6302b0fc165bec0559a ]

Fix DTC warnings:

arch/arm/dts/meson-gxl-s905x-khadas-vim.dtb: Warning (avoid_unnecessary_addr_size):
   /gpio-keys-polled: unnecessary #address-cells/#size-cells
      without "ranges" or child "reg" property

Fixes: e15d2774b8c0 ("ARM64: dts: meson-gxl: add support for the Khadas VIM board")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index fb5db5f33e8c..ce4a116382bf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -33,11 +33,9 @@
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
-		button@0 {
+		power-button {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
-- 
2.20.1

