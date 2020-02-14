Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362E9C2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 17:30:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10F5E2467B
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581701432;
	bh=881Yyyw2fSkV4kx7RDvxnSQOK+0PXzO6EwfTy9I53jY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=CSiqz9YsV1BwgJO9kY1T4dBqaobGpW/iYVCkGMCB64qzVUTYAjZ1esTwKdS+rMUcY
	 DXhX0HbjraSyABHtYgKPzqBko8u0Opgi49URfyQr0IONa9eHe3N6nYyevQ+HP2jra9
	 oaIlkFb1LuWgG+uqqORmEP/YQD5Kokjj5NfADiGM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390346AbgBNRa0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 12:30:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:58884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390684AbgBNQH3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 11:07:29 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E9882067D;
        Fri, 14 Feb 2020 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581696448;
        bh=881Yyyw2fSkV4kx7RDvxnSQOK+0PXzO6EwfTy9I53jY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RHzB4mgipQqKwlB+7U1nXrag9mVvvuSxz6gXOX+RnAIWpJQYIHCp2AbianxX5kyM6
         rCnwCtfRjqE7vi/lb0Sa2jW1kBjbFhbk/T2nRDzuBU50ySyxR99XX7Vi+XtiLlapyT
         87zf+i9uhNB3XGapONTqE+7LXCmtmi2c7EDkwvfI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 262/459] ARM: dts: meson8b: use the actual frequency for the GPU's 364MHz OPP
Date:   Fri, 14 Feb 2020 10:58:32 -0500
Message-Id: <20200214160149.11681-262-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit c3dd3315ab58b2cfa1916df55b0d0f9fbd94266f ]

The clock setup on Meson8 cannot achieve a Mali frequency of exactly
182.15MHz. The vendor driver uses "FCLK_DIV7 / 1" for this frequency,
which translates to 2550MHz / 7 / 1 = 364285714Hz.
Update the GPU operating point to that specific frequency to not confuse
myself when comparing the frequency from the .dts with the actual clock
rate on the system.

Fixes: c3ea80b6138cae ("ARM: dts: meson8b: add the Mali-450 MP2 GPU")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/meson8b.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 099bf8e711c94..1e8c5d7bc824a 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -125,8 +125,8 @@
 			opp-hz = /bits/ 64 <255000000>;
 			opp-microvolt = <1100000>;
 		};
-		opp-364300000 {
-			opp-hz = /bits/ 64 <364300000>;
+		opp-364285714 {
+			opp-hz = /bits/ 64 <364285714>;
 			opp-microvolt = <1100000>;
 		};
 		opp-425000000 {
-- 
2.20.1

