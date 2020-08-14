Return-Path: <SRS0=/1Tz=BY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC9AC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Aug 2020 04:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DCCA20838
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Aug 2020 04:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgHNEpc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Aug 2020 00:45:32 -0400
Received: from smtpbguseast2.qq.com ([54.204.34.130]:40451 "EHLO
        smtpbguseast2.qq.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgHNEpc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Aug 2020 00:45:32 -0400
X-QQ-mid: bizesmtp5t1597380318t1f1liarf
Received: from localhost.localdomain (unknown [119.145.4.99])
        by esmtp6.qq.com (ESMTP) with 
        id ; Fri, 14 Aug 2020 12:45:15 +0800 (CST)
X-QQ-SSF: 01400000008000Z0Z000000A0000000
X-QQ-FEAT: 1McgZlMbu9BJqq2XpRjdKpk8ExDioaLeqi7VCalEkkOnr/N2jbxclOgTmbe7g
        cuvd+TlCvLBvK935aSIfAX2+4AApdAlgYUdPjqiSMSiawr2XV3HafeH7waD8UCqHQh6OOpl
        WVQL2TaVuGAu7oW5PbuKiF+L+ggLqhC9HPaEx3Qm37ZP4r+ahRcF21R7odUAMpcCwjKzfCs
        I6w2GCDklZrteXio2lMGHW2aa03agCj1pTXPKrvkRM9gXqLKUJVZKcgicmq+no+XYq5D3Tj
        cdDef4/A1lDQX2hyreeZxBp7wlqQrWiS9jdPTUauxHlHXnFuRAxJ6pXC3mkb9uO5e/fevL2
        Kz53xOi7WxvDhE/fEETN+2VAaCbA8QVJf8z/uuh
X-QQ-GoodBg: 2
From:   Xingyu Wu <wuxy@bitland.com.cn>
To:     mchehab@kernel.org, robh+dt@kernel.org, davem@davemloft.net,
        sakari.ailus@linux.intel.com, shawnx.tu@intel.com,
        hverkuil-cisco@xs4all.nl, dave.stevenson@raspberrypi.com,
        manivannan.sadhasivam@linaro.org, bingbu.cao@intel.com,
        tfiga@chromium.org, drinkcat@chromium.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     dongchun.zhu@mediatek.com, sj.huang@mediatek.com,
        wuxy@bitland.com.cn, darfur_liu@gcoreinc.com, hao.he7@gmail.com,
        hao.he@bitland.com.cn
Subject: [PATCH V3 1/3] dt-bindings: vendor-prefixes: Add GalaxyCore
Date:   Fri, 14 Aug 2020 12:44:53 +0800
Message-Id: <1597380295-6297-3-git-send-email-wuxy@bitland.com.cn>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597380295-6297-1-git-send-email-wuxy@bitland.com.cn>
References: <1597380295-6297-1-git-send-email-wuxy@bitland.com.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bitland.com.cn:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Hao He <hao.he@bitland.com.cn>

Add vendor prefix for GalaxyCore, Inc.

Signed-off-by: Hao He <hao.he@bitland.com.cn>
Signed-off-by: Xingyu Wu <wuxy@bitland.com.cn>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9aeab66..154d25b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -379,6 +379,8 @@ patternProperties:
     description: Freescale Semiconductor
   "^fujitsu,.*":
     description: Fujitsu Ltd.
+  "^galaxycore,.*":
+    description: GalaxyCore, Inc.
   "^gardena,.*":
     description: GARDENA GmbH
   "^gateworks,.*":
-- 
2.7.4



