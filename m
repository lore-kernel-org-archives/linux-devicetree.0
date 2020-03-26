Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7235DC2D0ED
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CA7D2076A
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrFV+t4C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgCZRTp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 13:19:45 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44488 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgCZRTp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 13:19:45 -0400
Received: by mail-qk1-f196.google.com with SMTP id j4so7480643qkc.11;
        Thu, 26 Mar 2020 10:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p7bQLCgIYLXK4DQMP7VYY3o870Na9G8sVcbg53M45/k=;
        b=VrFV+t4CLrnRwK+8ZqvSGluOBagbdY9wvhjWx80QuMRBUmerKVR4ALptBbfHY81S/b
         MsjfHPcBPikQP2b6RFe7z6aM7m1Zb7QXBTw+xwlFFI1WmAEXF9vccbzElxgv2ROJb4DW
         VcYyhReUR8niqzzfTp7PEbUAcaJdEBgRE+ubTTKMKUBeynRjg+nHqynsSdMYGHsAqlNU
         F8C/RsPUxKu/GCzkCp3xf03TRQ4dOBHPX8xJxIglHS0lQAJqz5a3NyCjyumRVmWdUNd8
         uQy12035jxerf38iiHhwHepcpQKTUMEE5Yn9Zbuu+MOexFuHt/lCHR3MHh+GW24wsI6/
         0p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p7bQLCgIYLXK4DQMP7VYY3o870Na9G8sVcbg53M45/k=;
        b=aqPrmGj7py9BBNj2ePfWpYbZth9KTQ6ucJn3M8eOJ6vqBPW/MxKpIGbFV9A8CXGTWW
         iizUEGoLns82XPF1X7xc/Mes+oj1Yr4fefFpqiPmC2gh4CqOtuIubSbhcyCIWWYx6IRd
         Pp0cHH0HbXcACn8cbrFo02QGkGL/Q10KQ5ro8lhYp1eJMsmdC/tgFmk1Xs6opfhXKoz3
         DMG2mEdMPIrl03OPZv006P77MUKtUQlWbRnyYdZOfIIYJnZYLq5OVq8G9Qs3BFt+dsze
         LJNYGkBBGD/tFhtsiEBjjwVjAzEATbFUGyXPwTUQiKPWGA8eBV7YYeiQVCYcr2VW+59O
         NUrw==
X-Gm-Message-State: ANhLgQ2vk3jmmYhhOGoCoUIdpkLWtBtjLiV788W1stIKynxh8U3YluE2
        9DppQGkzkmVfUmkrs8TqZc8=
X-Google-Smtp-Source: ADFU+vu1qwf6nPqkkrv7ZqwNe+SoKOvBDAcscTLitoOR5+o/cEXV2P6QBUwDHMHKaL16qBtga6bM9g==
X-Received: by 2002:a37:5044:: with SMTP id e65mr8758105qkb.294.1585243184341;
        Thu, 26 Mar 2020 10:19:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id d2sm1792498qkl.98.2020.03.26.10.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 10:19:43 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, sboyd@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] dt-bindings: imx8mm-clock: Fix the file path
Date:   Thu, 26 Mar 2020 14:19:33 -0300
Message-Id: <20200326171933.13394-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326171933.13394-1-festevam@gmail.com>
References: <20200326171933.13394-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Currently the following warning is seen with 'make dt_binding_check':

Documentation/devicetree/bindings/clock/imx8mm-clock.yaml: $id: relative path/filename doesn't match actual path or filename

Fix it by removing the "bindings" directory from the file path.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/clock/imx8mm-clock.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8mm-clock.yaml b/Documentation/devicetree/bindings/clock/imx8mm-clock.yaml
index f5be181bd21d..ec830db1367b 100644
--- a/Documentation/devicetree/bindings/clock/imx8mm-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mm-clock.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/bindings/clock/imx8mm-clock.yaml#
+$id: http://devicetree.org/schemas/clock/imx8mm-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NXP i.MX8M Mini Clock Control Module Binding
-- 
2.17.1

