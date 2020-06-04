Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5580C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 10:13:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEAE7206DC
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 10:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=antmicro.com header.i=@antmicro.com header.b="JnWKTfsU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgFDKNn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 06:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbgFDKNn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 06:13:43 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7E3C03E96E
        for <devicetree@vger.kernel.org>; Thu,  4 Jun 2020 03:13:42 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j12so3238989lfh.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=antmicro.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QYui7ZerK26a460cGOoZXzgizKRsj7qIogyulB6bf4Y=;
        b=JnWKTfsUdzbZB9H6MpFQSPhuCXmsJ5y4XtvPFHCIm4gjxkGi4uWzMha6+fiaTaP6NW
         vhMUska8wiSUlwjK12jGll9l2iqn38Nx7Ldu0vczGU+4aV/w9moVyU0Jj3R9bKWsKcz9
         T1Yhcuh1AJRlZPQjtbxdNNitzQyMQTvHtgsAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QYui7ZerK26a460cGOoZXzgizKRsj7qIogyulB6bf4Y=;
        b=uNjyMirK2ORhGWuLU3z1WlQYGsOsDjlSkUbCyiLoQgl/jkB2vxmPpG0ULIXJX7g2DP
         0e3RK9uy0Mt4/5rcrFy3x42m+UEBHZZIC/98KnfpeGfH0qpS/QlJRAD/x7ApLDYfapKi
         kSRpvyL1dPCBkFkSeqGQnztiTTkmsAToCr/cNDnqu8qRixGoAh4jd3TOcJZ7hS84ejQQ
         +pkR37swpvJQBOuH7a+Hf8JLBhhCenUa8VdT8EQmmoqCqgtO/K+lZUtRnhQmjNTqMOf6
         AFsruei90AwRpYNFaOD4LUbmMJJVwn9WbZD3xULSgjH9CwCH9oC7vWz9Uw3zZoSeaYGi
         ShsA==
X-Gm-Message-State: AOAM533NVrHYpsqRIPcxoypOdnpWrZyZCCG2AxYcYQFRZ8XN6sONiEic
        kUUvwNnN9z/U+HYC5wuxnmNVdg==
X-Google-Smtp-Source: ABdhPJwij+JC4DOAVIVV71coO2P3NYjkxsNFWFSM8/dc+4RgWeh/5QOCnb7Mo59Dfi1SHNvgL+jRxQ==
X-Received: by 2002:ac2:59c3:: with SMTP id x3mr2149997lfn.117.1591265620601;
        Thu, 04 Jun 2020 03:13:40 -0700 (PDT)
Received: from localhost.localdomain (d79-196.icpnet.pl. [77.65.79.196])
        by smtp.gmail.com with ESMTPSA id v28sm1362150lfd.35.2020.06.04.03.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 03:13:39 -0700 (PDT)
Date:   Thu, 4 Jun 2020 12:13:34 +0200
From:   Mateusz Holenko <mholenko@antmicro.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Stafford Horne <shorne@gmail.com>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Filip Kokosinski <fkokosinski@antmicro.com>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Joel Stanley <joel@jms.id.au>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, "Gabriel L. Somlo" <gsomlo@gmail.com>
Subject: [PATCH v7 2/5] dt-bindings: soc: document LiteX SoC Controller
 bindings
Message-ID: <20200604121142.2964437-2-mholenko@antmicro.com>
References: <20200604121142.2964437-0-mholenko@antmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604121142.2964437-0-mholenko@antmicro.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Pawel Czarnecki <pczarnecki@internships.antmicro.com>

Add documentation for LiteX SoC Controller bindings.

Signed-off-by: Pawel Czarnecki <pczarnecki@internships.antmicro.com>
Signed-off-by: Mateusz Holenko <mholenko@antmicro.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    No changes in v7.

    Changes in v6:
        - fixed license header

    Changes in v5:
        - added reviewed-by tag
    
    Changes in v4:
        - changes compatible to "litex,soc-controller"
        - fixed yaml's header
        - removed unnecessary sections from yaml
        - fixed indentation in yaml
    
    This commit has been introduced in v3 of the patchset.

 .../soc/litex/litex,soc-controller.yaml       | 39 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml

diff --git a/Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml b/Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml
new file mode 100644
index 000000000000..53121c1fbe4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright 2020 Antmicro <www.antmicro.com>
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/litex/litex,soc-controller.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: LiteX SoC Controller driver
+
+description: |
+  This is the SoC Controller driver for the LiteX SoC Builder.
+  It's purpose is to verify LiteX CSR (Control&Status Register) access
+  operations and provide function for other drivers to read/write CSRs
+  and to check if those accessors are ready to use.
+
+maintainers:
+  - Karol Gugala <kgugala@antmicro.com>
+  - Mateusz Holenko <mholenko@antmicro.com>
+
+properties:
+  compatible:
+    const: litex,soc-controller
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    soc_ctrl0: soc-controller@f0000000 {
+        compatible = "litex,soc-controller";
+        reg = <0x0 0xf0000000 0x0 0xC>;
+        status = "okay";
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ddc1dc7e535e..e3f8804c08d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9918,6 +9918,12 @@ L:	kunit-dev@googlegroups.com
 S:	Maintained
 F:	lib/list-test.c
 
+LITEX PLATFORM
+M:	Karol Gugala <kgugala@antmicro.com>
+M:	Mateusz Holenko <mholenko@antmicro.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/*/litex,*.yaml
+
 LIVE PATCHING
 M:	Josh Poimboeuf <jpoimboe@redhat.com>
 M:	Jiri Kosina <jikos@kernel.org>
-- 
2.25.1

