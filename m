Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93374C33CAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 17:00:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B84F20728
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 17:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579194034;
	bh=6Ug92YadfEZxVr0FlvxM6ejPmYEO8+O6flfaEHVSANM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=CltaWXEfg6L5fG8chyJEoR/EjDuSbXQ9JQ6w1XIm3f0I0xgpw33bYQS/PJUyBuJRi
	 SeFMfbkiJ/iZmpeJhVU+LfG8V/NrtifwTT4cPFCIag/BFOZbNmDIZ82PYu4v5pD24E
	 K2NTIw8PyVwlwjne2EL0d1hn4fKvqCPAWa1jJYWE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729521AbgAPRAd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 12:00:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:50316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387847AbgAPRAc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jan 2020 12:00:32 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4984C21D56;
        Thu, 16 Jan 2020 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579194032;
        bh=6Ug92YadfEZxVr0FlvxM6ejPmYEO8+O6flfaEHVSANM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n5KE6iQYgCQbYSXgX/M6CalYswcD/lgI3R0RbSs+ppcTISRNPQUgSRzylDLbIkFzL
         6n+szvxBfwY8MMesK1uIdLWxAzBXhvHAJHcEx+JGAdC2/xUW7E0VoJ5VjzfWPYXF5u
         I+jYtLSknQgIN/V+1WQV81aW4ROjXHwK0hQmxa1M=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Vladimir Zapolskiy <vz@mleia.com>, Sasha Levin <sashal@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 151/671] ARM: dts: lpc32xx: phy3250: fix SD card regulator voltage
Date:   Thu, 16 Jan 2020 11:51:00 -0500
Message-Id: <20200116165940.10720-34-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165940.10720-1-sashal@kernel.org>
References: <20200116165940.10720-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Vladimir Zapolskiy <vz@mleia.com>

[ Upstream commit dc141b99fc36cf910a1d8d5ee30f43f2442fd1bd ]

The fixed voltage regulator on Phytec phyCORE-LPC3250 board, which
supplies SD/MMC card's power, has a constant output voltage level
of either 3.15V or 3.3V, the actual value depends on JP4 position,
the power rail is referenced as VCC_SDIO in the board hardware manual.

Fixes: d06670e96267 ("arm: dts: phy3250: add SD fixed regulator")
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/lpc3250-phy3250.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/lpc3250-phy3250.dts b/arch/arm/boot/dts/lpc3250-phy3250.dts
index 1e1c2f517a82..ffcf78631b22 100644
--- a/arch/arm/boot/dts/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/lpc3250-phy3250.dts
@@ -49,8 +49,8 @@
 		sd_reg: regulator@2 {
 			compatible = "regulator-fixed";
 			regulator-name = "sd_reg";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
 			gpio = <&gpio 5 5 0>;
 			enable-active-high;
 		};
-- 
2.20.1

