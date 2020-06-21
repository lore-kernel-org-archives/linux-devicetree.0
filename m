Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9BCC433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:28:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E449B25235
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QoEj1Uu6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbgFUT2b (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 15:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbgFUT2a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 21 Jun 2020 15:28:30 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C6BC061794
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:28:30 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z9so16889214ljh.13
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mL6HaqK6Q5R1aI2h++NtWnM5EslicmBEzVZCRl6DFdY=;
        b=QoEj1Uu6iFpPiKPPUb27lVO5CCZjVSvtUt6YF083zC6bmeYnCYFRk7Mu6Hq0nkjvJe
         8P7XBcKuBvqXD9+sWf5/xxzSLWgeo2CX3zs36eF8AphibjgFJDozQRgwUH2Qx81TMaAu
         GOY/AqHRicpVKGPDRxhDfojlBAz8CL1rL6rncWO48i1x2vg7XTczBenc/8SrBVtrHort
         Ny7E+WS/QRrMiAnDJ6+eza7bSjzjQI4oGdhxPiIhTMh637xSB8G4VYhPNvfiBhzwc5uD
         25g1aB/6iRpFDUoQBR5oWuPxQ9S6trgvryBmq7jAeXPOmTF+e2J83Jg/5+68bIxa8hQ3
         F45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mL6HaqK6Q5R1aI2h++NtWnM5EslicmBEzVZCRl6DFdY=;
        b=keTLZO7Pg/yvHzEMri3/4lHnGzTs0HUY5/kVCH4QFu6xCA1eAB4LbLvePPoP/M2uqZ
         Dwy851gHWobpsLUxqZODzCI1Nji6pPAx0drw9D4IS7U997eUxyojpPWnrf/+DotuAldF
         vWp28m+6s8DmltlgWCL2G2HNneDgl7CB4F1mEbtJKGilTJovNWjLbHzisU9ek9aJqW/+
         kcWcw5gWeB8+EwYYQNMrJhHd5RPAj3A+Y2RVEEb3gpuPvfppUT6LQT03Uy//PJq/FHuV
         o9TjtkiNkqlBxchgeCGbPXX/xFRPPtsAR1zsm1UboJkTZu5JowICfGCpGPNwra63vCJ4
         O99Q==
X-Gm-Message-State: AOAM533mRLvWRI+dqj1cLD1Yw9S7fhALjYsKT/EhBjK5YP0ouUMMRkek
        jlNyfWp8Wz6EWTfa+PU56NpuUQ==
X-Google-Smtp-Source: ABdhPJwKn7av31wqUshPFtvWePCYVKEh44VfX32LX8ObANrHNpYEQjR/Z90Is57/ItSkYkN+Qnqrhg==
X-Received: by 2002:a2e:9859:: with SMTP id e25mr6852919ljj.243.1592767707844;
        Sun, 21 Jun 2020 12:28:27 -0700 (PDT)
Received: from eriador.lan ([188.162.65.109])
        by smtp.gmail.com with ESMTPSA id o201sm2917205lff.8.2020.06.21.12.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:28:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sm8250-mtp: include pmic files
Date:   Sun, 21 Jun 2020 22:28:23 +0300
Message-Id: <20200621192824.2069145-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
References: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Include files describing used PMIC chips, GPIOs, power on, etc nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index cff7a85890ee..aa37eb112d85 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -7,6 +7,10 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+#include "pm8009.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8250 MTP";
-- 
2.27.0

