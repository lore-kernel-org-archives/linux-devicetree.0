Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4F7C43215
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 14:45:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02DD120881
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 14:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aoIt9BkW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfLBOpu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 09:45:50 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35843 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLBOpu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 09:45:50 -0500
Received: by mail-pg1-f194.google.com with SMTP id k13so18465019pgh.3
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 06:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=iBH0RKi5Jz+t2OYGGbilzyyJp7eEpphFSzH4F62bvVg=;
        b=aoIt9BkWVIK0K4bG8cvKy2uSHV1rP8v4kCRGXl4I4MM8P/u6FaNQ3oyO1/BF7VTZMo
         0f44dB6Bk0yrPQbu52sQmeLIEvzqtZ0NWZpumD+odhjKpb0t9XUrK/Ek78Ttf//Rxcb4
         DlLAZ6/gyt5kh4nhs/Yk1V5zzyVOjUWaFOfxH7upkIWJXeUKBNre78alWk65MStgfcNn
         mDrI/VhadjZ7YMoEKp6XuXeunl8mtWQDgnS2WbvjZ5VlAYa1OHzmrfCpz2f8OPv9skae
         xn4tP31CaVl3yKfuVbtHS2X18XshZJ1p6Fl73jSNPwx6zVEBo7O/WBhH48XT9sxAwIyS
         DIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=iBH0RKi5Jz+t2OYGGbilzyyJp7eEpphFSzH4F62bvVg=;
        b=py2FuAktKndvaE+Qtxm57GP41v43bmg81ccHaJT7Oy+77lmtJCmrZTDpupUnS3nY+7
         JO5C7Wka//a32g84fXpi/fnCEpBu4r2po5XagU1a2gDt9zM8sCbyxfwsPs2FZde1n+ks
         EFYlWSfN2cCv2O5OJ26RsZe7U6OMTVKD0Tr7N/cETyx2ecgfii+EAASBOuuJof3h91br
         gQY80zzFS8kBS4ZXa4zVaJe3xjCgd0LNeecWmDQ7bCo2OmN9q5X4a2BHA54Hz37Ze/2J
         WXOPPNus1X7apYWLDwzDHBjQFbpkhaZLjOK98GyvhzTxt676fAJwwMkdhA8+IvMb9y8D
         zDBw==
X-Gm-Message-State: APjAAAWHf28Fju3KDSlPALGmOviSPzELqYBi+7C/BIgpB08dce9FUkeL
        05GFO3MEWh70qbufV0ARwv83VQ==
X-Google-Smtp-Source: APXvYqydjvlaxSk9a4YhTRb37zRq93wXcRnAZKDo01RIEpoI47n4+MqT4yoD+oVbPBskbB3wts1oMA==
X-Received: by 2002:a63:d047:: with SMTP id s7mr604744pgi.81.1575297949772;
        Mon, 02 Dec 2019 06:45:49 -0800 (PST)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id f10sm34347813pfd.28.2019.12.02.06.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 06:45:49 -0800 (PST)
From:   Jun Nie <jun.nie@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, xuwei5@hisilicon.com, p.zabel@pengutronix.de,
        opensource@jilayne.com, swinslow@gmail.com, jun.nie@linaro.org,
        allison@lohutok.net, yuehaibing@huawei.com, tglx@linutronix.de,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, xuejiancheng@hisilicon.com
Subject: [PATCH 1/3] dt-bindings: clock: Update Hisilicon reset doc
Date:   Mon,  2 Dec 2019 22:45:22 +0800
Message-Id: <20191202144524.5391-2-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202144524.5391-1-jun.nie@linaro.org>
References: <20191202144524.5391-1-jun.nie@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document the update of Hisilicon reset operation extension.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../devicetree/bindings/clock/hisi-crg.txt    | 12 ++++----
 include/dt-bindings/reset/hisilicon-resets.h  | 28 +++++++++++++++++++
 2 files changed, 35 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/reset/hisilicon-resets.h

diff --git a/Documentation/devicetree/bindings/clock/hisi-crg.txt b/Documentation/devicetree/bindings/clock/hisi-crg.txt
index cc60b3d423f3..fd8b0a964806 100644
--- a/Documentation/devicetree/bindings/clock/hisi-crg.txt
+++ b/Documentation/devicetree/bindings/clock/hisi-crg.txt
@@ -26,19 +26,21 @@ to specify the clock which they consume.
 
 All these identifier could be found in <dt-bindings/clock/hi3519-clock.h>.
 
-- #reset-cells: should be 2.
+- #reset-cells: should be 3.
 
 A reset signal can be controlled by writing a bit register in the CRG module.
-The reset specifier consists of two cells. The first cell represents the
+The reset specifier consists of three cells. The first cell represents the
 register offset relative to the base address. The second cell represents the
-bit index in the register.
+bit index in the register. The third represent the flags to operation type.
+
+All reset flags could be found in <dt-bindings/reset/hisilicon-resets.h>
 
 Example: CRG nodes
 CRG: clock-reset-controller@12010000 {
 	compatible = "hisilicon,hi3519-crg";
 	reg = <0x12010000 0x10000>;
 	#clock-cells = <1>;
-	#reset-cells = <2>;
+	#reset-cells = <3>;
 };
 
 Example: consumer nodes
@@ -46,5 +48,5 @@ i2c0: i2c@12110000 {
 	compatible = "hisilicon,hi3519-i2c";
 	reg = <0x12110000 0x1000>;
 	clocks = <&CRG HI3519_I2C0_RST>;
-	resets = <&CRG 0xe4 0>;
+	resets = <&CRG 0xe4 0 (HISI_ASSERT_SET | HISI_DEASSERT_CLEAR)>;
 };
diff --git a/include/dt-bindings/reset/hisilicon-resets.h b/include/dt-bindings/reset/hisilicon-resets.h
new file mode 100644
index 000000000000..983e42a0c318
--- /dev/null
+++ b/include/dt-bindings/reset/hisilicon-resets.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hisilicon Reset definitions
+ *
+ * Copyright (c) 2019 HiSilicon Technologies Co., Ltd.
+ */
+
+#ifndef __DT_BINDINGS_RESET_HISILICON_H__
+#define __DT_BINDINGS_RESET_HISILICON_H__
+
+/*
+ * The reset does not support the feature and corresponding
+ * values are not valid
+ */
+#define HISI_ASSERT_NONE		(1 << 0)
+#define HISI_DEASSERT_NONE		(1 << 1)
+
+/* When set this function is activated by polling/setting/clearing this bit */
+#define HISI_ASSERT_SET		(1 << 2)
+#define HISI_DEASSERT_SET		(1 << 3)
+#define HISI_ASSERT_CLEAR		(0 << 4)
+#define HISI_DEASSERT_CLEAR		(0 << 5)
+#define HISI_ASSERT_POLL		(0 << 6)
+#define HISI_DEASSERT_POLL		(0 << 7)
+
+#define HISI_RESET_DEFAULT		(HISI_ASSERT_SET | HISI_DEASSERT_CLEAR)
+
+#endif
-- 
2.17.1

