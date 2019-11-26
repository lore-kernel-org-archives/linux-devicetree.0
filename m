Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052C8C432C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 02:23:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4F12207FD
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 02:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gC+KpiU1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfKZCXF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 21:23:05 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:43745 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfKZCXF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 21:23:05 -0500
Received: by mail-pj1-f67.google.com with SMTP id a10so7510072pju.10
        for <devicetree@vger.kernel.org>; Mon, 25 Nov 2019 18:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xbKjbaa4u/VuF0dita2DzSgc+Ewhehs6e1Su0L/FDtc=;
        b=gC+KpiU1/r8M8/r/NGN7p7vTKHt1QMoHl5c/3oKsVU7/ZjLFPvqCTLc8lpGIukdyq+
         2zupypCniRRMo/6R1pEA+w74J82zDhosQu9RM/iVe3c8Kv2rtDhkippUWefGz+jo68oJ
         PBRvUd4FwgCslY+74JAWBGn7DeoBllXzTuUeJqVuGEcQVk+F87nyuod4I6Vo4FbRsWOd
         97F9GQUFKqkDBfibOXESayOvwGuPYZW7UuznwEj7Wdp2UmLsC6oE8Cd87+5rmjnjeJlc
         r6fpJGHsIf0yFNhbZQdV8bJXg+Ue3/6+bUSKwG7VZ9QdWcNWB9NrKqPeCxWM1eA2CO9l
         mzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=xbKjbaa4u/VuF0dita2DzSgc+Ewhehs6e1Su0L/FDtc=;
        b=Zp9sjE4XmmnqOpptkMpkcGQ1DQNRPE0rNnKVdNZS/vm5KKh3qWPMRD+C+VcEyMLF1N
         dTvLqtHMu9Ed7C+El05139o2ITW4Eolwa2qQX099JxlPOlFgh9K+ts1d6v8XTDxSwM7j
         2M/AlM0z6GqI/yD2riJy5ZqdUSnmIFxXdGH/8vffFAaoikrRt/dCpRafsYvOWwlJGm6h
         ezNe6dZK3graFmA1aVcZZXsH7Jznb+PKTmvlYmtr7T4HH4ojDVsYrKfBWBYcn5kKorWr
         mNwrpDVkJLRF+MGeNTaN1t+BeUtZBAlXw+Dgj+K9hr1myXqfVdkuBNVFkdsPEYqKK/Pb
         3LPg==
X-Gm-Message-State: APjAAAVSHIqPB3P9UpB553b8j38Y6QbenSwOcAm1RQ+wGa5oCGIcNF9T
        cx+qeXLla3/4ggidJ/QwW5Y=
X-Google-Smtp-Source: APXvYqzVEbC7IHgNm9PgTKAbD8ogbBca66OHQGbpa3PaHWkRQPie0o8we6vwzQtmBRp1ClM1NFv+2g==
X-Received: by 2002:a17:902:1:: with SMTP id 1mr31237195pla.338.1574734984197;
        Mon, 25 Nov 2019 18:23:04 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id q70sm666568pjq.26.2019.11.25.18.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 18:23:03 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH 1/2] dt-bindings: mfd: Add ast2600 to ASPEED LPC
Date:   Tue, 26 Nov 2019 12:52:42 +1030
Message-Id: <20191126022243.215261-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126022243.215261-1-joel@jms.id.au>
References: <20191126022243.215261-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The AST2600 has the same LPC layout as previous generation SoCs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index 86446074e206..bef07c3b1a3e 100644
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
+			"aspeed,ast2400-lhc";
+			"aspeed,ast2500-lhc";
+			"aspeed,ast2600-lhc";
+
  - reg:			offset and length of the IP in the LHC memory region
  - #reset-controller	indicates the number of reset cells expected
 
-- 
2.24.0

