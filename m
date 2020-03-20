Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33022C43332
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 01:41:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 091002075E
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 01:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdm7Sshv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbgCTBlZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 21:41:25 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:41486 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727435AbgCTBlT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 21:41:19 -0400
Received: by mail-qv1-f65.google.com with SMTP id a10so2186134qvq.8
        for <devicetree@vger.kernel.org>; Thu, 19 Mar 2020 18:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BmLDbgrQGRMcKnRjecEwvHf9acIPMdQPCuaUHQoEE9I=;
        b=bdm7Sshv0U+VOsv1chWTcKaftld2B9J2S6C1Dzd267vnc2TrQbnx7sTDemjcSIdSIl
         XP4Jb604+7eOnOxLy6k1txkJObvEWQVL6zB4R/+lc0qOj5LVcfgCjoMOpbuTaAS2gGeN
         Du3KWhzgPiQnWCp8QomaVLBPjo0BzsFzj/4aGNjNpVX0NOLYiJrgukUq8/jecz0tT7+a
         tVf8wJaYJnhV3eh7b7VAsBnrc2Nw5SmzprjSgV0/WsWcofm++w7V3xbXnGbsCz0ucVRu
         pZo+pFLfUWafOSW5dPWRiBf/ngetpNfqqg9oEhwfV6SfLtV+lMlZJZZrsf+QpSFazJFS
         R+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BmLDbgrQGRMcKnRjecEwvHf9acIPMdQPCuaUHQoEE9I=;
        b=N9AqTPN+b1WsAXmjSYIMCQZutW11HFXrzUc//bp66ys2cWWmHtN6Q8Dn+AqFYVk+i2
         J8FEbtaMA7KUFN5uXGJy0kgcBAsnwZ24oUvBWsZtdXqLdHegziE/BrdtvVRvGRk0bh/T
         tSKHHPUEGEuXGaFTGg/DQslefflueX/1nXmjg0i65W/t3AGtCEOtQ1vNAQdGuK/RJ43P
         tgEBnij2mjpEHtLALr0jPIkpqHhkILQjYgtN9TIRh3BjEoguAxiVELOwHOSqeQZ0PkR1
         Np17dY9LS+w0gSrVdrKow/23srm1VRD4DXpjrOS1dF7RMPRsZ6fbDpaWS4NlUAyYwnGZ
         2zuA==
X-Gm-Message-State: ANhLgQ2UuBaofHAXGfaf4bCMWH8qwPTgAOP3wIv5Ac2cTT+MvSgGEh1h
        9kDbuHJU8soB1aNnF6ClpuPUPg==
X-Google-Smtp-Source: ADFU+vvLSkOdW7E5U5A5O6CcJJ7ZWJHOi0uG50WCDN6WNaQOvu8Lhdpvt6s/ZGRR/baXJawhCENi5A==
X-Received: by 2002:a0c:9e41:: with SMTP id z1mr5918351qve.130.1584668476689;
        Thu, 19 Mar 2020 18:41:16 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id 2sm2706287qtp.33.2020.03.19.18.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 18:41:16 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh@kernel.org
Cc:     amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [Patch v5 5/6] dt-bindings: power: Extend RPMh power controller binding to describe thermal warming device
Date:   Thu, 19 Mar 2020 21:41:06 -0400
Message-Id: <20200320014107.26087-6-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320014107.26087-1-thara.gopinath@linaro.org>
References: <20200320014107.26087-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

RPMh power controller hosts mx domain that can be used as thermal warming
device. Add #cooling-cells property to the power domain provider node to
indicate this.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---

v3->v4:
	- Removed subnode to indicate that mx power domain is a warming
	  device. Instead #cooling-cells is used as a power domain
	  provider property to indicate if the provider hosts a power
	  domain that can be used as a warming device.

v4->v5:
	Moved the property from .txt format to .yaml format.

 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index ba605310abeb..16b713d295c4 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -27,6 +27,9 @@ properties:
   '#power-domain-cells':
     const: 1
 
+  '#cooling-cells':
+    const: 2
+
   operating-points-v2: true
 
   opp-table:
-- 
2.20.1

