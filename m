Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF587C18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 23:16:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78B38222C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 23:16:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m1sTUdtz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbgCJXQx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 19:16:53 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43575 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgCJXQx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 19:16:53 -0400
Received: by mail-pl1-f195.google.com with SMTP id f8so139022plt.10
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 16:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zXg9Gj7QTUwpYvOhGlvMrbNF6i7eg/pUYIjVoM9j78w=;
        b=m1sTUdtz0IBH4T58S0Qp8F887lOMFeQ6E3LwhmSyto0/XicAZGMKH/OdcvxBS/gioj
         hpdgTy+8k2waNEDrL7V93U+BcQrXkOtW7w1AYTphgWutJGFtTIY3zpT15dtk3Y+co1p9
         dCqpvzXMboOTnI8q3DAmcjPcZiP2ChNuhzxOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zXg9Gj7QTUwpYvOhGlvMrbNF6i7eg/pUYIjVoM9j78w=;
        b=Glt4RLF/cJmFtNOrQZLFDt1i3mVG13XBFpnwI2W2+nL3/YZI65lB1P0UGp3CJRPv2G
         rzMPy5F78yCSUcDXXYK55KZ/3sqaOHaBz4cTAm/waEZBJMt+V5vpP8UIN9rL5hpu8mZv
         Mlzax/FHoE+7fPsc+h3UJRUqvnX9wJ/IUw7ALWrqr8XuFU+YGUt1+wnj+V2OXOT+xe7Y
         qX6DaflZ8wqThLiCGE23R37YEeTQXjTcKHjpDUz5+ftPgS/NVAWOPqkr82wmtrPWObCI
         82b9WwVj2x0MeMA7lBncIU6o9GYAYhgkaU0G8udOGuKW6gmtZ9VOK87PWREuVltKbVpZ
         gkow==
X-Gm-Message-State: ANhLgQ1j7NExlmToPa/P02wa7ptn+SyFGSpaQ83aqh6x9a9VuHUSatRD
        uvInN1A1YBHgUwIepWq5qMMoZg==
X-Google-Smtp-Source: ADFU+vua2DRqzHPDCg1h0WaWa5jUQRYxfdS9IEm3qlPlei+YNlP5TOn8cJF3gz2OQRyZ5zwlg/XAUQ==
X-Received: by 2002:a17:90b:438d:: with SMTP id in13mr333664pjb.114.1583882210644;
        Tue, 10 Mar 2020 16:16:50 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com ([2620:15c:202:201:ffda:7716:9afc:1301])
        by smtp.gmail.com with ESMTPSA id 15sm43071797pfp.125.2020.03.10.16.16.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 10 Mar 2020 16:16:50 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Evan Green <evgreen@chromium.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: sc7180: Include interconnect definitions
Date:   Tue, 10 Mar 2020 16:16:29 -0700
Message-Id: <20200310161502.1.Ia2884ed3c8826f52fbd5dcfa7a376a2fac4f31e6@changeid>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Re-introduce the include of the sc7180 interconnect node name
definitions. Though this was part of v5 of the interconnect provider
series [1], it was dropped because the DT changes went through a
different tree than the header. Re-add that now.

Interconnect clients being introduced can reference this patch as a
dependency, rather than racing each other to add the include.

[1] https://patchwork.kernel.org/patch/11417989/

Signed-off-by: Evan Green <evgreen@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 89ba01246f95b..eb5a527da685a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sc7180.h>
+#include <dt-bindings/interconnect/qcom,sc7180.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
-- 
2.24.1

