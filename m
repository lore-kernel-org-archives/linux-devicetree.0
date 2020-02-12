Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B18C3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 16:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACC1E21734
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 16:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kopismobile-com.20150623.gappssmtp.com header.i=@kopismobile-com.20150623.gappssmtp.com header.b="zxAs9Y/g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbgBLQf4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 11:35:56 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34971 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbgBLQfz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Feb 2020 11:35:55 -0500
Received: by mail-ot1-f67.google.com with SMTP id r16so2551103otd.2
        for <devicetree@vger.kernel.org>; Wed, 12 Feb 2020 08:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kopismobile-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zl2PlEEW/OcqeGW2B9HrUYrTRB6X4SONJGCgCc3XydE=;
        b=zxAs9Y/gHCE9rA3PhVYSee+bSf/vDErJTHnsi4TLl056W99fYxhof0SJ/zZUquU5S1
         ojQ9y8T4sgzIG1miea81KwehcDg6BbRQgjIKXx2bb51zUXvz9SQU2ksxOTDz8V5PYRuT
         abvTk1BzlOgUAmblvKjrFJuoDYy/zbqemwfOfsZY3mu8ZkpsUK02SrspKGK5Ouomzx88
         AnwRjEyzLoaboqRs5SDYG8JvITRELEetfGuHuifn2m3fYVYV9OeJll/1YIfNaFmS3yyO
         jcMERpmcgtZmzPvmy5Wh3x20GENoPqg2v1YJkJ6+C5KLvJWPe3KjLSixl+5h5CQkZmqD
         JzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zl2PlEEW/OcqeGW2B9HrUYrTRB6X4SONJGCgCc3XydE=;
        b=siGf+1621zcB/bpGcmbMHfdeq9SK4ylUPEO/FJKpNkZrVXSlZua2tBanWetV4d0CsI
         0D/vsOVIFeu6Fb//7f+BgyX89pFbhwcAI9P8GQoueTHQXhYHG8iEVmhc9frh/HKb+RJ/
         KH7OPlbACkcAiEpfqkC3q60vP19q5HZ0gaKiSiCDya3IAlNinCFpR2VoGUqFuz2AoeA1
         KRNARSsKDRQfmJeiI8afSR1KuWbM7N/Jrl4zxZs7S7iSCqkR7R9njUR394E9gpFyJ1W9
         ZHiPZM2aKECZWTqzx5P2de3tykKkoigv/iXzrExm8iIk5cvSQ6FIt80MLDTmLcgs9F2Q
         R7IA==
X-Gm-Message-State: APjAAAWGc+B2vr7+RMrCWzGmh4xU43E4DCx32ryiMc516crA4m1UCi8q
        DoNmz012ciKTwd+uytg6pJJfNw==
X-Google-Smtp-Source: APXvYqzuRwLgt8dIAgf5ikkNeGR7ZlyM7mSLTFEJEEgXBP99P7Bw+Hz5dawOuL4/UOoKHiMvni4r6g==
X-Received: by 2002:a05:6830:1184:: with SMTP id u4mr9442246otq.221.1581525354081;
        Wed, 12 Feb 2020 08:35:54 -0800 (PST)
Received: from farregard-ubuntu.kopismobile.org (c-73-177-17-21.hsd1.ms.comcast.net. [73.177.17.21])
        by smtp.gmail.com with ESMTPSA id q22sm321034otf.17.2020.02.12.08.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 08:35:53 -0800 (PST)
From:   George Hilliard <ghilliard@kopismobile.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     George Hilliard <ghilliard@kopismobile.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de
Subject: [PATCH v3 1/2] dt-bindings: serial: document fsl,inverted-tx and -rx options
Date:   Wed, 12 Feb 2020 10:35:37 -0600
Message-Id: <20200212163538.3006-2-ghilliard@kopismobile.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200212163538.3006-1-ghilliard@kopismobile.com>
References: <20200212163538.3006-1-ghilliard@kopismobile.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a description for the new fsl,inverted-tx and fsl,inverted-rx
options for the i.MX UART peripheral.

Signed-off-by: George Hilliard <ghilliard@kopismobile.com>
---
v1..v2: Removed confidentiality spam

 Documentation/devicetree/bindings/serial/fsl-imx-uart.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt b/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
index 35957cbf1571..c8d677f9491f 100644
--- a/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
+++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
@@ -8,6 +8,10 @@ Required properties:
 Optional properties:
 - fsl,dte-mode : Indicate the uart works in DTE mode. The uart works
                   in DCE mode by default.
+- fsl,inverted-tx , fsl,inverted-rx : Indicate that the hardware attached
+  to the peripheral inverts the signal transmitted or received,
+  respectively, and that the peripheral should invert its output/input
+  using the INVT/INVR registers.
 - rs485-rts-delay, rs485-rts-active-low, rs485-rx-during-tx,
   linux,rs485-enabled-at-boot-time: see rs485.txt. Note that for RS485
   you must enable either the "uart-has-rtscts" or the "rts-gpios"
-- 
2.25.0

