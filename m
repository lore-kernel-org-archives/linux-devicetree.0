Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C9AC432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 998E02073A
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:29:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+MCT6FC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbfKOQ3Z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 11:29:25 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37956 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727593AbfKOQ3Z (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Nov 2019 11:29:25 -0500
Received: by mail-pf1-f196.google.com with SMTP id c13so6923212pfp.5
        for <devicetree@vger.kernel.org>; Fri, 15 Nov 2019 08:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LG1a1A4v+UDy0LaHh34rRqStYpMLpkQr762xn5ClOV4=;
        b=o+MCT6FCGd+WLPn8gFBDBblgf8rcOhwpFOShXrIAWCth1EDnZQgAh9wIktxAFxqmCE
         nYspZdlwdqiIT1+w6cDCDV/VEx9cSjYOGuZQ9Lv7MVj7rfwUSmalKKH0OmFltlO4V1dk
         0ry7DjJAKKNlD87Ms32P0yyyJKSpcSCbz8u42CMhLWz0GsbAe5107hZbmop17mHFa/em
         kx+IKHPL4psSWxuyYHURIkLPf0wTS3F95i6q99S21wsceMzDF2oNFVJT6eOpArwnkktg
         hPendNqL/Yqv2AgbzdS5h+T1Qm3adznCLHo3MC7XtUbswyNlQpzVz1CkhuKXKyhnH4XY
         XA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LG1a1A4v+UDy0LaHh34rRqStYpMLpkQr762xn5ClOV4=;
        b=AGkxVPNVi487+SY9306Bog6GagrGtpKrFBdTjIF618lqat9F931cACTu/seSNDR40P
         fMbICo/s6u4hPeS1y4eUEz76xMQlhuf7J7Nmj8tW8o25QNXvudNlUaYcoEFWxIyy2HmV
         jpSUGyZVHCfgVAIOh+tErsawk3iHtSOS8fpoj8nZuWgYn9zOZYlGAMigPMf/yYlMXwvs
         eDjb2LGqU4cxp9Pn5kllJJ0ntNeaKH5EQmwhrMwX7/jbpm/5iB95rxnvSDF7JybnXeOF
         w7Cb0YfHzOzSYdPu3rxAlGGKge0cexUR7u0imyAzu+1EkK+NMitvVc2h0cnijwg3YW+V
         fPhQ==
X-Gm-Message-State: APjAAAUVKteucLurOTp+30sVb72mQL6STMMZc3MJgQd4axGWTCOKGgwX
        goAZhuMblUkT7AUaErEHFiad
X-Google-Smtp-Source: APXvYqys3mhTCTv093AwgzZUQrAVuIZ1cJROMu4m1S5NVk8Gg3X8cU/Dzy9MjpXeeLsMUPLH2WXqwg==
X-Received: by 2002:a63:e26:: with SMTP id d38mr17097947pgl.44.1573835364449;
        Fri, 15 Nov 2019 08:29:24 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6183:6d55:8418:2bbc:e6d8:2b4])
        by smtp.gmail.com with ESMTPSA id y24sm12295288pfr.116.2019.11.15.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 08:29:23 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 2/7] clk: Add clk_hw_unregister_composite helper function definition
Date:   Fri, 15 Nov 2019 21:58:56 +0530
Message-Id: <20191115162901.17456-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191115162901.17456-1-manivannan.sadhasivam@linaro.org>
References: <20191115162901.17456-1-manivannan.sadhasivam@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This function has been delcared but not defined anywhere. Hence, this
commit adds definition for it.

Fixes: 49cb392d3639 ("clk: composite: Add hw based registration APIs")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/clk-composite.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 28aaf4a3b28a..3e9c3e608769 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -343,3 +343,14 @@ void clk_unregister_composite(struct clk *clk)
 	clk_unregister(clk);
 	kfree(composite);
 }
+
+void clk_hw_unregister_composite(struct clk_hw *hw)
+{
+	struct clk_composite *composite;
+
+	composite = to_clk_composite(hw);
+
+	clk_hw_unregister(hw);
+	kfree(composite);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_composite);
-- 
2.17.1

