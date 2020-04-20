Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01C9C38A30
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 10:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C090D214AF
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 10:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xc9/Hiwg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgDTKIG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 06:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725870AbgDTKIG (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 06:08:06 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51D1C061A0C
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 03:08:04 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d184so320394pfd.4
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BnAC1hbVK6lZpRP0Ydha1Gljhb6wHC7kfdrL2QnVe3Y=;
        b=xc9/HiwgNtxKwEl9kNuhFcDrZtg4ATTKgCsGx+X/7B9TAY/qx0kUN8eWvQzztM2YoG
         yjs8sgJOWhuwViY0IjbHuX8yJC5TmgYcPEMksn6wXFcwZbPIyplQBevcEQDaLr7FXhUv
         9DyUJQHKCJAZvK5ukXfCqS4i6ISSzPGKVzV/nw4Fi+hUFThT+TpkwrP4nhhqiMLPOyQ4
         Fk1o3rbJTbFveetwXmnY6kwCbjUuZurU2hUfi6PPJg4Lxg8iwYQr/RUlFk++nr/dbRnP
         L6IBrv7U80ImkIzMUmoS/+NwTx84jUSTE+i4lIUUKREbUskv4n5CTmkk8Pq+7DDNVe9t
         QVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BnAC1hbVK6lZpRP0Ydha1Gljhb6wHC7kfdrL2QnVe3Y=;
        b=JFa9hnkF1+8WrnETsO76yI0Kwl8hF5zPVWXkImFKx8LI+Foecv2CCM9hj0LotD1S+Y
         AvkGZgylJJoFynx3MMTO1EQfEuUxldQC7WTAOS3bVnOF0hrRGCypueYz7f6Y2ohWWg73
         IZY3Bwda2N/ob/evWI07XsqyiE3QJf/HphiD3uF/jRUN3cVBswy6ho2i4s4yymZBKQsi
         GHjrj1tpGuaAzlpzGzz6Rfw9BsF24qPWOlMWBb76Hf7zqZ3CJok9X/lhXJ8HKhORPaj/
         GdQyeGkvVnD4bvHvbtw1ADkK5qov7YGfuUhtmF0Ms13eRRa+5h52GJl0nNIlYo8anteu
         wriQ==
X-Gm-Message-State: AGi0PuYSPdPl1dtJrPyK2ATUljsMA+atzQQlArJNUsMrmsQA9SEnmTOR
        L1DbpRYZ4L/eJJEwcoNZ0ViBkA==
X-Google-Smtp-Source: APiQypINB3tIGNy5nKYAXVoh1nU6G/P+BmATCOUamr3GuOstIVxTWm0RI7LtZqnTrDDEC/ImaepLCA==
X-Received: by 2002:aa7:9690:: with SMTP id f16mr3469930pfk.20.1587377284109;
        Mon, 20 Apr 2020 03:08:04 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id o15sm728045pgj.60.2020.04.20.03.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 03:08:03 -0700 (PDT)
Date:   Mon, 20 Apr 2020 19:07:41 +0900
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: Add Akebi96 board support
Message-Id: <20200420190741.c029df34dd1354fa146a28bc@linaro.org>
In-Reply-To: <158737719165.27947.6617937231903079086.stgit@localhost>
References: <158737719165.27947.6617937231903079086.stgit@localhost>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add uniphier-ld20-akebi96 compatible string for
Akebi96 board support.

Signed-off-by: Masami Hiramatsu <masami.hiramatsu@linaro.org>
---
 .../bindings/arm/socionext/uniphier.yaml           |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
index 65ad6d8a3c99..10a7f0752281 100644
--- a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
@@ -51,6 +51,7 @@ properties:
       - description: LD20 SoC boards
         items:
           - enum:
+            - socionext,uniphier-ld20-akebi96
             - socionext,uniphier-ld20-global
             - socionext,uniphier-ld20-ref
           - const: socionext,uniphier-ld20

