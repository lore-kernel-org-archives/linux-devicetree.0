Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3218C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 12:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9518620715
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 12:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpEzaA4T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfLWMHt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 07:07:49 -0500
Received: from mail-pf1-f171.google.com ([209.85.210.171]:43454 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbfLWMHt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Dec 2019 07:07:49 -0500
Received: by mail-pf1-f171.google.com with SMTP id x6so7998023pfo.10
        for <devicetree@vger.kernel.org>; Mon, 23 Dec 2019 04:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=C/NDjdg8YQGt2AK0E3j6iJbr0F2WO/uc87KiGLNm5+Y=;
        b=lpEzaA4THpszZ/Ppu08/O5yU3X9L1VnX/RSyAW7pJ6NA3OLZ0vjsmsFnI8vG8nPbaD
         zsYyT5aS9ySca5D4+dL28IC7b2sKFof3SuMwfxuNTaQtr9w5sLvlJnOKKbtEFmt0WFLz
         iCt+0xxqZsCR7gu6a2pQrRH+NArsx+RuI/yDlTvgX5z2ZrrTNgnY6NwFQVGojuFvDGK2
         I1CZD4j4IL9Vv28yupdAH9IhI8iUVPRNbW4ygUwziLJALVIiQmxSlRBnrsNwjqcVXgf4
         3nRH0iCulN/RVMvuSuVYWIZabui0OesVwX7ZWsm1qNnruJFsfktHK4/iYxQb4HlAcI4r
         K+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=C/NDjdg8YQGt2AK0E3j6iJbr0F2WO/uc87KiGLNm5+Y=;
        b=kmaIS5ao9fiI4VQX6QfWcZ1YnDlb0+Topa7yzSxMk56uyiyuk6qfhJX2IRPqyd1RG6
         JEQDcx+V40GRsnySqSJsEHoE9z1GB7FiXa+cnIA5gaywD97H7YO2OBuH4TmujUVFkLj9
         /fVEy78wbFqjBW9dOjYX0aF6jw1FDgiMOzuTmo5YfIMJverJkAW6EwtWs++COacI/A5l
         WHrw9FGhTeQALlFyNXfuD6gfaaXY/ZsYnO9la5gibPCXxQ136aU6ZhthqKkJkEPNT8Ws
         UOgFvflTQ7dUXvCm1BnpwqAYRBxdZYpSrho83Peck0Z6viE9AdwVflMicIraOsJeIrOv
         qY4A==
X-Gm-Message-State: APjAAAUm6zNyGq+L9MgeFwo/iZdeVv0054BFWNa98tWib5XwERARXVNC
        RUxDo/Rmu4u4u4dW8S2906w=
X-Google-Smtp-Source: APXvYqzJdMswDscvxWPNKy12Y1hZaE/fHu30MCc7H6WYWHOBZmhGNSLOz+IZWUO3159cxb2kCjA4cA==
X-Received: by 2002:a63:a350:: with SMTP id v16mr29499781pgn.87.1577102867968;
        Mon, 23 Dec 2019 04:07:47 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:5bb:db1f:d676:5d7d:ed2b])
        by smtp.gmail.com with ESMTPSA id k1sm744312pjl.21.2019.12.23.04.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 04:07:46 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     robh+dt@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] ARM: dts: imx7: Unify temp-grade and speed-grade nodes
Date:   Mon, 23 Dec 2019 09:07:19 -0300
Message-Id: <20191223120719.7448-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following warning is seen when building with W=1:

arch/arm/boot/dts/imx7s.dtsi:551.39-553.7: Warning (unique_unit_address): /soc/aips-bus@30000000/ocotp-ctrl@30350000/temp-grade@10: duplicate unit-address (also used in node /soc/aips-bus@30000000/ocotp-ctrl@30350000/speed-grade@10)

Since temp-grade and speed-grade point to the same node, replace them by
a single one to avoid the duplicate unit-address warning.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Change the node name to fuse-grade (Shawn).

 arch/arm/boot/dts/imx7d.dtsi | 2 +-
 arch/arm/boot/dts/imx7s.dtsi | 9 ++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index d8acd7cc7918..92f6d0c2a74f 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -12,7 +12,7 @@
 			clock-frequency = <996000000>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>;
-			nvmem-cells = <&cpu_speed_grade>;
+			nvmem-cells = <&fuse_grade>;
 			nvmem-cell-names = "speed_grade";
 		};
 
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 139ab9b98472..568d7a984aa6 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -152,8 +152,7 @@
 		interrupt-parent = <&gpc>;
 		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 		fsl,tempmon = <&anatop>;
-		nvmem-cells = <&tempmon_calib>,
-			<&tempmon_temp_grade>;
+		nvmem-cells = <&tempmon_calib>,	<&fuse_grade>;
 		nvmem-cell-names = "calib", "temp_grade";
 		clocks = <&clks IMX7D_PLL_SYS_MAIN_CLK>;
 	};
@@ -548,11 +547,7 @@
 					reg = <0x3c 0x4>;
 				};
 
-				tempmon_temp_grade: temp-grade@10 {
-					reg = <0x10 0x4>;
-				};
-
-				cpu_speed_grade: speed-grade@10 {
+				fuse_grade: fuse-grade@10 {
 					reg = <0x10 0x4>;
 				};
 			};
-- 
2.17.1

