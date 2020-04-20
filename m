Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F09C3A5A0
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 15:05:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B16C2206F9
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 15:05:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3KiqEeM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgDTPFB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 11:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgDTPFB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Apr 2020 11:05:01 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED733C061A0C
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 08:05:00 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id o185so4648978pgo.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BnAC1hbVK6lZpRP0Ydha1Gljhb6wHC7kfdrL2QnVe3Y=;
        b=E3KiqEeMNMWXjOY86zWQ+SJbe/EV75pNxuyiCRa9V/QoLXhuy1nV+6JAjrnMmI6Xqs
         XIlrNn3LFcWX+HIvOA4F7Cgu0dhDkwJsojSREH7K4cP1yddMTn98TG7euqDqT3lJe8FC
         5N7POmx6oQG+b3Lyypw3zsqKP8Tt1041fSdsxvpxm78Nt5WpPDf0kpjZbyNwKYkCA6DI
         i7UhklT5NHlAGYOj7V7TOL2GEJKsJqwj1G5oOmEXr+nilVNxjM6lCLK2gbYPSGuTAZrW
         2bkfeh1tT09YbTYjlfPQDbwQHGgc5KI4oVRdkHGsPASnPJp9cjl1esH8iRuNm6kWwKkn
         K4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BnAC1hbVK6lZpRP0Ydha1Gljhb6wHC7kfdrL2QnVe3Y=;
        b=LkcpYiPRqafTO11cQSeckaMekiEt1cv4G0585cX5/AiXtU4YNUYG4qNoj4JeBK39Pq
         BDItSSfP+UPa8Yglq7QGuy7+bfMxIyscE8k7/6kzlL99589mNtGkpv03mY0zXd8vaBta
         Jy0bL6U2GORQnl8AYI9II9i727jYPhATxVAkv6B5CdSmjAYJ77hrY/n2KwEwuRkxpVhT
         sFgYHO6aKENFe7Z6hn1qBeUnb4vrm4S61bbU0PTDbePk4RbZHI3a7z+X9O6O2d/1M4MK
         sZBgF/EQakBZy+E0AJiUfzCSF1mfJdHdpgCc9SDBtnN4zy7UHNj9SzwwVXQDo5Gp2mt2
         pvEA==
X-Gm-Message-State: AGi0PuaeaVt/hvLd9Qf4uBG8LGDMHrOxF5fWHNOZupnfOZuH42O65bjd
        VRCiZbHhwaIaMxbJB+VO9yA9Lg==
X-Google-Smtp-Source: APiQypLXklp32VpbsjHEnZh5I5LMLorLcZPCZFnH3O+mJh4qCVP+WaPF53xMIRTC6QVXYJbcmYaVgg==
X-Received: by 2002:a63:d510:: with SMTP id c16mr17342560pgg.123.1587395099883;
        Mon, 20 Apr 2020 08:04:59 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id 127sm1362710pfw.72.2020.04.20.08.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:04:59 -0700 (PDT)
Date:   Tue, 21 Apr 2020 00:04:30 +0900
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: arm: Add Akebi96 board support
Message-Id: <20200421000430.01d85f8cf21341fad2df4a8f@linaro.org>
In-Reply-To: <158739384071.13351.3677427677984201111.stgit@localhost>
References: <158739384071.13351.3677427677984201111.stgit@localhost>
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

