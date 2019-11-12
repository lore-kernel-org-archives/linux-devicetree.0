Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873F8C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 16:15:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55A37206BB
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 16:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=emlid.com header.i=@emlid.com header.b="vcRCm8S2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKLQPi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 11:15:38 -0500
Received: from forward105o.mail.yandex.net ([37.140.190.183]:42025 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726388AbfKLQPh (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 11:15:37 -0500
Received: from mxback26o.mail.yandex.net (mxback26o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::77])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id B900842009FD;
        Tue, 12 Nov 2019 19:15:34 +0300 (MSK)
Received: from sas2-b0ca3cd64eaa.qloud-c.yandex.net (sas2-b0ca3cd64eaa.qloud-c.yandex.net [2a02:6b8:c14:718c:0:640:b0ca:3cd6])
        by mxback26o.mail.yandex.net (mxback/Yandex) with ESMTP id wAUhPqhFEI-FXme36G9;
        Tue, 12 Nov 2019 19:15:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlid.com; s=mail; t=1573575334;
        bh=R8RCZlzqE9k0pY4Xp9aopkJtnf7AAfND0Zh6ZZKCFJM=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=vcRCm8S27m8pWYTV3RJK/LtB3Uud6Q/XJI1SOuiWKIaBe6KlWLW6ZnlU1MP7qA226
         h+WSTpKznvas7tWZJBFOnpqb1RWRzb8VqpT8mGmKucca9v+gm89DenRwe5HvbfcwGZ
         zFrzF2TIFkrhGZT5cfoAqajnWOa/9XS8uG0IKK0w=
Authentication-Results: mxback26o.mail.yandex.net; dkim=pass header.i=@emlid.com
Received: by sas2-b0ca3cd64eaa.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id xY2rOY0rn4-FWUCQr1N;
        Tue, 12 Nov 2019 19:15:33 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (Client certificate not present)
From:   Georgii Staroselskii <georgii.staroselskii@emlid.com>
To:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Georgii Staroselskii <georgii.staroselskii@emlid.com>
Subject: [PATCH v2 3/3] dt-bindings: arm: sunxi: add Neutis N5H3
Date:   Tue, 12 Nov 2019 19:15:20 +0300
Message-Id: <1573575320-29546-4-git-send-email-georgii.staroselskii@emlid.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573575320-29546-1-git-send-email-georgii.staroselskii@emlid.com>
References: <1573575320-29546-1-git-send-email-georgii.staroselskii@emlid.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds bindings for the new Emlid Neutis N5H3 board.

Signed-off-by: Georgii Staroselskii <georgii.staroselskii@emlid.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 8a1e38a..dd2ac55 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -470,6 +470,12 @@ properties:
           - const: emlid,neutis-n5
           - const: allwinner,sun50i-h5
 
+      - description: Emlid Neutis N5H3 Developper Board
+        items:
+          - const: emlid,neutis-n5h3-devboard
+          - const: emlid,neutis-n5h3
+          - const: allwinner,sun8i-h3
+
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
-- 
2.7.4

