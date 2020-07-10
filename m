Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CFFC43461
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 23:03:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00CBE20767
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 23:03:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="czcZnmWK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgGJXDO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 19:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726782AbgGJXCx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 19:02:53 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DFFAC08E81E
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 16:02:51 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id cv18so4994262pjb.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 16:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y5w7thCJ47LiXz+1HKLTnKORVAb6dWtKvGhWSiH+CyA=;
        b=czcZnmWK3uUzXU3jJUftlmd87xKqg1vh36GGnjurujBnUEgeXlC1M6Wca16FDUQn+1
         yZj82s/zD8peaRgTCevChpsENm2MclhtbVlqV1ldKm3+JpWTwS2UBaCObUuYsJAEdxXc
         onrMx7dOMRZrpJlLHafrJXEdUPVfZeTEt2K9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y5w7thCJ47LiXz+1HKLTnKORVAb6dWtKvGhWSiH+CyA=;
        b=Nt9L1T1/fNTvN533Edkls78VGdCzapCuCVxKuy224X8gna1/a4McP7MxaVfiOeYJLN
         gAqMoR2N8TIp7d4yfHXHFeEeR+nCVuTt1H73GtMXwx5ykzVTifttPnntYAHeZsWc6SMI
         VZ7hsymWm256VlBHPegABXppUQDc6eiCvNhUb+qCWn5egboQuA/5NEsB++c0IJdSN1xH
         HBq4U3G7ozX1RPVyKbt0c6SRBQ6JMKa7KFHZjM34v7AQOG9riy8JnJozNIuZFL75F7R6
         ZWcdKYAuF8Mj56TzWXti12Qsj5To7e892dqM9GsELtln7j8zGYoaTsEKv+Rdox0QDZgM
         ZjUQ==
X-Gm-Message-State: AOAM531kGi/AIbmUUPfd8aoh/TD+Vlmhal768XahwIEE2ngCC6Wwj8Tt
        7FVSvCoF5DKvW4+HtwJC1pfMxw==
X-Google-Smtp-Source: ABdhPJzLC+zTXfa46e2kfj0dmtwYoXm+w+JRkwViDCVwoTfSIS5JSFTH2m0RSp/FhlQFUwXtRHO+CA==
X-Received: by 2002:a17:902:9a4b:: with SMTP id x11mr54096770plv.150.1594422171008;
        Fri, 10 Jul 2020 16:02:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:02:50 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: qcom: sc7180: Add "simple-bus" to our mdss node
Date:   Fri, 10 Jul 2020 16:02:20 -0700
Message-Id: <20200710160131.5.I27644b643854c6deaae89c750041a5b69985b9d0@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As described in the bindings patch, this means that our child nodes
are devices in their own right.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
If this patch lands before the patch ("drm/msm: Avoid manually
populating our children if "simple-bus" is there") it doesn't seem to
be the end of the world.  The first time through
add_display_components() it'll notice that the children are already
populated and it will be a no-op.  When it gets a defer it will then
depouplate them (even though it didn't populate them) and future calls
will just populate them again.

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 2be81a2a1512..cae6c69fd85a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2594,7 +2594,7 @@ camnoc_virt: interconnect@ac00000 {
 		};
 
 		mdss: mdss@ae00000 {
-			compatible = "qcom,sc7180-mdss";
+			compatible = "qcom,sc7180-mdss", "simple-bus";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
 
-- 
2.27.0.383.g050319c2ae-goog

