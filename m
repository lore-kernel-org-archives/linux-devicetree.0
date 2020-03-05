Return-Path: <SRS0=vtql=4W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07821C3F2D2
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 22:00:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFEBD208CD
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 22:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vgs6VA4Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgCEWAk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 17:00:40 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45899 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgCEWAj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 17:00:39 -0500
Received: by mail-pl1-f195.google.com with SMTP id b22so3202161pls.12
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 14:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eWqPL9ibbKXWR51v31XcIk5pftgYa/pcecnYKmVCJAo=;
        b=vgs6VA4Ql2ehQpGwP8xBKZROXMa5jcdTZK1TIb0ab24I+jDsExL8ZmDvNIuybugniE
         DZcAJu/WO4PgnreJF8GnmOkpBHHf/2MgEqTfLExY/ma4eeX5bMGhbZGvsSTAqQ41fT6J
         jXAuss2M3riFwEDM2rF3CmGX6LgsuqZh5SgJ1xG/Pmgz/ZZ6HaQ4eFy05e2vkCkjv4Yq
         dTXBQaMix+Bp8sO8jX9pQjP8FbCbvP51flZytpVczO3yy/3YfKogoFSdWQH5VxcRsrHH
         55Y/gtMYmsHXp69C6xUFVRulATIXdQQpWz5dU2DSUtvaOV5EjN2qb1u9JyioW5B0VQ5n
         vmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eWqPL9ibbKXWR51v31XcIk5pftgYa/pcecnYKmVCJAo=;
        b=YdPN0MsVVShBE2hmX9de4yTa8XnYuE3pCPHp4t8cBCK2ZXpSsuLdJFJocLcmekbRT4
         95+735U7hxlzPjEHSxNGkRA9NCogvOSng5wXqHZknwd4FlTe65buq/enXfN76WqVeXk+
         N9aSKjMzWg8bmXdeQVboCMgBaGoFxIUbSgZ4st5/uIGnUThoJj6LhNxe4XDCUxaqIqrp
         LWtBNa34X87KA1154zaiuYtWyqoZ3pvf807hYBT97TsTXJEyeGFsQXztW6sdbExH4bHa
         se1O/x1AC+L1an5sxJgylN5ZqkK7PNUDYxk1uW68Ku9dCuuxmcGO/OnPe3nG2LPzY43h
         E5fg==
X-Gm-Message-State: ANhLgQ3xrmlJIbAgXIzmmNddAOBT5hNnZX+/PHNnCMuf6CA3VSbgmuAk
        qtUdHJtrWC5CeDc7jklQANbycw==
X-Google-Smtp-Source: ADFU+vvVpe3cKKDK1pzFwqfUyVxO1sV0ARtSLXgu+fL4G8UfhprencLvX4yTQkw0MS1d4TaZgJF8HA==
X-Received: by 2002:a17:902:868d:: with SMTP id g13mr192450plo.36.1583445637762;
        Thu, 05 Mar 2020 14:00:37 -0800 (PST)
Received: from localhost ([103.195.202.232])
        by smtp.gmail.com with ESMTPSA id g11sm4755331pfo.184.2020.03.05.14.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 14:00:36 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v1 4/4] arm64: dts: marvell: Fix cpu compatible for AP807-quad
Date:   Fri,  6 Mar 2020 03:30:15 +0530
Message-Id: <2f56a89b8f88583b60446050efc523a781556e3a.1583445235.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583445235.git.amit.kucheria@linaro.org>
References: <cover.1583445235.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

make -k ARCH=arm64 dtbs_check shows the following errors. Fix them by
removing the "arm,armv8" compatible.

/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9130-db.dt.yaml:
cpu@0: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9130-db.dt.yaml:
cpu@0: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long CHECK
arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dt.yaml
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9130-db.dt.yaml:
cpu@1: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9130-db.dt.yaml:
cpu@1: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9130-db.dt.yaml:
cpu@100: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9130-db.dt.yaml:
cpu@100: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9130-db.dt.yaml:
cpu@101: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9130-db.dt.yaml:
cpu@101: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long

/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9131-db.dt.yaml:
cpu@0: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9131-db.dt.yaml:
cpu@0: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9131-db.dt.yaml:
cpu@1: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9131-db.dt.yaml:
cpu@1: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9131-db.dt.yaml:
cpu@100: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9131-db.dt.yaml:
cpu@100: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9131-db.dt.yaml:
cpu@101: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9131-db.dt.yaml:
cpu@101: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long

/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9132-db.dt.yaml:
cpu@0: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9132-db.dt.yaml:
cpu@0: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9132-db.dt.yaml:
cpu@1: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9132-db.dt.yaml:
cpu@1: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9132-db.dt.yaml:
cpu@100: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9132-db.dt.yaml:
cpu@100: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9132-db.dt.yaml:
cpu@101: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-check/arch/arm64/boot/dts/marvell/cn9132-db.dt.yaml:
cpu@101: compatible: ['arm,cortex-a72', 'arm,armv8'] is too long

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi b/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi
index 840466e143b47..68782f161f122 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi
@@ -17,7 +17,7 @@
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
-			compatible = "arm,cortex-a72", "arm,armv8";
+			compatible = "arm,cortex-a72";
 			reg = <0x000>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
@@ -32,7 +32,7 @@
 		};
 		cpu1: cpu@1 {
 			device_type = "cpu";
-			compatible = "arm,cortex-a72", "arm,armv8";
+			compatible = "arm,cortex-a72";
 			reg = <0x001>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
@@ -47,7 +47,7 @@
 		};
 		cpu2: cpu@100 {
 			device_type = "cpu";
-			compatible = "arm,cortex-a72", "arm,armv8";
+			compatible = "arm,cortex-a72";
 			reg = <0x100>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
@@ -62,7 +62,7 @@
 		};
 		cpu3: cpu@101 {
 			device_type = "cpu";
-			compatible = "arm,cortex-a72", "arm,armv8";
+			compatible = "arm,cortex-a72";
 			reg = <0x101>;
 			enable-method = "psci";
 			#cooling-cells = <2>;
-- 
2.20.1

