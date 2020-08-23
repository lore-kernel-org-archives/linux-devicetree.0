Return-Path: <SRS0=sXX/=CB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A05C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 12:50:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A63972074D
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 12:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgHWMur (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Aug 2020 08:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgHWMur (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 23 Aug 2020 08:50:47 -0400
X-Greylist: delayed 1894 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 23 Aug 2020 05:50:46 PDT
Received: from wp003.webpack.hosteurope.de (wp003.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:840a::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBB1C061573;
        Sun, 23 Aug 2020 05:50:46 -0700 (PDT)
Received: from p200300d06f041cbacebfb77eca04950c.dip0.t-ipconnect.de ([2003:d0:6f04:1cba:cebf:b77e:ca04:950c] helo=localhost.localdomain); authenticated
        by wp003.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1k9oxa-0004Oa-9M; Sun, 23 Aug 2020 14:18:54 +0200
From:   Kurt Kanzenbach <kurt@kmk-computers.de>
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kurt Kanzenbach <kurt@linutronix.de>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, Kurt Kanzenbach <kurt@kmk-computers.de>
Subject: [PATCH] dt-bindings: net: dsa: Fix typo
Date:   Sun, 23 Aug 2020 14:18:36 +0200
Message-Id: <20200823121836.16441-1-kurt@kmk-computers.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;kurt@kmk-computers.de;1598187047;52d4deac;
X-HE-SMSGID: 1k9oxa-0004Oa-9M
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fix spelling mistake documenation -> documentation.

Fixes: 5a18bb14c0f7 ("dt-bindings: net: dsa: Let dsa.txt refer to dsa.yaml")
Signed-off-by: Kurt Kanzenbach <kurt@kmk-computers.de>
---
 Documentation/devicetree/bindings/net/dsa/dsa.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Sorry, missed that earlier.

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.txt b/Documentation/devicetree/bindings/net/dsa/dsa.txt
index bf7328aba330..dab208b5c7c7 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa.txt
+++ b/Documentation/devicetree/bindings/net/dsa/dsa.txt
@@ -1,4 +1,4 @@
 Distributed Switch Architecture Device Tree Bindings
 ----------------------------------------------------
 
-See Documentation/devicetree/bindings/net/dsa/dsa.yaml for the documenation.
+See Documentation/devicetree/bindings/net/dsa/dsa.yaml for the documentation.
-- 
2.26.2

