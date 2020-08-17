Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B46C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 22:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BF7E20674
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 22:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbgHQWly (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 18:41:54 -0400
Received: from mail.v3.sk ([167.172.186.51]:54350 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728246AbgHQWly (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 17 Aug 2020 18:41:54 -0400
X-Greylist: delayed 464 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Aug 2020 18:41:53 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 656E7DFA54;
        Mon, 17 Aug 2020 22:33:28 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id t-bDxQEXBzGE; Mon, 17 Aug 2020 22:33:22 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id C2BBDDF92E;
        Mon, 17 Aug 2020 22:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id XPR_kNhjw9gr; Mon, 17 Aug 2020 22:33:17 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id E7229DFA54;
        Mon, 17 Aug 2020 22:33:14 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v3 2/3] dt-bindings: phy: Allow BSD licensing of marvell,mmp3-hsic-phy.yaml
Date:   Tue, 18 Aug 2020 00:33:59 +0200
Message-Id: <20200817223400.403505-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817223400.403505-1-lkundrak@v3.sk>
References: <20200817223400.403505-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

I wrote this binding and I'm fine with it being GPL + BSD dual-licensed,
as is recommended for new DT bindings.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Rob Herring <robh@kernel.org>

---
Changes since v2:
- Add Rob's ack

 .../devicetree/bindings/phy/marvell,mmp3-hsic-phy.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/marvell,mmp3-hsic-phy.=
yaml b/Documentation/devicetree/bindings/phy/marvell,mmp3-hsic-phy.yaml
index 30e290c579308..ff255aa4cc103 100644
--- a/Documentation/devicetree/bindings/phy/marvell,mmp3-hsic-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/marvell,mmp3-hsic-phy.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 # Copyright 2019 Lubomir Rintel <lkundrak@v3.sk>
 %YAML 1.2
 ---
--=20
2.26.2

