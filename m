Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB969FC6194
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 12:02:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C333B215EA
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 12:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573214537;
	bh=pJGj7HwNlJeJIRu3mkf03IkdEkARpRHmioOZLUOcwtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=kUATR28istBMS0NrVOMIbDBth0XIP4p/BK3XJgywk/2s3ds8/rGJ2RBIyVH6Dsekx
	 xt676nUhS5LC1zuDTjp1esMN7FFYUXz9glPudck/rHv/dH3t9r53ywbQKDkmNoVWmI
	 lsstVNJNypLkOj6Q2DGGVkGwHWyzq++gRwEcOxkM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390446AbfKHLn0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:43:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:57814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390434AbfKHLnY (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 06:43:24 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECA8221D82;
        Fri,  8 Nov 2019 11:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573213403;
        bh=pJGj7HwNlJeJIRu3mkf03IkdEkARpRHmioOZLUOcwtE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wa5ChdUppj71GbliX7VmzH976CAVMDn7QQBZl9EdAHcrXV9LQJe0VEapsHCVTW+tL
         Rkb1kqMrskYZr9+gEwzSfpZOuZpLFub+/Z2PyTGkAAT8LQLmE/04b0L6Gr26xIEZTI
         RE4hhAW+WJ49ZQyBjAwqxyeQWBuKSFeAAv+zhbSU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Aapo Vienamo <avienamo@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 008/103] arm64: dts: tegra210-p2180: Correct sdmmc4 vqmmc-supply
Date:   Fri,  8 Nov 2019 06:41:33 -0500
Message-Id: <20191108114310.14363-8-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108114310.14363-1-sashal@kernel.org>
References: <20191108114310.14363-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Aapo Vienamo <avienamo@nvidia.com>

[ Upstream commit 6ff7705da8806de45ca1490194f0b4eb07725804 ]

On p2180 sdmmc4 is powered from a fixed 1.8 V regulator.

Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index f6e6f1e83ba89..be91873c08782 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -282,6 +282,7 @@
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
+		vqmmc-supply = <&vdd_1v8>;
 	};
 
 	clocks {
-- 
2.20.1

