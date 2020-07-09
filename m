Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3474C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 09:18:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A33D32076A
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 09:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="tHF/l9m+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgGIJSQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 05:18:16 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:46365 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726372AbgGIJSQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 05:18:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594286295; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PmrYhuAQBZ3Ybqc9tHktn7YgndYRCoWWiaZS9MIjs5Y=; b=tHF/l9m+FHrwCuaFG/cW70rgG7sP+yjjRuC/hdg9s7b7X1gVNuu1Tk6R4rWXP2aOqS3EXQG9
 f9lt6u63dkFkJWdCJrGl7NBEVqBan3UxwCiI56DOlzWwAhf5XA43sL35rmvWrN2ka/E5MgHH
 klQJiH267klWZ8HujjkNBqic8es=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f06e0bccd1b803e179b23aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 09:17:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B531EC43387; Thu,  9 Jul 2020 09:17:47 +0000 (UTC)
Received: from pillair-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 699EAC433C8;
        Thu,  9 Jul 2020 09:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 699EAC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     devicetree@vger.kernel.org
Cc:     dianders@chromium.org, evgreen@chromium.org,
        Rakesh Pillai <pillair@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7180: Add missing properties for Wifi node
Date:   Thu,  9 Jul 2020 14:47:33 +0530
Message-Id: <1594286253-32244-1-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The wlan firmware memory is statically mapped in
the Trusted Firmware, hence the wlan driver does
not need to map/unmap this region dynamically.

Hence add the property to indicate the wlan driver
to not map/unamp the firmware memory region
dynamically.

Also add the chain1 voltage supply for wlan.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
This patch is created on top of the change by
Douglas Anderson.
https://lkml.org/lkml/2020/6/25/817

Also the dt-bindings for the chain1 voltage supply
is added by the below patch series:
https://patchwork.kernel.org/project/linux-wireless/list/?series=309137
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 472f7f4..4c64bc1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -391,10 +391,12 @@
 
 &wifi {
 	status = "okay";
+	qcom,msa-fixed-perm;
 	vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
 	vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l10c_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l11c_3p3>;
 	wifi-firmware {
 		iommus = <&apps_smmu 0xc2 0x1>;
 	};
-- 
2.7.4

