Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778BDC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 00:43:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FAD5206E6
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 00:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F61Eg71t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgFDAnf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 20:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbgFDAnf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 20:43:35 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A23C08C5C0
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 17:43:35 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n23so5096247ljh.7
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 17:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cRs2X+oeKdHfeX7eb6eCjnPnFevRST0za6Vh4RscaYk=;
        b=F61Eg71tZo7yLrSch48uDBf0KGXE71dR3HqNioWJV55S47JVRdokkrYs80rBGWti5/
         XEV1n92aHxZsHxfcwi32EyGaIXmtYgacwjIGmqmIzrMif3TSuH31NEOL8GClMmPwj8Bf
         9XTRws7vdUclGUMSMgL2sxdjno7P9KhvriiO0nDn3BVQZj/lwM2+ctlcKOMcSZ610PAG
         OBbnqFVftCDzTnIt6JtDFtS88DzYhVpvPorl3aKDfzGHssRxOfaH/k9tlT6spSHqFfnj
         wdIX2n8W2d4WxgAHcV28FMC9Fx3MnxDVtdBu9G+QUyNbQA+RmLu1PhTcw+y36vz/kFqJ
         ndEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cRs2X+oeKdHfeX7eb6eCjnPnFevRST0za6Vh4RscaYk=;
        b=et/TtY2CdaeJXMP7OEeG8ZkgSx/HTJY/Hrv6VBfL9UoWUNzMuOscfjnAn2PVv0UcPz
         yRKjzZ1cP1PWs8hssBV6m262lm9Taqg6fczLGFLOCxg8fovYD1/0TUHr/37MfQyF5JY2
         ig8Oz4yZYusg2Z6+c8ckLxkXz0Gai5hR35tZ0AeFzpvJwWEFSGJhP/yK7vu2oCYYgvdE
         BM0i2ZlwRn/TlnbrX9SPiL3KkmzOrHBfnm1dRUUdlhkHGBrx3knFHfgDInWtvnO6YZFI
         KrgkLnr2Dp6LKlPly2QsXzPWyNRDHSFdO4HViWuckzoah9F5l8AaS+EF5yLH6LOfQbY4
         cbOA==
X-Gm-Message-State: AOAM532ty4UcsobG/kipFgHW0WRdlkUErel8UV0sZaPaeMCFTVviHTfN
        6Hr/lxOpUGRvx7rPAVMkRgH4Tw==
X-Google-Smtp-Source: ABdhPJxKJLWg8HQ02rdlWfobnc/UXxVw60sSX6mDM4NyyI2j3u4EiXaSOG8SVYMOqXoJMYQ9gnhVnQ==
X-Received: by 2002:a2e:9783:: with SMTP id y3mr733957lji.457.1591231413382;
        Wed, 03 Jun 2020 17:43:33 -0700 (PDT)
Received: from eriador.lan ([188.162.64.226])
        by smtp.gmail.com with ESMTPSA id t16sm858527ljj.57.2020.06.03.17.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:43:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 1/7] arm64: dts: qcom: pm8009: Add base dts file
Date:   Thu,  4 Jun 2020 03:43:25 +0300
Message-Id: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add base DTS file for pm8009 along with GPIOs and power-on nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8009.dtsi | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8009.dtsi b/arch/arm64/boot/dts/qcom/pm8009.dtsi
new file mode 100644
index 000000000000..9f3e19b5bd00
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8009.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2019, Linaro Limited
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
+
+&spmi_bus {
+	pmic@a {
+		compatible = "qcom,pm8009", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		power-on@800 {
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
2.26.2

