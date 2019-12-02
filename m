Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0FEC432C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:13:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F6412084F
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhTgliPE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbfLBNNE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 08:13:04 -0500
Received: from mail-qt1-f170.google.com ([209.85.160.170]:46503 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfLBNNE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 08:13:04 -0500
Received: by mail-qt1-f170.google.com with SMTP id 38so5333755qtb.13
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 05:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ILsbkWyEUpe5k1jgYQVoQ+1hggPYkj8GB9hKLvJCPIc=;
        b=GhTgliPEhfl+lmllKol5KPzzrhoA4qSpUltHr0hCVpna4jzwntn/PAPEsmYa80jqdz
         +3+nzXYOEvMrwSRITrRoju2c3MOwTGTwwm/eldnaLTk3AeHEi5grDZ97VvBYu//Yv9Db
         AjaOBud7RdMBtWoAiSoQ2bk0ADB6Aqli2NGELLxYyTa2zWDv1WV9dcY+NecTmpw4NHpT
         KKrdnsNU+IqAxo9lYggVfhA8VN6C54WEMRet5NqDt6096FgFPqkAxJ4zSVNXi4Jz+V7C
         Va03riVDE22EDT4Z5qiySxyXP2/dWxDrvHUKlsJ8wKOBfNkGqAU8Q1dpQBl0I7j+k3CO
         qfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ILsbkWyEUpe5k1jgYQVoQ+1hggPYkj8GB9hKLvJCPIc=;
        b=W8aemrf4bV2dhY3vteNgGxv4934WCnJcQOkaHBkcZZH+0Qz+hh5ZmJ2p2/zd4tHH0O
         KqPF5E3MAUL2JV+pZ7So7PVJX5QrvHulluSCIgOGBCUHJA12z8xG97otDhvGcqaFvqgy
         Ym0EgeZ8usnAfoIw145CzsNdgghiWbmMqdVYizsRnbyjRQ4FLifdb/tN3h3av5NhHQjH
         JEn8q/gep3U7HIu2oGYzJ7wEJUbLuAe3xBuRMXdkkh+Fek48d+LUrwb7xQPXfB1UL8l1
         O6siGZdg7Cj0+b8uL4cYYfcRFctyGGYp2WrLzuoTfI0wPSkSGoZMFA14227z76bMxEjT
         ko4w==
X-Gm-Message-State: APjAAAUWCzdtQFFpWn9fAViDvQB3GkUKTadZ4Qw4GR858qBB3ynmXcML
        jmYXkheqRAgLErnDL/A29DQ=
X-Google-Smtp-Source: APXvYqwnkYYxhhPDxgh0V3hGM/8c9gN1A/GxyH0icE0kcTYmssvIYDqsIMGOrjtHsUIMahzTrtmR4g==
X-Received: by 2002:ac8:22c4:: with SMTP id g4mr66408284qta.45.1575292382916;
        Mon, 02 Dec 2019 05:13:02 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id x8sm14170893qki.60.2019.12.02.05.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 05:13:02 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 RESEND 1/2] dt-bindings: arm: fsl: Document i.MX7ULP Embedded Artists COM board
Date:   Mon,  2 Dec 2019 10:13:17 -0300
Message-Id: <20191202131318.11404-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add an entry for the Embedded Artists i.MX7ULP COM board.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b08ae59cc57f..e75f03bf8fbb 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -234,6 +234,7 @@ properties:
       - description: i.MX7ULP based Boards
         items:
           - enum:
+              - ea,imx7ulp-com           # i.MX7ULP Embedded Artists COM Board
               - fsl,imx7ulp-evk           # i.MX7ULP Evaluation Kit
           - const: fsl,imx7ulp
 
-- 
2.17.1

