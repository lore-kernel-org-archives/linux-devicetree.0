Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E1BCA9ED0
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 10:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B747208C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 10:35:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmAaR/XF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfJaKfO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 31 Oct 2019 06:35:14 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32789 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726922AbfJaKfO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 Oct 2019 06:35:14 -0400
Received: by mail-wr1-f65.google.com with SMTP id s1so5668979wro.0;
        Thu, 31 Oct 2019 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uK2mQwdObbahiQMwLjK6b8LfVNALl4wjc/h//ZB/Prw=;
        b=fmAaR/XF+LDi8tpU4YyfkL3yfA4T544/q+IgSx/RW6BjRKw8DMdOjK0e2bN7U2yzyH
         zW1nO4dqfIjviFRguaAnBXFDpyHKsSr/i076aaZfB3ohVoRvUPQuTi5JfHJK+5fy/xjR
         uG1s3NmSRe6t5Gl1sqEnLYJVLfRN0G6HtDTnpSCNQYVDFQjs9FDl7nuD9VFuAApPEdZK
         sbzmIrWYocgsn6ThwDsudg0v8aBh7xZZag10QsPtxAn79luYegX5Nf5bwplhVmt5cJZe
         CBBcGK6EJpV0368mHGrZeJQzR4zUrJhQ0j4LTJxnKNeIHxZ5LHE2WWQZ2vI4IqOYUE7j
         2M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uK2mQwdObbahiQMwLjK6b8LfVNALl4wjc/h//ZB/Prw=;
        b=BOKVC4sMuyt4nGv+VBUpen55jcHJKUYxZFiVAVBO1CxGx/4dGlYtshnf4duyJjUYlL
         VUlAqRxncvK1T4zuXBiESxfonaJXGHjCwKPDRiLE+QXFRKCHpBfYGv93WsFVKlafXseF
         WUIthNT+XCn/yTjlc2gfVWO8CvekjLczFHkrDHvqNh+9AGtqS9oMq74oUa/4PuNZlmgZ
         GnxTUQCpLWLzmzkB8BK5uQ75UgHK6GVMkzuHo3fKrCko1rosETJTDTmYNyJqxu3v9IWm
         VrrOn3SjfZ7a4XeF3mHSpbQAp1TkH0hV6caLynBUtTzxTqtL6KgBuyxmaJhrGdjvKaXn
         GG2Q==
X-Gm-Message-State: APjAAAW/npEslWuoV2f6jb4FUOYyDFPZFLCuVjIOVrg8GQ1g/hu0MDp8
        fpVyets4ejEWtUeGzwfRLIw68DgoFno=
X-Google-Smtp-Source: APXvYqy3jXST8XVI6LenBKUEhnuzX1CpirMnV9CexMYPF3Je9AKFWC4tNjBIUE9hOkZfD+iQOvnPJA==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr4653672wrn.110.1572518111795;
        Thu, 31 Oct 2019 03:35:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id o15sm3414687wrv.76.2019.10.31.03.35.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:35:11 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, bjorn.andersson@linaro.org,
        agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/4] pinctrl: qcom: spmi-gpio: Add PM/PMI8950 compatibility
Date:   Thu, 31 Oct 2019 11:35:04 +0100
Message-Id: <20191031103507.30678-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031103507.30678-1-kholk11@gmail.com>
References: <20191031103507.30678-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The PM8950 features 8 GPIOs with hole in 3 and PMI8950 has
only two; these PMICs are totally compatible with this driver.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 387917c517d3..653d1095bfea 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1108,6 +1108,9 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
+	/* pm8950 has 8 GPIOs with holes on 3 */
+	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
+	{ .compatible = "qcom,pmi8950-gpio", .data = (void *) 2 },
 	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
 	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
-- 
2.21.0

