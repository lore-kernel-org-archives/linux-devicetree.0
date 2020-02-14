Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E323C3B1B5
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 18:13:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEC742187F
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 18:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581703980;
	bh=itLd9JKqF/R9iI9reR0IzU5iyER+GtE4XjmRdA9VPJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KzJG/yAx8BpKKA59QgfkbVazMIGTIv4WXxl1Nw6+EqjhgDhE2mt5pLyK9CJNCs68b
	 7/joZ1YaN3yAIpX9pWo6qTi6g3+tIncgH4ZEMyTUDI9124geto+4CbLSkTvyxHCOZs
	 ZwwrRDrFSUZEYYdBp/Qbw+N8XwoCQQcFsLudIGLk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731109AbgBNPxA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 10:53:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:60202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731105AbgBNPxA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 10:53:00 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BDDF4222C4;
        Fri, 14 Feb 2020 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581695579;
        bh=itLd9JKqF/R9iI9reR0IzU5iyER+GtE4XjmRdA9VPJ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LuoWoXiFWyd4DkrtejxB359Bn8zEuQQuiq/f6cO4H100PmIpJWjm/FinhlzqpZWsr
         AV1yJFLLiK8cRYyWiiyoRlp0HHJs7FpL9cbU8VT52oimQfozmqr0zJLmoDlMD2/Ezr
         c0wQaJho+YYdoaORh0XIcv8hM+tjt6ZyRYN1uB3s=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 189/542] arm64: dts: qcom: msm8998: Fix tcsr syscon size
Date:   Fri, 14 Feb 2020 10:43:01 -0500
Message-Id: <20200214154854.6746-189-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

[ Upstream commit 05caa5bf9cab9983dd7a50428c46b7e617ba20d6 ]

The tcsr syscon region is really 0x40000 in size.  We need access to the
full region so that we can access the axi resets when managing the
modem subsystem.

Fixes: c7833949564e ("arm64: dts: qcom: msm8998: Add smem related nodes")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Link: https://lore.kernel.org/r/20191107045948.4341-1-jeffrey.l.hugo@gmail.com
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index fc7838ea9a010..385b46686194a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -987,7 +987,7 @@
 
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
-			reg = <0x01f40000 0x20000>;
+			reg = <0x01f40000 0x40000>;
 		};
 
 		tlmm: pinctrl@3400000 {
-- 
2.20.1

