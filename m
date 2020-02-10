Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D746C3B188
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 19:30:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C760206ED
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 19:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kopismobile-com.20150623.gappssmtp.com header.i=@kopismobile-com.20150623.gappssmtp.com header.b="PhhG7Vd8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgBJTaN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 14:30:13 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38364 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727588AbgBJTaN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 14:30:13 -0500
Received: by mail-oi1-f194.google.com with SMTP id l9so10325357oii.5
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 11:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kopismobile-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iAI5wgmrYbvKIAKLYGgin8eu2739AIzeNm/Uwvw/GLM=;
        b=PhhG7Vd8yMOuysoMiWZ2qvmofGNCttG2XlB4IaRzzOJo2mzlzih5KT2l+9blmYTyaQ
         rCYwGbUYlVdqW5EZ47Q1kX0rD8dIp1rsAVw1Tq90+XM4QG/sLKBREK1KwKb6aOE0pgGe
         BCTcDbWvBOZsJ0sboe8mTX0RWfY2eyuXrpEJZCaGj1TbolTtuxATCAmgf5UqNVhdYp2H
         zKPTnr/xbThSbRNWbbXVMG0ThONDFxER+oRMnpNJY2tqIJBjiMsmQ5OhywNT0zauHBHW
         09icxa0EaLjX7hWm26CRpEYT4g/fI4AOnIoBgs69KQe309csLpOAWplrcHovy2gpeEYI
         BEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iAI5wgmrYbvKIAKLYGgin8eu2739AIzeNm/Uwvw/GLM=;
        b=T135Sdhg5jaT3d6DUWcUInzl8IDpDb2d8aFW5oo03US2TWr/yZT882mal3+9MdTMKu
         tQvwvkSOIm8Npr4Dfy+2Z6+q3xQ78mA6Xbh+BX/id8a5EK20nWBG2BVRaW3zQrMmW5jC
         plRyChmBJ+8FbsHpHPlF0HWQH/HFi4ZSyh7YM0Q5HKwuxfdx7zLvawcT783VJD90PixO
         SuqGQ289MhPwIWNu5kcMhbff05luEVCNZfmxPL75bgJ/1PnG0/1sQaDzfCGPROXPLzed
         QOWb7koVhh7kcjYw2PSm4AMnTPJBKBSIKAGgGMbbx6zbXQBp5dbIvyhDM0tEir8IjlL9
         gOUA==
X-Gm-Message-State: APjAAAV2fUZz+jkUM7RUly+CYAiHA2+62irfP3cYR02tkOSlOsbbqdP9
        AG19kvWtuT9N1eYao5poRzm6otm/uGRdQg==
X-Google-Smtp-Source: APXvYqw5HqSPqVCW0umxVpbQIkPXRMGzqoqIb+C/oTW6MY+Uzvp4UA8GaPqwIqn2eHjM4ae2Uu9zJQ==
X-Received: by 2002:a05:6808:b29:: with SMTP id t9mr403203oij.69.1581363012734;
        Mon, 10 Feb 2020 11:30:12 -0800 (PST)
Received: from farregard-ubuntu.kopismobile.org (c-73-177-17-21.hsd1.ms.comcast.net. [73.177.17.21])
        by smtp.gmail.com with ESMTPSA id n22sm412163otj.36.2020.02.10.11.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 11:30:12 -0800 (PST)
From:   George Hilliard <ghilliard@kopismobile.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     George Hilliard <ghilliard@kopismobile.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v2 2/2] tty: imx serial: Implement support for reversing TX and RX polarity
Date:   Mon, 10 Feb 2020 13:29:49 -0600
Message-Id: <20200210192949.7338-3-ghilliard@kopismobile.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210192949.7338-1-ghilliard@kopismobile.com>
References: <20200210192949.7338-1-ghilliard@kopismobile.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The peripheral has support for inverting its input and/or output
signals.  This is useful if the hardware flips polarity of the
peripheral's signal, such as swapped +/- pins on an RS-422 transceiver,
or an inverting level shifter.  Add support for these control registers
via the device tree binding.

Signed-off-by: George Hilliard <ghilliard@kopismobile.com>
---
v1..v2: removed confidentiality spam

 drivers/tty/serial/imx.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 0c6c63166250..467e78794997 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -195,6 +195,8 @@ struct imx_port {
 	unsigned int		have_rtscts:1;
 	unsigned int		have_rtsgpio:1;
 	unsigned int		dte_mode:1;
+	unsigned int		inverted_tx:1;
+	unsigned int		inverted_rx:1;
 	struct clk		*clk_ipg;
 	struct clk		*clk_per;
 	const struct imx_uart_data *devdata;
@@ -1335,7 +1337,7 @@ static int imx_uart_startup(struct uart_port *port)
 	int retval, i;
 	unsigned long flags;
 	int dma_is_inited = 0;
-	u32 ucr1, ucr2, ucr4;
+	u32 ucr1, ucr2, ucr3, ucr4;
 
 	retval = clk_prepare_enable(sport->clk_per);
 	if (retval)
@@ -1390,6 +1392,8 @@ static int imx_uart_startup(struct uart_port *port)
 	ucr4 = imx_uart_readl(sport, UCR4) & ~UCR4_OREN;
 	if (!sport->dma_is_enabled)
 		ucr4 |= UCR4_OREN;
+	if (sport->inverted_rx)
+		ucr4 |= UCR4_INVR;
 	imx_uart_writel(sport, ucr4, UCR4);
 
 	ucr2 = imx_uart_readl(sport, UCR2) & ~UCR2_ATEN;
@@ -1404,19 +1408,17 @@ static int imx_uart_startup(struct uart_port *port)
 		ucr2 &= ~UCR2_RTSEN;
 	imx_uart_writel(sport, ucr2, UCR2);
 
+	ucr3 = imx_uart_readl(sport, UCR3);
+	if (sport->inverted_tx)
+		ucr3 |= UCR3_INVT;
 	if (!imx_uart_is_imx1(sport)) {
-		u32 ucr3;
-
-		ucr3 = imx_uart_readl(sport, UCR3);
-
 		ucr3 |= UCR3_DTRDEN | UCR3_RI | UCR3_DCD;
 
 		if (sport->dte_mode)
 			/* disable broken interrupts */
 			ucr3 &= ~(UCR3_RI | UCR3_DCD);
-
-		imx_uart_writel(sport, ucr3, UCR3);
 	}
+	imx_uart_writel(sport, ucr3, UCR3);
 
 	/*
 	 * Enable modem status interrupts
@@ -2184,6 +2186,12 @@ static int imx_uart_probe_dt(struct imx_port *sport,
 	if (of_get_property(np, "rts-gpios", NULL))
 		sport->have_rtsgpio = 1;
 
+	if (of_get_property(np, "fsl,inverted-tx", NULL))
+		sport->inverted_tx = 1;
+
+	if (of_get_property(np, "fsl,inverted-rx", NULL))
+		sport->inverted_rx = 1;
+
 	return 0;
 }
 #else
-- 
2.25.0

