Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAC3C43215
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BDA02070B
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="X7ylzBvz";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="JcRmQxI/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfLBNrp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 08:47:45 -0500
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185]:39294
        "EHLO a27-185.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727364AbfLBNrp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 08:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575294464;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=hpuIeYjWN94TwNYKsnIztAS7vVGCJc6iFBQ5zRaunG4=;
        b=X7ylzBvzasyTv+Fuvh/M4/Ba9y2XFt4ptHoN7Q8WaGk7R7C6dKuh/vrGiMpLNNLk
        xXYGEuJ3J1Y1hwcunJIi4Mn1zGP/AyYeY9Q7N3K3b5SKS9mGRxx09RdKC6RQFrRyh6E
        osUblt5L/esqV8Brc1dxH1PWyXz6TgIUDRu3mLcA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575294464;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=hpuIeYjWN94TwNYKsnIztAS7vVGCJc6iFBQ5zRaunG4=;
        b=JcRmQxI/1VUcrND9eEXaDoxhwGqFM0rzr/OotyplwScITB9Di2SolznAbvI0HHQ4
        AlTwj4XQ3UjPwex9OjT8fapgMg67UPrH1ZfUOoEHrVMbxaoOFxlLJEbeCbTjiec30vy
        8kb0MTLPMuYFEJJcba9xl67yvk69+6VmNlL15aW8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8AF81C774A9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=chandanu@codeaurora.org
From:   Chandan Uddaraju <chandanu@codeaurora.org>
To:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org
Cc:     Chandan Uddaraju <chandanu@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, hoegsberg@google.com,
        dri-devel@lists.freedesktop.org
Subject: [DPU PATCH v3 2/5] drm: add constant N value in helper file
Date:   Mon, 2 Dec 2019 13:47:44 +0000
Message-ID: <0101016ec6ddf263-81b27f0b-428b-49a9-b538-95a272f13b79-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
X-SES-Outgoing: 2019.12.02-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The constant N value (0x8000) is used by multiple DP
drivers. Define this value in header file and use this
in the existing i915 display driver.

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 include/drm/drm_dp_helper.h                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ce05e80..1a4ccfd 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7496,7 +7496,7 @@ static void compute_m_n(unsigned int m, unsigned int n,
 	 * which the devices expect also in synchronous clock mode.
 	 */
 	if (constant_n)
-		*ret_n = 0x8000;
+		*ret_n = DP_LINK_CONSTANT_N_VALUE;
 	else
 		*ret_n = min_t(unsigned int, roundup_pow_of_two(n), DATA_LINK_N_MAX);
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 8364502..69b8251 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1357,6 +1357,7 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
  * DisplayPort link
  */
 #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
+#define DP_LINK_CONSTANT_N_VALUE 0x8000
 
 struct drm_dp_link {
 	unsigned char revision;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

