Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E76CC55189
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 10:39:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C50520656
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 10:39:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdX4x+qG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730161AbgDVKj4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 06:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730153AbgDVKVO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Apr 2020 06:21:14 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADBCC02A1A2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 03:20:58 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x18so1732348wrq.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=btgS3gZtNuEgvZcnKQBJu8IZKoX68St04X3bJOueZjs=;
        b=RdX4x+qG2UFE+QhOHI6m/WG5N1YO047NipJhXxhtmxO1wCHOS8qzIL29QlqDE7yr9H
         OHBMwTlvd1+++4ldv5G6gl9mP334Us7ARgCeAEWL3biIqT4cFXBJmqDzz0H04CSilSzT
         pwBEAdAvAz3DbhashwJepmXTNHJBkwLs+JcVzYgZ6PcYBbVlEf6qHIUNYNgOHz3MX6h5
         DGpsLcInlW6sE8CTjl+rRFRVhXcw3L2gQKKZge24/6kwbpsUnLh5rF/2ZzGrUfkNcb7n
         vF1NAGvkei9P7VFwGzbzULDYej5mF/pNhAhlP9H/rot4R6sUZhjKEivwv50Qyf0Ai/ta
         ENJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=btgS3gZtNuEgvZcnKQBJu8IZKoX68St04X3bJOueZjs=;
        b=remiUJzNsg+m81JSd33qGUqRAUd/5bA52yXNwTljJfnda+8ZDm4OKrFNMq2JXtCAd1
         lk/HHx+YqMTlQ0vQKuLQ3KcbEYkwV6PphbkZ2PS5/qcoKwcHzMvZq0lhQnSqL4NTt5N8
         OOcg/TNazqbFDjvN0SX5alPoWr3HdMECEhHgWf3E6uylqIlUDNHIXqM3CU6m5nu+qOU6
         wQq3SHrlnQ/Fi/xEcjtLrxssaTXAPl2HgzPgV39iZUGODQspLPQK7BJVX1TZy3bhbn1I
         33fN9KhdtMUT5KRBloWQzHZbhWaJ33o6uFn8/XezgxL5ANA0+klxQWOWKAeIPvhdBtXE
         1F8Q==
X-Gm-Message-State: AGi0Pua+vn2jSz1L+iNrIF0W+bdI2BCq6Fq/Q9Opt1crnpFRMe3rcsEK
        dy1EviN76nzGua2x0cftXmwpIg==
X-Google-Smtp-Source: APiQypKjKYzHH5tG6rqSmZh+fWA4+JF/Tqqua8JrTKfSwJh2q7hIqmT4lA3T3+A5zTwwXumOLBgnPA==
X-Received: by 2002:adf:9793:: with SMTP id s19mr10286450wrb.147.1587550857374;
        Wed, 22 Apr 2020 03:20:57 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id h10sm7792460wrq.33.2020.04.22.03.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:20:56 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: db845c: fix asm dai setup
Date:   Wed, 22 Apr 2020 11:20:44 +0100
Message-Id: <20200422102044.8995-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200422102044.8995-1-srinivas.kandagatla@linaro.org>
References: <20200422102044.8995-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

"direction" property is only valid for asm compressed dais,
so remove it for non compressed dais

Fixes: 89a32a4e769c ("arm64: dts: qcom: db845c: add analog audio support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a2e05926b429..21fd6f8d5799 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -442,17 +442,14 @@
 &q6asmdai {
 	dai@0 {
 		reg = <0>;
-		direction = <2>;
 	};
 
 	dai@1 {
 		reg = <1>;
-		direction = <2>;
 	};
 
 	dai@2 {
 		reg = <2>;
-		direction = <1>;
 	};
 
 	dai@3 {
-- 
2.21.0

