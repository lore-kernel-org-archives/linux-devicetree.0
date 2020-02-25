Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C57C35DE1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 13:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 074A821927
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 13:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgBYNyn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 08:54:43 -0500
Received: from 5.mo2.mail-out.ovh.net ([87.98.181.248]:51879 "EHLO
        5.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729680AbgBYNyn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 08:54:43 -0500
X-Greylist: delayed 3601 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Feb 2020 08:54:42 EST
Received: from player714.ha.ovh.net (unknown [10.110.103.177])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id D50501CC5C8
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 13:39:08 +0100 (CET)
Received: from armadeus.com (lfbn-str-1-551-177.w90-126.abo.wanadoo.fr [90.126.248.177])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player714.ha.ovh.net (Postfix) with ESMTPSA id 6C474FAC9294;
        Tue, 25 Feb 2020 12:39:05 +0000 (UTC)
From:   =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
To:     devicetree@vger.kernel.org
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH 1/1] dt-bindings: arm: fsl: fix APF6Dev compatible
Date:   Tue, 25 Feb 2020 13:39:04 +0100
Message-Id: <20200225123904.14723-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1543608776279807065
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrledvgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucfkpheptddrtddrtddrtddpledtrdduvdeirddvgeekrddujeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedugedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

APF6 Dev compatible is armadeus,imx6dl-apf6dev and not
armadeus,imx6dl-apf6dldev.

Fixes: 3d735471d066 ("dt-bindings: arm: Document Armadeus SoM and Dev boards devicetree binding")
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a8e0b4a813ed..0e17e1f6fb80 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -160,7 +160,7 @@ properties:
         items:
           - enum:
               - armadeus,imx6dl-apf6      # APF6 (Solo) SoM
-              - armadeus,imx6dl-apf6dldev # APF6 (Solo) SoM on APF6Dev board
+              - armadeus,imx6dl-apf6dev   # APF6 (Solo) SoM on APF6Dev board
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.24.1

