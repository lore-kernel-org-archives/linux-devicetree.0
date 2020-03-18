Return-Path: <SRS0=uBtF=5D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05285C10DCE
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 05:46:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C181820663
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 05:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DyUKc0Wo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgCRFqW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Mar 2020 01:46:22 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43625 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgCRFqW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Mar 2020 01:46:22 -0400
Received: by mail-pg1-f196.google.com with SMTP id u12so13038664pgb.10
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 22:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wP5msWs+H65dtiCoHZMzY1KxEhCfiPf43beyeK96JJo=;
        b=DyUKc0WoN764jAONlN34IdUIF+JaIJ/8zjaKAOm62CXLomzbzdcCvDBbscthJO+/4/
         HUQc5JeCIlCKeDJVSNGIztS+uufYFrp0cNZ9um/3WnFzpTchsPxWJ3X7Dt6YWGIPCuIh
         lopK9XbixgTN7jbqM7R8gah+p0UmkOXGLsBlHi53U+nSXKrTf9DcyKdStD4Bk/vZR+5n
         62E4hBBBKmbeuU+9U0SSm2hVD12MwJHDVQxwE/lj3Y+nBEQ7oZKeEwxhko2qBkX1TZVq
         Wctb6+M6NBIsjTnYIRYV/jOIMAUXnrZGNPWNEBAyoojAA5goIXBO970mvCRMnrEDA/a5
         DkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wP5msWs+H65dtiCoHZMzY1KxEhCfiPf43beyeK96JJo=;
        b=ZXB4kieardUpPj7APGO5fV0AwQh/BeoNDhTYbqAufkxO2pH6sW+6x8DfWqWK9wjfAa
         Qgn7bvtPexGCWOnnZ9vrJmegXPGlN0uwNE0XdMgTwx9/q71kITV6qs2wnhu4Fot+vgXf
         TjDzWlrvBNifyZ++m8tcdNaMovCcc1Nku+W3W27/UXpUmoldHP6yW5226qItXY3fOZg+
         D7aSXpnu85NATQcccKG1E6Vote29GhC83zTJml4mB6afZtJlT+8ANw8Qi/0+LTDl1C1q
         fRel3u11gTXjyuiYft/H/Vqk1Ci9rnwaudGII4E4GBRdFfFXn0vg87Thz6dVAd4e6v4T
         dnwQ==
X-Gm-Message-State: ANhLgQ3Qif696EpgnBzyXeH9T8YdS0bt11Uq6uxO0VOi9XePjCuk5N4i
        iJwSj5VBZGm4Cfspx4ka9aM8IPubBwM=
X-Google-Smtp-Source: ADFU+vuDWULEK8ztlmXQd1G6mb8a4Xbgj98e4GwLuLlGS8GYoD7fM220tTPWyUhythBWGnl8atQ+9g==
X-Received: by 2002:a62:cdcc:: with SMTP id o195mr2579575pfg.323.1584510380719;
        Tue, 17 Mar 2020 22:46:20 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u5sm5128686pfb.153.2020.03.17.22.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 22:46:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8996: Reduce vdd_apc voltage
Date:   Tue, 17 Mar 2020 22:44:42 -0700
Message-Id: <20200318054442.3066726-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some msm8996 based devices are unstable when run with VDD_APC of 1.23V,
which is listed as the maximum voltage in "Turbo" mode. Given that the
CPU cluster is not run in "Turbo" mode, reduce this to 0.98V - the
maximum voltage for nominal operation.

Fixes: 7a2a2231ef22 ("arm64: dts: apq8096-db820c: Fix VDD core voltage")
Cc: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index af87350b5547..4692b7ad16b7 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -658,8 +658,8 @@ s10 {
 	s11 {
 		qcom,saw-leader;
 		regulator-always-on;
-		regulator-min-microvolt = <1230000>;
-		regulator-max-microvolt = <1230000>;
+		regulator-min-microvolt = <980000>;
+		regulator-max-microvolt = <980000>;
 	};
 };
 
-- 
2.24.0

