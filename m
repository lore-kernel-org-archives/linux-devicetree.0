Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AF4C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 21:49:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F043E20853
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 21:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="te7Db9QK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbgERVto (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 17:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgERVto (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 17:49:44 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05B0C061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 14:49:43 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id r187so9255877qkf.6
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 14:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eEJGey6/k+OCef6v3YjhHQLAmR02XJvq10/E/t+8+J8=;
        b=te7Db9QKy+oMGYwWc0ZE8dhloSzTPm0L0vEClSIMuRdsOHuYiIt1rrGk6zZ4yv+MAd
         3X3cKcvJiYGm90R0/E3PUXjIyTAguDzXBibrSVYHgDN8tJQ3VaFT8wTokdlCE2fMhogW
         pe2maBoDXGcBjROp592R6oTdzMXc8OoYGCk4nm2hQKEMB/b1l41OwDaI91lvh0ENL3uL
         lIBLcGSrB5TAUbyJo88tib/ujn39P3vOT8fHYvHgobpPorz8HbPxFFdltCyPqHhHKmEM
         kh6TX8Dm0NplIiAMqoQBULMVWNsxZ863BUDdtAbe6+O/eUhcZmlVBFgnUeu8xeTfYhR2
         Ke7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eEJGey6/k+OCef6v3YjhHQLAmR02XJvq10/E/t+8+J8=;
        b=I9oA1i9l4rH3GsyxOUQaEG5tvlh9iIIOVvqFTXtx9v2wFAXKP8ZH7f/C0yapw6WPJL
         a4cBnRLAbmWi+qq+GA0aADzWm3V3WWKZRcXaDX8Ks8i09Fgu9Gg2Qa8dim0TwPP/NBri
         Yl90vlI//W9r0ge76s2n9UGDkpuTyx4RMwJe27aK6fMdWcnFG9p0Ap0NHecNDr68RNQP
         bw1uav82b1VzeIZguZEjuMfS5vmmMurAthuBhWhEXwijM5HaAoO2dmmowJDDHHc/WMKy
         8ertA1jHmYM49KFqiXtFt2DkOWD8cRapS9hNp3VSmHN5N2i5+VGKCmgzvAjvamvV1rKK
         O30g==
X-Gm-Message-State: AOAM531C9YgG03lVR52pQHNJW50El+46jpdGLV4YNa75Fkps91z7ePsB
        Vmn2Mbp9HIXQI7Dp3/fG6NRWCg==
X-Google-Smtp-Source: ABdhPJw8kB3CDlOkwgFJthOf3NhKgyWY80Nsf1LKhHEUaiGAyRRCKloZ+j9XqNWgCmnxjml4YwgBfQ==
X-Received: by 2002:a37:acc:: with SMTP id 195mr17757770qkk.419.1589838583127;
        Mon, 18 May 2020 14:49:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id a16sm8947707qko.92.2020.05.18.14.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 14:49:42 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     evgreen@chromium.org, subashab@codeaurora.org,
        cpratapa@codeaurora.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: sc7180: add IPA information
Date:   Mon, 18 May 2020 16:49:39 -0500
Message-Id: <20200518214939.9730-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add IPA-related nodes and definitions to "sc7180.dtsi".

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f1280e00b064..9a3686ce73ea 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -461,6 +461,17 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	psci {
@@ -1007,6 +1018,46 @@
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		ipa: ipa@1e40000 {
+			compatible = "qcom,sc7180-ipa";
+
+			iommus = <&apps_smmu 0x440 0x3>;
+			reg = <0 0x1e40000 0 0x7000>,
+			      <0 0x1e47000 0 0x2000>,
+			      <0 0x1e04000 0 0x2c000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc 0 311 IRQ_TYPE_EDGE_RISING>,
+					      <&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,
+					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA &mc_virt SLAVE_EBI1>,
+				        <&aggre2_noc MASTER_IPA &system_noc SLAVE_IMEM>,
+					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_IPA_CFG>;
+			interconnect-names = "memory",
+					     "imem",
+					     "config";
+
+			qcom,smem-states = <&ipa_smp2p_out 0>,
+					   <&ipa_smp2p_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			modem-remoteproc = <&remoteproc_mpss>;
+
+			status = "disabled";
+		};
+
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
 			reg = <0 0x01f40000 0 0x40000>;
-- 
2.20.1

