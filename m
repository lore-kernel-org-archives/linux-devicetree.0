Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD8BC433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 19:28:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 825412065D
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594841316;
	bh=xQzFL5DvJsNQ3B4wUTB6eOPMzyQZAGrPE0EOKluFuvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=cok4EfEA1vUQcjAow+D9jezrBRp0Mxatd6KnFYU0goDTfFxW5iAIv3590p0b/pY00
	 zoE1TBlpbPzqzrxyqLjleAfOVyUZnYig/CpVpwOHhLrNBOMFiROkGNznZyGXvwbpVJ
	 EyeofyLV+T5x/kOnxpwYVmVx34lvGVKJJe5iQr1Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgGOT2g (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 15:28:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:46304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbgGOT2f (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Jul 2020 15:28:35 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A59020787;
        Wed, 15 Jul 2020 19:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594841315;
        bh=xQzFL5DvJsNQ3B4wUTB6eOPMzyQZAGrPE0EOKluFuvo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kW7WIJ+Vzk3RLEcdBrHAf1nLDz1Ea6uzAgSxQn3jfolgrb/aJ9qKISyEhLwfxil6v
         70bP7OAD/O3EwpGkswZFxjXRBs6So09IkHaKnMd0gECt1UUJZOrgMnrjXPsu79NAKZ
         191/uLs5xs2DInJmZ//ffCxzmdFefLdqG8xJDMPY=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: socfpga: add the temperature sensor to the Arria10 devkit
Date:   Wed, 15 Jul 2020 14:28:24 -0500
Message-Id: <20200715192824.22210-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715192824.22210-1-dinguyen@kernel.org>
References: <20200715192824.22210-1-dinguyen@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the Maxim max1619 temp sensor that is on the Arria10 devkit.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index 0efbeccc5cd2..7edebe20e859 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -162,6 +162,11 @@
 		compatible = "ltc2977";
 		reg = <0x5c>;
 	};
+
+	temp@4c {
+		compatible = "maxim,max1619";
+		reg = <0x4c>;
+	};
 };
 
 &uart1 {
-- 
2.17.1

