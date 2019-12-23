Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DF1C2D0D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 03:07:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39F3520684
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 03:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577070425;
	bh=tGKbfl4nYGrpKIa7XUFcKI6UndQrGfcsMQv6v2wYn+w=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=0xy6fQWtX7v8UhnuP4rPXRv0s8AzmCm3EaCPeLyWsG/+5LefE9MB5VAZ2m2ZUQbdu
	 liFZoXcyis/aO2+xhTS+SdPfEAXRXfQk2UCwkEPKmflrwUha7+n8WZAjnq/RsfJllJ
	 4/N8Qd+ic3+PLJYROwjXBldh7Xq4SAsLsJgeUPTo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfLWDHE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 22:07:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:55412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbfLWDHE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 22 Dec 2019 22:07:04 -0500
Received: from localhost.localdomain (unknown [180.106.222.238])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64A1D2067C;
        Mon, 23 Dec 2019 03:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577070424;
        bh=tGKbfl4nYGrpKIa7XUFcKI6UndQrGfcsMQv6v2wYn+w=;
        h=From:To:Cc:Subject:Date:From;
        b=GzISkFog5/WYeLvQ6e67aPyPLaYVJi9UQ++LfgRVU4St0TSUfomA/94/uqYIbTXHN
         qYAln6E/rrLnFBFYhUtlL4EhDfihUCZgT/TCTcRoLYS0kH1UTadC1IX63CSj3snuIR
         3+qvqGD/l+5GK7Q7hUoohObyHM4LBHbRndWOyb9U=
From:   Shawn Guo <shawnguo@kernel.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] bindings: fsl: document compatibles of lx2160a boards
Date:   Mon, 23 Dec 2019 11:05:09 +0800
Message-Id: <20191223030509.13298-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.18.0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The lx2160a board compatibles "fsl,lx2160a-qds" and "fsl,lx2160a-rdb"
have been in use.  Let's document them.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6f241a3b5a20..ee538f3a7f4d 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -389,6 +389,13 @@ properties:
               - fsl,ls2088a-rdb
           - const: fsl,ls2088a
 
+      - description: LX2160A based Boards
+        items:
+          - enum:
+              - fsl,lx2160a-qds
+              - fsl,lx2160a-rdb
+          - const: fsl,lx2160a
+
       - description: S32V234 based Boards
         items:
           - enum:
-- 
2.18.0

