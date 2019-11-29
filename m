Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1132C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 00:08:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C491A215F1
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 00:08:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFf8A3Xu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfK2AIn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 19:08:43 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:41455 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfK2AIn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 19:08:43 -0500
Received: by mail-pj1-f67.google.com with SMTP id ca19so2898677pjb.8
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 16:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dpxFtxxgBElM+YJglBfx04/eAo0nvXB7AnoxAb/3UH0=;
        b=hFf8A3Xuv+sXyGmJvDCRUD4X5Sxql7d54f08MeyyQc2L2AhMvtWP0mOin+7b8F8KiH
         7iykoIqbtUPxSYdOqptxx9NZZUvlvLbM5yeZqgKlekBCyN8Q9AkKk/FhlJZwdmHZH/ne
         SWx4DbiXDrugh7fr7i2j05qfN0X8NylHkM2dAvalFJXZQqofGgRtAoqeW8Kug5sU4bHG
         sN+xqwgogDJ4dJOcU0jnJv8fYQnRHAFfYYYek+wjT4B7DQqq6Hna9IWJuaEtFLaZmu7o
         BJaudMXDRGwL7x7zTZ+AoqDnt5k/7EzAAE79vZ1iDWPK93IW/l1UNKBeycwY2macDkPZ
         dnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=dpxFtxxgBElM+YJglBfx04/eAo0nvXB7AnoxAb/3UH0=;
        b=Q2Jnrzu7cwJkt6a2R9a7imD6Vg+NlrkRLhMhXlXOqD79ogrPlPztMjEgVXhrj/uCz2
         vqT8QNwM+b+waNYmqWR1QUBM8OMewp8a973TZ4kx/AiK6T7kgw4FNG7Oa9EvMHe/5wJm
         n2dfUbefZEqIuw6ZXmM5iF4V8yxfoMFrpvl7HhUjELEjnYacQQ5jnFnl1Xj6XV/iO5Ce
         8J5MB5ETSZwN9AimVAlUEzGTwlCNgVdkml5OhKNPL8RlKtL9jOjEQ7yly5OqMfHW86s1
         349SZDWP1cH0SN1Jav8fDtmW92nJapKeCq69S81p3LWbQfIe1v51JDHwRhfSYZgD31yR
         oz/g==
X-Gm-Message-State: APjAAAVdj3TR9dkF9jKIRKSzhNiMVLwhDqxS0M9eiR2Lw+VNGaRt3Et2
        /3TRSXSsBfj5gXslfpTmE8ZycxaOdJAg/w==
X-Google-Smtp-Source: APXvYqxAFkWBLKQ16x08JOih5XHtxlgt8S5/tHtG4Wu9OpQMLx6GJcY1sTin3i+g5nxR2RtZAzZVsA==
X-Received: by 2002:a17:90a:d58e:: with SMTP id v14mr16105905pju.142.1574986121012;
        Thu, 28 Nov 2019 16:08:41 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id d188sm21302075pfa.157.2019.11.28.16.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 16:08:40 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 1/2] dt-bindings: mfd: Add ast2600 to ASPEED LPC
Date:   Fri, 29 Nov 2019 10:38:26 +1030
Message-Id: <20191129000827.650566-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191129000827.650566-1-joel@jms.id.au>
References: <20191129000827.650566-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The AST2600 has the same LPC layout as previous generation SoCs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix cut and paste error in reset bindings
---
 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index 86446074e206..a5d89aa9a3c1 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
@@ -46,6 +46,7 @@ Required properties
 - compatible:	One of:
 		"aspeed,ast2400-lpc", "simple-mfd"
 		"aspeed,ast2500-lpc", "simple-mfd"
+		"aspeed,ast2600-lpc", "simple-mfd"
 
 - reg:		contains the physical address and length values of the Aspeed
                 LPC memory region.
@@ -64,6 +65,7 @@ BMC Node
 - compatible:	One of:
 		"aspeed,ast2400-lpc-bmc"
 		"aspeed,ast2500-lpc-bmc"
+		"aspeed,ast2600-lpc-bmc"
 
 - reg:		contains the physical address and length values of the
                 H8S/2168-compatible LPC controller memory region
@@ -128,6 +130,7 @@ Required properties:
 - compatible:	One of:
 		"aspeed,ast2400-lpc-ctrl";
 		"aspeed,ast2500-lpc-ctrl";
+		"aspeed,ast2600-lpc-ctrl";
 
 - reg:		contains offset/length values of the host interface controller
 		memory regions
@@ -168,6 +171,7 @@ Required properties:
 - compatible:	One of:
 		"aspeed,ast2400-lhc";
 		"aspeed,ast2500-lhc";
+		"aspeed,ast2600-lhc";
 
 - reg:		contains offset/length values of the LHC memory regions. In the
 		AST2400 and AST2500 there are two regions.
@@ -187,8 +191,11 @@ state of the LPC bus. Some systems may chose to modify this configuration.
 
 Required properties:
 
- - compatible:		"aspeed,ast2500-lpc-reset" or
-			"aspeed,ast2400-lpc-reset"
+ - compatible:		One of:
+			"aspeed,ast2400-reset";
+			"aspeed,ast2500-reset";
+			"aspeed,ast2600-reset";
+
  - reg:			offset and length of the IP in the LHC memory region
  - #reset-controller	indicates the number of reset cells expected
 
-- 
2.24.0

