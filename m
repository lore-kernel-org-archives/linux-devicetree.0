Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B515C3F2D7
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 17:12:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 226BC20873
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 17:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UoMsmD2K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbgCCRMT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 12:12:19 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43930 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729821AbgCCRMQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 12:12:16 -0500
Received: by mail-wr1-f66.google.com with SMTP id h9so4379981wrr.10
        for <devicetree@vger.kernel.org>; Tue, 03 Mar 2020 09:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4eKDP7GIf+zMnjkDG/qEX7ZCeXhKuF5qg6jgn8C2ADk=;
        b=UoMsmD2K5l9WOiVbpbiNEApd8TeFTaUt+r74URs727/5CQahPph0IlN5iHxzmlYleA
         K8DGF7JbzczsqyTfShgKNkPFWUI1QK8DEtAcRMC8Ifz6sIooSWOds9GbDcL1A32giGXm
         Ooc043vOOXj6RmGQdVbkYsu2b0ZpFISbBAGZC7bPCKkkxQyjJceuOpt/RrV55/uuotLM
         mDKL3QMf1piLEakwgsGa/zq6MqplOdSbyFVYMiGrNdTWDr4fV2OmHUoUKbQaOSXHKThj
         jXKmRl5FXw8mUF4XJ3Xn5SDcN318iXX/4Dhm46gdtiV8N3GwVoq5ATTgFKLunQ5HMSkk
         zPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4eKDP7GIf+zMnjkDG/qEX7ZCeXhKuF5qg6jgn8C2ADk=;
        b=l7keHSSmzgQojxAtlwQEE1bTdwgKf+cNgnaOqkO65zDARwwVyENA2QE3o9171Mphxt
         iE6lNDzwD7N8IZqPQcbd5Kvi//Cj/oJDU3u5oS3lYFTt1GUBWlRsB+zg8Yv1MkgyI73M
         f8LI/Ox4yK4XBNbjWOrUCjtyMM6PfeWVKzDw4kma06GRKZ6uwuGhCnI/hfK8p2h+dLgl
         W/IVVfe28KmD7ChvuLcGwWyzWYBo44FhzKwRnoSZv5nhgQbP2QZKrulzccvXQOsK/OFR
         nFBGkb69aCQuCQE86RoqM686vnmYYkRTFgPg6tX6Gd8w4dmDigodpUmTutG4Pc5Ox9pX
         ybQg==
X-Gm-Message-State: ANhLgQ0OX2clfm89BWA57RAvh3ucT7kx8uQDMvQ6jjIoJcog3cBOlVnd
        gIRTS9fuaxPHkt2Clg9g8rGG0Q==
X-Google-Smtp-Source: ADFU+vtowteZz9CpXpsbjOfaHjhOJCySXoxhaR2Fyaeq3bRDnMOuZZsolsAaC2cGNhFWGhyXYkGoKg==
X-Received: by 2002:adf:f686:: with SMTP id v6mr6156728wrp.176.1583255533633;
        Tue, 03 Mar 2020 09:12:13 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:12 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v7 17/18] arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
Date:   Tue,  3 Mar 2020 17:11:58 +0000
Message-Id: <20200303171159.246992-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rather than set the minimum microvolt for this regulator in the USB SS PHY
driver, set it in the DTS.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 4b529a6077d2..44c7dda1e1fc 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -200,7 +200,7 @@ vreg_l11_sdc2: l11 {
 		};
 
 		vreg_l12_3p3: l12 {
-			regulator-min-microvolt = <2968000>;
+			regulator-min-microvolt = <3050000>;
 			regulator-max-microvolt = <3300000>;
 		};
 
-- 
2.25.1

