Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E41C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:34:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C01720672
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:34:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuDp9scE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732483AbgF2Uel (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 16:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731843AbgF2TXv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 15:23:51 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B03DC061755
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 12:23:51 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id x62so13766918qtd.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=d9BGVshqPZNqtsgKezZ53Dstz56cRP9gTsU+AsUUoSE=;
        b=BuDp9scEtuO1UJpKqW/ythg98OIq5vdZki8GlPCelrABvX/khclaPEaiZfheOQSEiE
         D6JsqeBYl84apl8SpaiH3vk4zkPQEsB90dOnrfGVPVjzdZ9wwEhnX0Lh2kbR4CbZfHvX
         ZoaVvg7/3vQ+JJVg1i7EpK0TbwUj5WcArH0RJ0rzkxUYr7Ar+NfLPlLBlf+Ndq8AqvcW
         sSmmfeYK5TNFwLnjxZUS2DmFgE9ASF4NKx2QYA1ux9sSktYCWLD9wvnexM6hnRWM8wK3
         xL4ua/YV/K20OhRpSryUuksrGH0tbHlZTv1q4I8ZpyHu3na7M203eyfjkglQys+hlo39
         dWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=d9BGVshqPZNqtsgKezZ53Dstz56cRP9gTsU+AsUUoSE=;
        b=ewWmkw9oKEUp1EqORqE+uDbFuvVW6KynaUJuxCB3ECSUCoxxoqpddPlYcJxTS0hfjn
         9yiCRMiGBqCr9OY9Ofsyt66Wt4rGrHL66yp5qamOQIxxYW7WTqxzmGf+CdZjHBAIye/x
         GpfSFUWwrcC2fmpCVBsE/4VFrYVSGM8djAhEyN21mvmTRUB8/Tzq1CPOQCYO6B54QoEN
         IJIyye4EuJaCUTutHLod/zu1q4iaiZatt0GYW5ZJPErM/GL+7zHCcAZ4SZfnNkeI8iHm
         q3PRwekI4at9CuIgjo9i+wY3pysmRNUJC3zJtPKNWWB/awUj5YZ0O0CsgiQRH+XntR86
         uIRw==
X-Gm-Message-State: AOAM531OksSzdD7wO6xWkw0CsY/4f8cWeX9uoAlm+CxACl/Pz4nQuQDq
        /cX1pbrJD2chzDqFIN6QOLQ=
X-Google-Smtp-Source: ABdhPJwguGXCUEabIqEKOZqBAu7shyV6rh3WVKAjPnyVkpustWXuW+JRfsTFjz4K+juOnurNv2vpxw==
X-Received: by 2002:ac8:4f50:: with SMTP id i16mr2010185qtw.216.1593458630427;
        Mon, 29 Jun 2020 12:23:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:9524:444f:ca0e:d637])
        by smtp.gmail.com with ESMTPSA id w11sm737122qtk.35.2020.06.29.12.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 12:23:49 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     robh+dt@kernel.org
Cc:     lee.jones@linaro.org, benjamin.gaignard@st.com,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [RFC] dt-bindings: mfd: st,stmfx: Remove extra additionalProperties
Date:   Mon, 29 Jun 2020 16:23:35 -0300
Message-Id: <20200629192335.24622-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following build error is seen with 'make dt_binding_check':

  CHKDT   Documentation/devicetree/bindings/mfd/st,stmfx.yaml
/home/fabio/linux-next/Documentation/devicetree/bindings/mfd/st,stmfx.yaml: properties:pinctrl:patternProperties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'additionalProperties'

Remove the extra 'additionalProperties' to pass the build.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/mfd/st,stmfx.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
index 0ce56a0da553..bed22d4abffb 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
@@ -73,8 +73,6 @@ properties:
           output-high: true
           output-low: true
 
-      additionalProperties: false
-
     additionalProperties: false
 
     required:
-- 
2.17.1

