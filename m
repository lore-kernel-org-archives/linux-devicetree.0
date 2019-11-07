Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A15FA372C
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 02:25:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C72BC2187F
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 02:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573093506;
	bh=25afI6HwHj61Dhp9v6w4ks1wDMy72e4vBBSfkFNSirk=;
	h=From:To:Subject:Date:List-ID:From;
	b=kdMN99EbexHgLlWbfE6HWlhIT/q54Fz5h7UHRIOq1J0qtGuxhtAWRVnPfKDpGKJdg
	 Tg5/1gZgQBX2gMOblK5czrnnCpvXSJmTIslDoFVUDzEWMOZuealHo+F5qI93dqfcDJ
	 qmZ2okxH8NyOFAEOcjPYAowxTW1Q1RxbiSoxfpzY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbfKGCZG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 21:25:06 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45886 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbfKGCZG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 21:25:06 -0500
Received: by mail-ot1-f66.google.com with SMTP id r24so634607otk.12
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 18:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/4OHW5TgomfDgMYEC8awhLrQ/oHiIOLYWaTH+ea5ADU=;
        b=QdpEg8icNlWWdaMi4DXqhrxhCZI8VPPWrFMxBcfyi76Iwm8wOkgDtb83qTL0qiv0SX
         kdVUr81Rd6SJ3+b8eAvVaPlN1NxwBk+qHeiYCIbJu/F9J1Z9FHQiXCmdNUGBKlj+wDC+
         6OOafQUTfyDZxcL3AG4G829NAOjikrQgV4XjyNEQUhoFns4eT3Dd5VlTb6XlXbLyRLbR
         ysxHrs33Tqh6avwZwfEnanLee6T/xRDpOjVu8zlYpBqfdzH0cB5/eYerTYDRd7Zut7bz
         2RNmNwscTrIA3vfpCKxv7RwwAZgA5dWBcG9lviyrQsAeIJE8zQvehrUXzXL+kOMZoBOx
         2jAA==
X-Gm-Message-State: APjAAAVRXhIyvVhNjqgE022hg0bBYfdgtXHpATNYJv4HbJg59gb5iBPc
        o6CzyXj4YZlB636w+tlfMTfu2m4=
X-Google-Smtp-Source: APXvYqyGwhhGaVOpdW/vvKtHcuK0Zf9tyI6pPldmM7tvu3ua554fDkxXT/2vlWyAfVi+M8IkY+cFlg==
X-Received: by 2002:a9d:de6:: with SMTP id 93mr736745ots.27.1573093504853;
        Wed, 06 Nov 2019 18:25:04 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id e88sm309270ote.39.2019.11.06.18.25.04
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 18:25:04 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: example-schema: Standard unit should be microvolt not microvolts
Date:   Wed,  6 Nov 2019 20:25:03 -0600
Message-Id: <20191107022503.7899-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Even the DT maintainer gets confused. The schema in dt-schema was wrong
too, so this was passing validation until trying to add some common
incorrect patterns to check.

Fixes: 58fbe999ff40 ("dt-bindings: example-schema: Add some additional examples and commentary")
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/example-schema.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index f27ad5c90353..4ddcf709cc3c 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -160,7 +160,7 @@ properties:
           - enum: [ foo, bar ]
           - enum: [ baz, boo ]
 
-  vendor,property-in-standard-units-microvolts:
+  vendor,property-in-standard-units-microvolt:
     description: Vendor specific properties having a standard unit suffix
       don't need a type.
     enum: [ 100, 200, 300 ]
-- 
2.20.1

