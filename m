Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9AECA9ED0
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 11:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 682CA21897
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 11:29:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="saeMX5o9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbfKAL3f (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 07:29:35 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45482 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727325AbfKAL3e (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 07:29:34 -0400
Received: by mail-pg1-f196.google.com with SMTP id r1so6282990pgj.12
        for <devicetree@vger.kernel.org>; Fri, 01 Nov 2019 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T4yR60OY8mdfdPHyuNjXPb3G3l2Y7DqgyO8YNCtTTi8=;
        b=saeMX5o9o7dLOr8zbt7HBdYkfDgKvi+dBZr1DhL8Cs0mymsTne+VwQ8Zyx5D9TI4u3
         94RWplO4PbbkYUGGCnlU9UmAyaeZzJLYjGHDvOJL5zVL8gAe005jwR0pCqm5IUVsTaZb
         RWyzbwf9nfRgb+uDIZIlVOXiCHuWxOEBDeCHpQxGO4jPzWG3o4nO3+SlW/u5NhMWMTwg
         uIH9w0GniUa5I91+z950pG9LXCncBsf6fIq32ynGMssxwY7MbABgzoQ/HFoDzXdTMHex
         faHZco7gxOiLZj58fl4VDQOGMOMnptgg0O19Fr2HK+c53TH3rrhZPM5+7w6psVbpxSrl
         kG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=T4yR60OY8mdfdPHyuNjXPb3G3l2Y7DqgyO8YNCtTTi8=;
        b=AXPh2a96yZj89dfduuNS6hDWD8JT6LFwG9TwA72MkWMyLfKwTZtVnP1ImtKcwps57v
         qtyvchmxBfrIy+U9MaIp8ohhSlwQ4NTHi18eg3nWv/GQKzQRyxE6I4dPVuAYNwV6aWup
         bKn9RE5LJ3+pWV1ZfNeZiRhfp0citI5f9eC7fvrmbwYh+JnQhHvcbpZYybaiWjtx6M/3
         KPQXcqHr8pJTW4tCP49kUIv51QYtlQ8BI9s/PbXpSGr9vA72msy1vlSWp9ZW+S+1495O
         8A7vpNCW1Hk52LPXTkCkMtr21y/tSB8BaXLA/9blQhoA+LmQ9TqDwe+mWjjmoCakYaJ5
         wvkA==
X-Gm-Message-State: APjAAAUijiqGsV1lLppEQg5czUvUAyY7YyeC9boMaCBI5Ob2mBz3zAdj
        SMX6WCIPin+XWOCg839h7qQ=
X-Google-Smtp-Source: APXvYqybJWi+D5zoN/EAlr0cYtoj/ItxMIK96HM0iVzu/zTz7xtx555y5DxsPlqJKlyyeVSiVVIQtA==
X-Received: by 2002:a17:90a:cc07:: with SMTP id b7mr6289460pju.135.1572607773917;
        Fri, 01 Nov 2019 04:29:33 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id w12sm1369427pfn.105.2019.11.01.04.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:29:33 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
        Jeremy Kerr <jk@ozlabs.org>,
        Alistar Popple <alistair@popple.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        devicetree@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: fsi: Add description of FSI master
Date:   Fri,  1 Nov 2019 21:59:03 +1030
Message-Id: <20191101112905.7282-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191101112905.7282-1-joel@jms.id.au>
References: <20191101112905.7282-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This describes the FSI master present in the AST2600.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../bindings/fsi/fsi-master-aspeed.txt        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
new file mode 100644
index 000000000000..c804897fa936
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
@@ -0,0 +1,24 @@
+Device-tree bindings for AST2600 FSI master
+-------------------------------------------
+
+The AST2600 contains two identical FSI masters. They share a clock and have a
+separate interrupt line and output pins.
+
+Required properties:
+ - compatible: "aspeed,ast2600-fsi-master"
+ - reg: base address and length
+ - clocks: phandle and clock number
+ - interrupts: platform dependant interrupt description
+ - pinctrl-0: phandle to pinctrl node
+ - pinctrl-names: pinctrl state
+
+Examples:
+
+    fsi-master {
+        compatible = "aspeed,ast2600-fsi-master", "fsi-master";
+        reg = <0x1e79b000 0x94>;
+	interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fsi1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
+    };
-- 
2.24.0.rc1

