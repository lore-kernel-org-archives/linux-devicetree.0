Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3FFC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 06:24:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 320842089D
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 06:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kHYTzLii"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgGBGYH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 02:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgGBGYH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 02:24:07 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0B9C08C5C1
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 23:24:06 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id h24so2932228qtk.18
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 23:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=iAAvm140uabXTl+jHo1MA3XpYMJqItzUT/T49Tq/jsE=;
        b=kHYTzLiiwAcymrEuy2t4xpNOUScn5Lchdcc0t1JjYbvXgAyblfAUldguvPrFi7PLsL
         OMO8k+MiyIOHXgBHn9cqSUo9/EL+vvY3zcwjjCrbIOXtzed3gWpla8EgWuFG7IaUyjUa
         KpievEzGpDkxAuuwmZ5LtpmfMjXczIXZcHrlEmBSgrei3aOLWhrE45hATpoT6SKkg91x
         hKlyrvyBHwteXHacR1PdKN+Hb+aLWoO1q0zUVJU35WVF50UbggaRcrDcPAfxl0RZtynv
         lSE9bipkznoS52wS+CJHh9YCG4FxQUBzvEPX7iLtHBZcNH3lLYrk4b5BptcgTQwH4y1B
         d3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iAAvm140uabXTl+jHo1MA3XpYMJqItzUT/T49Tq/jsE=;
        b=E4rx/RKlVKF9P0yLa3fOR+35UWKAPtOE3h8JB0NUUNrzHnts0IePLr5r/vUzTpLo+e
         RMwrpxJbq4/EWw7XODjQAlaJlbtOdPZSZtSc7gLvoI1gNb2qCtPB08ry+N/ptnikUp3/
         czDaJZkVPrsC8yJOIrhTdvbzRw0CNruY4MLMbihO8qoUnZnoplwObmuP4+bKbmzEXLDc
         39nC8ZEL3T5evez2mFRlfQbiVeWf/I3G4oF5w1gaB6HZCXJ4JMTsfkg2H2HVVK45OQzK
         6qfuEimKFDBP3xPLhOsIyyKyEQvyCXnYx5UAMNhxSd1n6VPbQIQoEudfnl4tbO88mtTI
         FDCA==
X-Gm-Message-State: AOAM532K8yXi0XDFf03NI501B28dqc+TWKMG8zzIyuDSm9v9cLkmggSI
        /mt4tQgCx3f6YLjL4GN7cJj+CXzubFUn
X-Google-Smtp-Source: ABdhPJx5gWyUPIpirkdQ+kayP/qflMJSBQVvzakrGUJ3dxaXfYaUR0EhWXVX6sjNNxNRPVQuX/3W7A5g8oJn
X-Received: by 2002:a0c:ab55:: with SMTP id i21mr29086666qvb.139.1593671046028;
 Wed, 01 Jul 2020 23:24:06 -0700 (PDT)
Date:   Thu,  2 Jul 2020 16:23:20 +1000
In-Reply-To: <20200702062320.2903147-1-amistry@google.com>
Message-Id: <20200702162231.v2.4.Ia24db14ffcd7803db3a728e15fa9fb2e6ce83e0b@changeid>
Mime-Version: 1.0
References: <20200702062320.2903147-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 4/4] arm64: dts: mediatek: Update allowed mt6397 regulator
 modes for elm boards
From:   Anand K Mistry <amistry@google.com>
To:     linux-mediatek@lists.infradead.org
Cc:     hsin-hsiung.wang@mediatek.com, drinkcat@chromium.org,
        Anand K Mistry <amistry@google.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This updates the allowed mt6397 regulator modes for elm (and derivative)
boards to use named constants.

Signed-off-by: Anand K Mistry <amistry@google.com>

---

Changes in v2:
- Introduce constants in dt-bindings
- Improve conditional readability

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a5a12b2599a4..e9cfded307b3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
 #include "mt8173.dtsi"
 
 / {
@@ -926,7 +927,8 @@ mt6397_vpca15_reg: buck_vpca15 {
 				regulator-max-microvolt = <1350000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
-				regulator-allowed-modes = <0 1>;
+				regulator-allowed-modes = <MT6397_BUCK_MODE_AUTO
+							   MT6397_BUCK_MODE_FORCE_PWM>;
 			};
 
 			mt6397_vpca7_reg: buck_vpca7 {
-- 
2.27.0.212.ge8ba1cc988-goog

