Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78B0C18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:55:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B251C21D56
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:55:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HGxEsuFH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgCJRzC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:55:02 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32798 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgCJRzC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 13:55:02 -0400
Received: by mail-wr1-f65.google.com with SMTP id a25so13258506wrd.0
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 10:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gy4Jfc/467vUAWjAYvthLE4X5RpTfeYf5bfEh9qniiM=;
        b=HGxEsuFHeApKS0eZBh8GANvVORFyKOLh3yKmbKzjt025Aoa89mHj8dVrAh6tc5Xrgr
         xFMhdg9KyAyBIeJyGYUWA+Jwh/6dGJHNUPgayN8CSiIpBRyxDjFHnxbUngqIcR8PS9fe
         PRhC5B7QQpuVtBgB6N2J09o+gXciLMZoEw93LJMfAF5QR2s48IuX30jWYunRAl+blYqL
         kte2+tv2XwSCFBL/oSMTsARobCWmIIUiGg/N8t4gecUWE5RxnqFiCKrR/xmLClbMvddO
         h7mw/TBHlaLMeyqOyh8/f3jm6pnDRs9eXiW3ZGFczxtnfQ1Lwfr4QApRIw06lbn0+02e
         I0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gy4Jfc/467vUAWjAYvthLE4X5RpTfeYf5bfEh9qniiM=;
        b=XN81s16Sr3htD8z4c8PunkrHNNL/gpr8/iuZvyJ8cmCMA+n79UjCVh4tiNfsjsvQQK
         vrA4/WgFY3v5F4Rqvs4PT3Qtw+vK7MNQlyPZRdUxUaeQvhXD7JcBInL9nmXpZJLIAfCr
         ABOqdJpCrNuztXlMhIY/V7HPpGpUd8H3e5RDYDciqxgwTTirFJNTbN40Yl1tEQlBHgqc
         EXDM4dpLiT0pfCH+OPbMxNwtLDKUymvzyADJZ6ED8dIh2aZJVzEGl7YMDyNrmSqx327+
         76J7sZcm8o96zNwjNA3nWpmHqcuX8Ro3BMlWWXpnHD54rPC4MQYlm4L/nkbk75z0np2R
         5Jsg==
X-Gm-Message-State: ANhLgQ0Hl0qsZ6wuJN2a0c5YiMBz+z2pXCwmq2Xksn8Su0lu9ZeSC5TT
        Ef89EX0VpYqE7PScUJIAUd4/DQ==
X-Google-Smtp-Source: ADFU+vsQNzOzfQJiP+Eu6WEj8jIWHGeLJOYbvDsVed9KMgdL6fzDBvRWSGOnIj6uzIin3OUaJDweNA==
X-Received: by 2002:a5d:6544:: with SMTP id z4mr9934573wrv.298.1583862899458;
        Tue, 10 Mar 2020 10:54:59 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id w1sm4671030wmc.11.2020.03.10.10.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:54:58 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: msm8916: Add fastrpc node
Date:   Tue, 10 Mar 2020 17:54:52 +0000
Message-Id: <20200310175452.7503-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add fastrpc device node for adsp with one compute bank.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index bef1a66334c3..a7cd8f87df97 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1157,6 +1157,19 @@
 				qcom,remote-pid = <1>;
 
 				label = "hexagon";
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,smd-channels = "fastrpcsmd-apps-dsp";
+					label = "adsp";
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cb@1{
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+					};
+				};
 			};
 		};
 
-- 
2.21.0

