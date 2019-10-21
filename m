Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB47CA9EB0
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 10:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 441E12067B
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 10:36:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfN7WGSg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbfJUKgb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 06:36:31 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44442 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728386AbfJUKga (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 06:36:30 -0400
Received: by mail-pf1-f193.google.com with SMTP id q21so8155301pfn.11
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 03:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=raRv91SuwpaXlGeT2wU6HLI9/SHJRwKCyqG5FDUj7WM=;
        b=dfN7WGSgkXXOa/URlH/ad/gRg6gnfjIsMBdB5HASF7KGk6e3vgPOKuBUdrQonzvxbl
         ZabWSM5RBGxt9NZhV2CYQS7Re/oJH5LHCS76bWGl3dYzeWFKFBemK6203svGG9zzeErK
         R7SubW3IktLLP9997uvwDu5MDI/8VHhY0dVMH+OBFiRIeKkawfreLDLFufFg++ep0JJu
         8aTHfZcuchruuOfibLzKpvpmuCJQOD9bfiZHBFbS7MXOhnnwVBPG41CS9RisyJfs2Dui
         lLPGF0KkbdVE34XIzLU+DIbaUYZBrC2+83vdWkUscpdsWoFc7H15PLXEPR/klZ1ea5qr
         NC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=raRv91SuwpaXlGeT2wU6HLI9/SHJRwKCyqG5FDUj7WM=;
        b=MZYshLjJ0pCiZWxSQqYsgU6Md5EWgW7SF/AXabDzImUA9xocgcB3ps6T6vy8Ud+G3I
         Nsc3vQwNnugFBcpszK61dkPHErilLaD/TTwrahCryXK8pnXUNEt0Q7CdppqWRZdXrbQG
         GflL0WQav688X558WSGMUYv3w6qCAAm9cOJYYuJ040f2+9w4yGgC1bVZCfxGFbo+c7FP
         TBI4sQ5GzJvy+eZHfiX14FFuxydF2hD3DNK3fu1sTbdZgpTnQwlqUoyIeI2qEf2LZk2+
         +Npz9ECetZtfBDSjTmUKIXrB9RQW86zPxzKJhZnBnxk5K9fc211o1HoWrFSGQU7o9DZP
         oYIw==
X-Gm-Message-State: APjAAAX/T8OdhJqP1YJNZZsoXRi3pMosZGEu2zt2eU149+pkXHiXeaDS
        x5iBAioDwEPyq9Xgbccsvse3VA==
X-Google-Smtp-Source: APXvYqwCpYHYXSMroItXhbGj9D6u5ioe8pubcuLdwxrRirA+DapJicFWgsOu+QaSERbHJmDVv7rX+g==
X-Received: by 2002:a17:90a:86c7:: with SMTP id y7mr26839634pjv.82.1571654189240;
        Mon, 21 Oct 2019 03:36:29 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id y22sm13192289pjn.12.2019.10.21.03.36.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:36:28 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v6 13/15] arm64: dts: msm8916: thermal: Add interrupt support
Date:   Mon, 21 Oct 2019 16:05:32 +0530
Message-Id: <88eff964b708c8aff57b24370d2e14389ace09e9.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Register upper-lower interrupt for the tsens controller.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e101905cc..807f86a4535e0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -816,6 +816,8 @@
 			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
 			nvmem-cell-names = "calib", "calib_sel";
 			#qcom,sensors = <5>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

