Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04228C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 06:49:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC63E20757
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 06:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592203772;
	bh=yjXTSENaHEXOik+BgoWPkjMy3BLdPB1FWyZdAxP7ApU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=LUpY3ICZJMFUnVdh236xNq5Ntc3ktuqDTiLQUSIUhpcl5n40/scMvFz4pXTfoZrxS
	 c25oGv4AlEGWlyNy3BWkQ9f14KGXajX1cercUhR1apwYScsVvL28USpy4xsLGKVgo4
	 jS0dJSoqOzs+kKuj2hmxJwPkAcY6PBnPvvga8AW4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgFOGtS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 02:49:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:59948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728447AbgFOGrN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 15 Jun 2020 02:47:13 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED91C208A9;
        Mon, 15 Jun 2020 06:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592203632;
        bh=yjXTSENaHEXOik+BgoWPkjMy3BLdPB1FWyZdAxP7ApU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D9uF61y75FcarwboE5xFIZSZhYXLgrV2Y4hCRmtGR/Vs6IKLhHPB+pI4OmkbHjMtE
         488kGifAUhf/tP5oi5X4r5le1vIkq7gESoOze27GFoO3o8Rk6gJw7VcOuEJOZQbTnE
         fRrf55JL/eQ+eH9U6ptJWHZCHT3jn2PV4kktv0Gc=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jkith-009nn0-Sg; Mon, 15 Jun 2020 08:47:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org
Subject: [PATCH 15/29] dt: fix reference to olpc,xo1.75-ec.txt
Date:   Mon, 15 Jun 2020 08:46:54 +0200
Message-Id: <d0262854582ee754e4b8bd80677d96b3e098ea5c.1592203542.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592203542.git.mchehab+huawei@kernel.org>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This file was converted and renamed.

Fixes: 7882d822b3f9 ("dt-bindings: spi: Convert spi-pxa2xx to json-schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.txt b/Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.txt
index 8c4d649cdd8f..2d7cdf19a0d0 100644
--- a/Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.txt
+++ b/Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.txt
@@ -8,7 +8,7 @@ The embedded controller requires the SPI controller driver to signal readiness
 to receive a transfer (that is, when TX FIFO contains the response data) by
 strobing the ACK pin with the ready signal. See the "ready-gpios" property of the
 SSP binding as documented in:
-<Documentation/devicetree/bindings/spi/spi-pxa2xx.txt>.
+<Documentation/devicetree/bindings/spi/marvell,mmp2-ssp.yaml>.
 
 Example:
 	&ssp3 {
-- 
2.26.2

