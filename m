Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F815C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:06:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57534207D8
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Cbc+o6tZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgFLNGy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 09:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgFLNGw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 09:06:52 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0D6C03E96F
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:06:51 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b16so4261370pfi.13
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DNpIJBz2KGtG+lwsglq7c9aHY9dZZb83R83ottokbxA=;
        b=Cbc+o6tZh4dLX7Cn6d1kR1nCuPXsJVjLHvJW2ZG7UdxtQrriNSDpwkxRIm1Agaswlj
         xcFXTk6Nfic0W5IIfycBw4qlMZ6D8B/jwvolntDDrihyKZddvV9XTQ8nDwdLkCL/9v1z
         WYexwbvnp99gniEQVuv0PR4qHBdJ+o4ErcZIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DNpIJBz2KGtG+lwsglq7c9aHY9dZZb83R83ottokbxA=;
        b=FmUVUNvKV6Ef81bBUx3G8GJoO1RlKkhAVA5OPFsGq2iSN27+R3NAY+wp3S9A4v2zGA
         38zXzqcrGd3wiIZBjOj7pG+iT4uK+0ZBJuqHhNg7JAeEWH2HsVdZO49z5lywIRuPURel
         uOUgjj0oQZl0ETtdfErUsLtgw4CV0XTCIhbHhdmFP74nghAP7G6X89gy4a5CvMWPW/g9
         pbZAbvu/k0mrWIXgCL5v53oE9D/QR/VUbes9140ONm1714CPWKUoPfb1Cpf3EiZQljig
         4MRGBT7TmdjEz+WAXU9pYWhVukpjiDAe0+VSD72mD41WZ3OZpu4FCeTQSkhdD+wJVpSP
         99Hg==
X-Gm-Message-State: AOAM5320sd9BuW5emz6EMWaOOeQZ5c3KJRlDKvjDTINKogDA9d1/JHsQ
        w1Ojun6dFeOvHXU7sXO4a0R9rg==
X-Google-Smtp-Source: ABdhPJxTEkNGZzCiMUzMoSHFsARQU9db5VWFyGj0N4YhoDGivY8b2UfohZ1qIdIyMrUV+4R1q+a6WA==
X-Received: by 2002:a62:1b01:: with SMTP id b1mr12057949pfb.14.1591967210456;
        Fri, 12 Jun 2020 06:06:50 -0700 (PDT)
Received: from shiro.work (p1285116-ipngn200805sizuokaden.shizuoka.ocn.ne.jp. [114.171.61.116])
        by smtp.googlemail.com with ESMTPSA id k12sm5481939pgm.11.2020.06.12.06.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:06:49 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-kernel@vger.kernel.org
Cc:     daniel@0x0f.com, afaerber@suse.de, devicetree@vger.kernel.org,
        Daniel Palmer <daniel@thingy.jp>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mike Rapoport <rppt@kernel.org>,
        Doug Anderson <armlinux@m.disordat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nathan Huckleberry <nhuck15@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 09/12] ARM: mstar: Add infinity/infinity3 family dtsis
Date:   Fri, 12 Jun 2020 22:00:09 +0900
Message-Id: <20200612130032.3905240-10-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200612130032.3905240-1-daniel@0x0f.com>
References: <20200610090421.3428945-1-daniel@0x0f.com>
 <20200612130032.3905240-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds two family level dtsis for the infinity and infinity3
and then adds a chip level dtsi each for a chip in those families.

infinity3.dtsi includes infinity.dtsi as these SoCs share most of
their memory map and we would have a lot of duplication otherwise.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 MAINTAINERS                              |  1 +
 arch/arm/boot/dts/infinity-msc313.dtsi   | 14 ++++++++++++++
 arch/arm/boot/dts/infinity.dtsi          |  7 +++++++
 arch/arm/boot/dts/infinity3-msc313e.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/infinity3.dtsi         |  7 +++++++
 5 files changed, 43 insertions(+)
 create mode 100644 arch/arm/boot/dts/infinity-msc313.dtsi
 create mode 100644 arch/arm/boot/dts/infinity.dtsi
 create mode 100644 arch/arm/boot/dts/infinity3-msc313e.dtsi
 create mode 100644 arch/arm/boot/dts/infinity3.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 00de66458e53..7673acf55172 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2116,6 +2116,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar.yaml
+F:	arch/arm/boot/dts/infinity*.dtsi
 F:	arch/arm/boot/dts/mstar-v7.dtsi
 F:	arch/arm/mach-mstar/
 
diff --git a/arch/arm/boot/dts/infinity-msc313.dtsi b/arch/arm/boot/dts/infinity-msc313.dtsi
new file mode 100644
index 000000000000..42f2b5552c77
--- /dev/null
+++ b/arch/arm/boot/dts/infinity-msc313.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "infinity.dtsi"
+
+/ {
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x4000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/infinity.dtsi b/arch/arm/boot/dts/infinity.dtsi
new file mode 100644
index 000000000000..f68e6d59c328
--- /dev/null
+++ b/arch/arm/boot/dts/infinity.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "mstar-v7.dtsi"
diff --git a/arch/arm/boot/dts/infinity3-msc313e.dtsi b/arch/arm/boot/dts/infinity3-msc313e.dtsi
new file mode 100644
index 000000000000..4e7239afd823
--- /dev/null
+++ b/arch/arm/boot/dts/infinity3-msc313e.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "infinity3.dtsi"
+
+/ {
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x4000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/infinity3.dtsi b/arch/arm/boot/dts/infinity3.dtsi
new file mode 100644
index 000000000000..2830d064c07d
--- /dev/null
+++ b/arch/arm/boot/dts/infinity3.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "infinity.dtsi"
-- 
2.27.0.rc0

