Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D204C433E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 16:44:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0472420732
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598028280;
	bh=/2qLc6JqZACE5iaGnaL1n1of4zIMi6pGTKpFUHPyJh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=V6xIHBUu2C2uGpTOj97SUnROb7P3jEoWewFu8ShddcSf5Dcb/jNcDKSuvd4uXppis
	 GDLAc+ZkK2yxfgzlwSMJ3sxvhMqTe74dPZtpHfCmYwYgwgUhnMr/BkEU4miy0p1kF8
	 5c/dX7wYXuqulZU0M94asHstWsHd8RSLU/qvzQJI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbgHUQoj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 12:44:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:50002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728379AbgHUQUl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Aug 2020 12:20:41 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECCF520578;
        Fri, 21 Aug 2020 16:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598026782;
        bh=/2qLc6JqZACE5iaGnaL1n1of4zIMi6pGTKpFUHPyJh4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wrfu9ZaJ85BluxB1gyKVf+9nTfmwy4nFKKi/t9c1Xyvrc00g8lkj3c3SADs9qj3a6
         QYcCFQDpRgpjez/FJUbnhVRi1rbrZ+Vb4cP7rVuzBhoK8AM30Xi8oXWymK2AhXOdZs
         Sp7eWUKVgnRCZGWCDJhxjLqJkvXwgHL8rOh8q2PU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 03/26] arm64: dts: qcom: msm8916: Pull down PDM GPIOs during sleep
Date:   Fri, 21 Aug 2020 12:19:14 -0400
Message-Id: <20200821161938.349246-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161938.349246-1-sashal@kernel.org>
References: <20200821161938.349246-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Stephan Gerhold <stephan@gerhold.net>

[ Upstream commit e2ee9edc282961783d519c760bbaa20fed4dec38 ]

The original qcom kernel changed the PDM GPIOs to be pull-down
during sleep at some point. Reportedly this was done because
there was some "leakage at PDM outputs during sleep":

  https://source.codeaurora.org/quic/la/kernel/msm-3.10/commit/?id=0f87e08c1cd3e6484a6f7fb3e74e37340bdcdee0

I cannot say how effective this is, but everything seems to work
fine with this change so let's apply the same to mainline just
to be sure.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Link: https://lore.kernel.org/r/20200605185916.318494-3-stephan@gerhold.net
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 10c83e11c272f..93856ac6f1d33 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -555,7 +555,7 @@ pinconf {
 				pins = "gpio63", "gpio64", "gpio65", "gpio66",
 				       "gpio67", "gpio68";
 				drive-strength = <2>;
-				bias-disable;
+				bias-pull-down;
 			};
 		};
 	};
-- 
2.25.1

