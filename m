Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587E5C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 20:22:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD1D724655
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 20:22:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=email.cz header.i=@email.cz header.b="Er680Q11"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgAVUW2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 15:22:28 -0500
Received: from mxc1.seznam.cz ([77.75.79.23]:18020 "EHLO mxc1.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbgAVUW2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jan 2020 15:22:28 -0500
X-Greylist: delayed 705 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Jan 2020 15:22:27 EST
Received: from email.seznam.cz
        by email-smtpc20a.ko.seznam.cz (email-smtpc20a.ko.seznam.cz [10.53.18.24])
        id 66b44ba79840f90d663ac5bf;
        Wed, 22 Jan 2020 21:22:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
        t=1579724545; bh=4G90RmNFQBstBDHrKamCLZJF+YYUQqGqLsWIV4YjY00=;
        h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
         Content-Type:Content-Transfer-Encoding;
        b=Er680Q11CpYspzkLnfTar63cUGeH1Oq9KyJKk56Cxk6ITvxNjYDZhqyCyDd5QwlpV
         T0Lu5TQosB5qHQYe+P3k5XFAR1WUzTIExkpDvO/sHxWNDCyTvdK7JLsPMARYDYLjor
         0f4cTc2kctAJ9SlXFUZARy5Ch6i1n0alo50CosbI=
Received: from unknown ([::ffff:82.144.143.34])
        by email.seznam.cz (szn-ebox-4.5.387) with HTTP;
        Wed, 22 Jan 2020 21:10:39 +0100 (CET)
From:   "Tomas Paukrt" <tomaspaukrt@email.cz>
To:     <devicetree@vger.kernel.org>
Subject: [PATCH] dt-bindings: mmc: omap-hsmmc: Fix SDIO interrupt
Date:   Wed, 22 Jan 2020 21:10:39 +0100 (CET)
Message-Id: <SaB.ZWWp.2HlNFL4wfl{.1UAAm}@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.0.46)
X-Mailer: szn-ebox-4.5.387
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SDIO interrupt must be specified correctly as IRQ_TYPE_LEVEL_LOW instead o=
f GPIO_ACTIVE_LOW.

Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 Documentation/devicetree/bindings/mmc/ti-omap-hsmmc.txt      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/ti-omap-hsmmc.txt b/Doc=
umentation/devicetree/bindings/mmc/ti-omap-hsmmc.txt
index 19f5508..4a9145e 100644
--- a/Documentation/devicetree/bindings/mmc/ti-omap-hsmmc.txt
+++ b/Documentation/devicetree/bindings/mmc/ti-omap-hsmmc.txt
@@ -124,7 +124,7 @@ not every application needs SDIO irq, e.g. MMC cards.=

 		pinctrl-1 =3D <&mmc1_idle>;
 		pinctrl-2 =3D <&mmc1_sleep>;
 		...
-		interrupts-extended =3D <&intc 64 &gpio2 28 GPIO_ACTIVE_LOW>;
+		interrupts-extended =3D <&intc 64 &gpio2 28 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	mmc1_idle : pinmux_cirq_pin {
-- 
1.7.9.5
