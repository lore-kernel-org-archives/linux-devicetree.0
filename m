Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF508C3B187
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 17:50:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97DAA20838
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 17:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kopismobile-com.20150623.gappssmtp.com header.i=@kopismobile-com.20150623.gappssmtp.com header.b="rMGK+ZC8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbgBJRuj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 12:50:39 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46246 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgBJRui (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 12:50:38 -0500
Received: by mail-oi1-f193.google.com with SMTP id a22so9967720oid.13
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 09:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kopismobile-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version;
        bh=UR6KsR5ai8ITr9vad8IVGuhSVbCvQzuGaWtLQyEdrZE=;
        b=rMGK+ZC8vmj66nSqOE601u3oxggsvF/jyBGM9LKLnHSArSFEU3sjUnwOCgbPBofaV0
         BQCwp86ljbDzUzZRBCPs0m+aBaPpWowW9nCdBddUZJanyqkGl/mnxVNjNogDitUn6Pp0
         1JnG6rF5tZmXmHeSDGM/dBisMBa3ELRwNmWMxy7e+xfU1UlKCzKcKebUa4AxlGe1mmeh
         dkoBp+Ec6uT14F3rGykSttPftRh72RLC7RNP6jmZ5kSoBSiYU9/qPN3NuxZgc/qbRtqf
         Kg7MsOARx8Kr8z8Rp+mMzSK1kXJtl0M7lkfpgcWqzp4FhUjJTQGxx5GeZWhV0wl0pQij
         69oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version;
        bh=UR6KsR5ai8ITr9vad8IVGuhSVbCvQzuGaWtLQyEdrZE=;
        b=b1xUxhYjFJjcGP7CAN0QsnHMu4GTqamUTwAQsZIEgZVvoRCDUt3XBZqZUJ27+U7KAn
         kTavwX1h1mAS7+hKRbKrzbFMi/CB7n3kdxkzpeI6rtL7hGCESWuHPACaj+yn+bn/Mkyf
         pNcNFHfD1eP6HgGU4llBL3Swv20re1+En/zP5onc180yP6jHz5N3Nbeu18rMoysoH14C
         n2oxz7WmOsCQZ/wG+1l9bqpAZnzo8z7TLa69gPb7TFhw6nBXouH8qUsujsxKdPvQtmzK
         LboamVzvQRDQwa0aY2O4mi5AOEVMCHulbt/mrsk1OIj7qOs3zjda58+0jU+0dQi8mqo9
         KZyg==
X-Gm-Message-State: APjAAAWxtJ6TjKV4JOa+NZOFCc/0pZvR2SxaVZC7gUTnV56q7vaQtzoN
        +q5IMtG+4greedaJqFmwfM7g+7g2F76IuZxOMIRVLQLLPk69vdMTasl+92yHObQuRSeQVHb2MMm
        APAH7Si9D52vHw3w=
X-Google-Smtp-Source: APXvYqxIcseXoWFIBslU5E0Ll1yT9IHCFkl+MIt3RNqkleIwJ2uxpA63e1+bg03SEBzSkpj18PuN9w==
X-Received: by 2002:aca:d484:: with SMTP id l126mr151998oig.114.1581357037932;
        Mon, 10 Feb 2020 09:50:37 -0800 (PST)
Received: from farregard-ubuntu.kopismobile.org (c-73-177-17-21.hsd1.ms.comcast.net. [73.177.17.21])
        by smtp.gmail.com with ESMTPSA id r205sm293189oih.54.2020.02.10.09.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 09:50:37 -0800 (PST)
From:   George Hilliard <ghilliard@kopismobile.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc:     George Hilliard <ghilliard@kopismobile.com>
Subject: [PATCH 2/2] tty: imx serial: Implement support for reversing TX and RX polarity
Date:   Mon, 10 Feb 2020 11:49:42 -0600
Message-Id: <20200210174942.14182-3-ghilliard@kopismobile.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210174942.14182-1-ghilliard@kopismobile.com>
References: <20200210174942.14182-1-ghilliard@kopismobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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


-- 
CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use 
of the intended recipient and may contain material that is proprietary, 
confidential, privileged or otherwise legally protected or restricted under 
applicable government laws. Any review, disclosure, distributing or other 
use without expressed permission of the sender is strictly prohibited. If 
you are not the intended recipient, please contact the sender and delete 
all copies without reading, printing, or saving.
