Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81865C3B186
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 19:30:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 521E6206ED
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 19:30:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kopismobile-com.20150623.gappssmtp.com header.i=@kopismobile-com.20150623.gappssmtp.com header.b="vH69KEeq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbgBJTaM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 14:30:12 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33345 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbgBJTaL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 14:30:11 -0500
Received: by mail-oi1-f195.google.com with SMTP id q81so10366048oig.0
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 11:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kopismobile-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zl2PlEEW/OcqeGW2B9HrUYrTRB6X4SONJGCgCc3XydE=;
        b=vH69KEeqVpGdPuZ4n4OkMvFDSar3/En1/oXfAS5hGwaksxUjRFs6Gy5WmuT27meKv6
         //kctmTzAI8oS2wPzHKVIYzQ1ow/PIkTM9XPllo+PobRpFxD8HLK0hMCJaKJj2AbN/42
         PFMnrjo7V4wpf+P8s0tcyrgZ9bBNfryvhJBw9tqjeyPOB9m4jRFdwriG+ShfuFVIc2mY
         ZgeZtyOMUfHfNbKSCAOVw0J+OCV6qkve4QYUHvZZ7tiwJnuNXvpKbLXqtMz22U+qV7mO
         JUYGyR7/1KmX3lgwD+4O0EJakOV27HQzQ9aezjBSpYp0BFBzWV8X7EmqM0jZDtHxUhPJ
         JNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zl2PlEEW/OcqeGW2B9HrUYrTRB6X4SONJGCgCc3XydE=;
        b=GJVJO9bpGpa8Hyx+U9rrSbymj9KOpn3gnhf3aCOWrlvM47SfwfTjBJRX+jc1hlauom
         M66IqHyJM1KulAIimM3094Ar5arxmElvmXLnZ7GpPp1wJyDvz2HWIjG/PRYoOmHobEeS
         8jz6zKh4yUzEctBAvBb+qYUrxha0FUogHYF4Nrg3q00OgUgShkYChtSIzcI9cqnrUEm4
         gqIcSo69A8VdJYAJfpqo4CvK8ZwTCSglGo7Sve3v6WHybL1CIsVkn6gVKpwbWle6px+9
         fVMnrh/S0TLy793GqFZTXYvL80J2RdKdi3+lClN5hrMJArX6D940Nb2nT8d91N4G2f5F
         iPlA==
X-Gm-Message-State: APjAAAV5d+CL/9KrN//Pb6wnpJT6qWT4iIkLs19kWbJfdbXfT4YGIgdw
        LNk289q8gV8TsCDdegPhvSeFhIY5/lGEuA==
X-Google-Smtp-Source: APXvYqxg7DIaZMbTH1SfOXQ/7HLsulso1ZHoLwGA239tX3HKj8rvkDUqEDZNlgB/IrD0XlGiVXC3+g==
X-Received: by 2002:a05:6808:350:: with SMTP id j16mr396871oie.168.1581363011204;
        Mon, 10 Feb 2020 11:30:11 -0800 (PST)
Received: from farregard-ubuntu.kopismobile.org (c-73-177-17-21.hsd1.ms.comcast.net. [73.177.17.21])
        by smtp.gmail.com with ESMTPSA id n22sm412163otj.36.2020.02.10.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 11:30:10 -0800 (PST)
From:   George Hilliard <ghilliard@kopismobile.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     George Hilliard <ghilliard@kopismobile.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v2 1/2] dt-bindings: serial: document fsl,inverted-tx and -rx options
Date:   Mon, 10 Feb 2020 13:29:48 -0600
Message-Id: <20200210192949.7338-2-ghilliard@kopismobile.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210192949.7338-1-ghilliard@kopismobile.com>
References: <20200210192949.7338-1-ghilliard@kopismobile.com>
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

