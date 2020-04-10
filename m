Return-Path: <SRS0=Z42x=52=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC78EC2BB55
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 09:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81B25206F7
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 09:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/E0af2s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgDJJSo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 05:18:44 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53683 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgDJJSo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Apr 2020 05:18:44 -0400
Received: by mail-wm1-f65.google.com with SMTP id d77so1868667wmd.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2020 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4QBHYdaBS/zCmNUeetxcK68TmanqEvxov8IzF/nOH2Y=;
        b=p/E0af2slS1/cYcgsjPwSlUXAkx1XR+SKtSZTFpuURtSEWHCzvpg/9ac+gpV5XkY5e
         tpy+u2Vox6XPyjbz5LtCaGgtQGCXY4NOAEba0gyRQBKoOwzX0xZ4YJbjNtjKzD+Ni8/0
         pv/cspNKwLfhhRbSfzfANrEicAKvVhfx+SmGbEe5WY06wfVW6/nH8jnQLs6ug60IQGoB
         D5ZIyB5DUdGgua9k4JgnG7wyGFvxx8/+2C5vP6bOGavBqHHuSjZfdZqmk061sLF19+br
         jrTiux4MzF3Qus1w7VBozBI6YyiYmmMeX1CJ9sSIJoudi5u8jrPJD2BnUAqvzShkZchj
         S4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4QBHYdaBS/zCmNUeetxcK68TmanqEvxov8IzF/nOH2Y=;
        b=XIGJze8p6F0UdAdB+uiiMhwvJ8aqslwL/35cH/9bG5MaxcAZCTD94tNW42HA1kVKZ0
         4Vw6ZPKPwfMJayhCQ+vssrrDzvLoDJ06atFssSPi54RYpkahHrP6OS8AQthEmib5npJB
         SkP5dmtXMUhwlsn/ZcGvhAA3EdWFkJj76kjYsf8XaWTwVYRfB1XPuIL065F+1UVKY2/1
         UdGseTxJfjv8f3IEIvb0jUM4XDzFUq/V5YtBUogkuRn3PUM1C4rgAzH8FKQGI4i6DSAI
         BKHRykRlvgug3mUtG0ZJUARMtSbc/5Di7X1gREKospl9Nh6J692EZDq29zG8zFtQBlOb
         sgIw==
X-Gm-Message-State: AGi0PuZYRt3hyIhY+2inavhQAwKgYoNWXmqhn2SUeBzLEJw5kbL9VXyG
        WOM4sS8c1jejIhao9CEohlo=
X-Google-Smtp-Source: APiQypLBAncxVk/Uq8YFXfVq408ALxCpVU5NkHby6EiWKsDaaEES7BeLeEgvkm5AHRRvZPcSnJng2w==
X-Received: by 2002:a1c:ded4:: with SMTP id v203mr4245359wmg.106.1586510320802;
        Fri, 10 Apr 2020 02:18:40 -0700 (PDT)
Received: from localhost.localdomain (134.red-83-46-193.dynamicip.rima-tde.net. [83.46.193.134])
        by smtp.gmail.com with ESMTPSA id p3sm2049066wrq.97.2020.04.10.02.18.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2020 02:18:40 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     neil@brown.name, driverdev-devel@linuxdriverproject.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH 1/2] staging: mt7621-pci-phy: dt: bindings: add mediatek,mt7621-pci-phy.yaml
Date:   Fri, 10 Apr 2020 11:18:35 +0200
Message-Id: <20200410091836.13068-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200410091836.13068-1-sergio.paracuellos@gmail.com>
References: <20200410091836.13068-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add bindings to describe Mediatek MT7621 PCIe PHY.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../mediatek,mt7621-pci-phy.yaml              | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.yaml

diff --git a/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.yaml b/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.yaml
new file mode 100644
index 000000000000..cf32bbc45b5d
--- /dev/null
+++ b/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/mediatek,mt7621-pci-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek Mt7621 PCIe PHY Device Tree Bindings
+
+maintainers:
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+properties:
+  compatible:
+    const: mediatek,mt7621-pci-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+    description: selects if the phy is dual-ported
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie0_phy: pcie-phy@1e149000 {
+      compatible = "mediatek,mt7621-pci-phy";
+      reg = <0x1e149000 0x0700>;
+      #phy-cells = <1>;
+    };
-- 
2.25.1

