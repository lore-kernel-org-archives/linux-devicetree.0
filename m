Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A43C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 19:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 045D9207D3
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 19:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="mdGrXSry"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgFETFy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 15:05:54 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:22570 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgFETFy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 15:05:54 -0400
X-Greylist: delayed 354 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Jun 2020 15:05:53 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591383952;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=axBeihvN2eJz+OrmbCAkO3UrmkPWSVR3SL9YowwDyw0=;
        b=mdGrXSry3K4S6yYTWZ/9LpAcIxkoibQRqyI4PTR5QH9nnBeEXsvg3dTyMepK8Mgh0A
        ullUMqCdR3vZMxvtcEvgxaaQJjTSFZRkKdSZkFhy1OMDadzf9Qi8iB6Z7rE0jjxJZ8kI
        YB7k918F9AcRuyWWMzzURPEStpBX+LheqhbbzPTZRUfNjzsFk1xHyJs6YBrzstr/FVWK
        IxvX/pxqXw1AHhWOJJtDqzWMmbU/zPcsbjg92b6b2wGTB3CfoHSd0rO1h3SFDllf+Qp8
        GD1Rr+G0Ec/Lk1tggP9wsq9m2Us97CgNqAR+FTXDwum4TN1azLRbaoVlTPeOxdBWYVTV
        5XHQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6IlKY="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.9.1 DYNA|AUTH)
        with ESMTPSA id U0b5f2w55IxrKmG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 5 Jun 2020 20:59:53 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/4] arm64: dts: qcom: msm8916: Pull down PDM GPIOs during sleep
Date:   Fri,  5 Jun 2020 20:59:15 +0200
Message-Id: <20200605185916.318494-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605185916.318494-1-stephan@gerhold.net>
References: <20200605185916.318494-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The original qcom kernel changed the PDM GPIOs to be pull-down
during sleep at some point. Reportedly this was done because
there was some "leakage at PDM outputs during sleep":

  https://source.codeaurora.org/quic/la/kernel/msm-3.10/commit/?id=0f87e08c1cd3e6484a6f7fb3e74e37340bdcdee0

I cannot say how effective this is, but everything seems to work
fine with this change so let's apply the same to mainline just
to be sure.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
I found this at some point while trying to make audio work
(searched for differences in mainline compared to downstream).
This was not a difference that prevented it to work,
but I thought I would just submit it in case this could improve
power efficiency a bit.

Feel free to ignore this if this is stupid.
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 5785bf0a807c..591f48a57535 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -569,7 +569,7 @@ pinconf {
 				pins = "gpio63", "gpio64", "gpio65", "gpio66",
 				       "gpio67", "gpio68";
 				drive-strength = <2>;
-				bias-disable;
+				bias-pull-down;
 			};
 		};
 	};
-- 
2.26.2

