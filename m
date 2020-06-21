Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAABCC433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:28:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6C932523E
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n++c/NF/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbgFUT23 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 15:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbgFUT22 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 21 Jun 2020 15:28:28 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74979C061794
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:28:28 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s1so16956376ljo.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9TQFVzt0zHBbW68TgkD9/2LYR7mWH10co/0ufY2ehU=;
        b=n++c/NF/Z6xfvP/Iz7CkJwiZGUaDTCQwxJ8qc/1KFTqM1ZNZbi7CgXg0lRsZy4skON
         lsO+t0GNd1OKfE4sWMep9SrSrxieTMmo1GRsgk1S9kfRJeJt6ArmKGeaAHT113WMdhAy
         6oGN5mqV1ouATT7XIXmJW4ejIOKBchSM/wOmQHqFNdaCEbLknalJKaleAa/SqbAsjEPu
         5LH1aNSeKouhxnL0KrK7gyqncIAi9clvdKw5shKuzXXLAm7o+66GsePXbq8tTIK2d6ot
         KjjuWYL3m7NJafw8jY6bYCOrsyrGbkIDfuLG/2ze/kBnn48sktTr9pxExPpER0bFrrcj
         bHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9TQFVzt0zHBbW68TgkD9/2LYR7mWH10co/0ufY2ehU=;
        b=bw7sJ4Ssh8JLTUY/iO4x6GvN8j2PopPPwyXgCmtiNf0VHzesycNwXrJBXy/P0ZBNul
         tRHAXOglaGJmUK4RDbRKwD6QMEE8RpbI7lu0S7zBWZPE/qOtD2sYKK9vhun9K2j+azOr
         RzSu5nmSYiHeU5e0QgIN2esw08AZlbEtE1urhdB7Y8uQmh373gApUxs/zSONWO0IBZKv
         AkMw051gMr6zHq/vO0jGjfXG/IcwANmY+7sO2A5pavHecD3sCSQTKMtOU6/sTFr6ndyW
         62hYWspeWl7EZKWFRsgPOq398cS9dLYnn5QdGtCxhqScFeTTrYbWWd2YdHAKAcGuUB7C
         AhsQ==
X-Gm-Message-State: AOAM532DYVuE2tPYJMu1RcaSwyMh/loRg7KxvB+bgWwGiIdLev06B5Kd
        c6E2Jx4+9JGxStLCc6Z3Lr+SAw==
X-Google-Smtp-Source: ABdhPJwjXFpUeB2IOebJxfj3AE4fMZNgbwgEcO1wGFqhfp2TqUKJBAGG8TCth8ZfnQmKMsvoUL631A==
X-Received: by 2002:a2e:b4b6:: with SMTP id q22mr6250647ljm.53.1592767706603;
        Sun, 21 Jun 2020 12:28:26 -0700 (PDT)
Received: from eriador.lan ([188.162.65.109])
        by smtp.gmail.com with ESMTPSA id o201sm2917205lff.8.2020.06.21.12.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:28:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/3] arm64: dts: qcom: pm8009: Add base dts file
Date:   Sun, 21 Jun 2020 22:28:22 +0300
Message-Id: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add base DTS file for pm8009 along with GPIOs and power-on nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8009.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8009.dtsi b/arch/arm64/boot/dts/qcom/pm8009.dtsi
new file mode 100644
index 000000000000..cb1a10e72474
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8009.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020, Linaro Limited
+ */
+
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmic@a {
+		compatible = "qcom,pm8009", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pon@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x0800>;
+		};
+
+		pm8009_gpios: gpio@c000 {
+			compatible = "qcom,pm8005-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmic@b {
+		compatible = "qcom,pm8009", "qcom,spmi-pmic";
+		reg = <0xb SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.27.0

