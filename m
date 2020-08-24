Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333D5C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 12:31:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E75BB214F1
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 12:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgHXMbN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 08:31:13 -0400
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:46276 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbgHXMbJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 08:31:09 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 07OCUI8Y028778; Mon, 24 Aug 2020 21:30:18 +0900
X-Iguazu-Qid: 34tKNrBeFlsYit2MDa
X-Iguazu-QSIG: v=2; s=0; t=1598272217; q=34tKNrBeFlsYit2MDa; m=IDpDD6XgE/kTo+BmHwEwEX1+pwpnCwj1l8SxjEgQoSs=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1512) id 07OCUG6K013464;
        Mon, 24 Aug 2020 21:30:17 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx2.toshiba.co.jp  with ESMTP id 07OCUGUS027313;
        Mon, 24 Aug 2020 21:30:16 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc03.toshiba.co.jp  with ESMTP id 07OCUG4p016584;
        Mon, 24 Aug 2020 21:30:16 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 4/8] dt-bindings: arm: toshiba: Add the TMPV7708 RM main board
Date:   Mon, 24 Aug 2020 21:29:53 +0900
X-TSB-HOP: ON
Message-Id: <20200824122957.1392870-5-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add an entry for the Toshiba Visconti TMPV7708 RM main board
(tmpv7708-rm-mbrc) to the board/SoC bindings.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 Documentation/devicetree/bindings/arm/toshiba.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/toshiba.yaml b/Documentation/devicetree/bindings/arm/toshiba.yaml
index efd3f4859669..0e066290238e 100644
--- a/Documentation/devicetree/bindings/arm/toshiba.yaml
+++ b/Documentation/devicetree/bindings/arm/toshiba.yaml
@@ -16,5 +16,7 @@ properties:
     oneOf:
       - description: Visconti5 TMPV7708
         items:
+          - enum:
+              - toshiba,tmpv7708-rm-mbrc  # TMPV7708 RM main board
           - const: toshiba,tmpv7708
 ...
-- 
2.27.0

