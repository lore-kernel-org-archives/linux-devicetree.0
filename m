Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2B7C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 07:27:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 473842076E
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 07:27:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNUST13h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbgFZH1X (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 03:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728764AbgFZH1V (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 03:27:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0849C08C5C1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 00:27:21 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e18so4584881pgn.7
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 00:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=EZ4ukNPP7iVf8vF6muxB/o/Srf2rzuTl0wpGGpjxFsM=;
        b=yNUST13hy1+EHsS2sfxk+Rj7MFVtb9pHUJ3ZuX0/lRKXQPpvZvrig6EuZfTDWJ+qke
         mS2zGNJmWT2QfsMus14SCDaf4xdse3am1VGM0br3ydyj4Ov9vgtL86CR7fCudpTiE8ys
         Ci+M6jhRh06570+Mo2IKvLSr9pW+x6gDTDfXoKE1n2S1L6xBMvF7jXSP2xQYl1atO0vT
         lm3XmwkvyR4386nRWGZQg6hZGKAWdELGxM1QX8N8eHsLoA0Q13fbRTeA0iMtJg4kSBm7
         oJBOrAqwZqKn+ptRxOV/EKR/7IOufy9I6tei+eA1AIzseW66Ha2Dp0/RPMdWOlFMypHR
         pEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=EZ4ukNPP7iVf8vF6muxB/o/Srf2rzuTl0wpGGpjxFsM=;
        b=tIf/PEgfUZEm/Jh1/LrCVz/7MKDg4EtYfz8iNfjsn4LpTYh+WTC+M5hQ2wwO6XnXI5
         e1pvAhOQeuhGi33cZ87kB3gttkYzneAf2k5ND6reSoEUSmhgg6axl+K8Yz7TLzdG0XgU
         +5m3ngcJ3zBKvN5ofQIBoe6naoGou4VFEbWbBrGFkInzFEEBAN6+/WeCSVz6FbdrQwiS
         qQCgQLZn95H1Js198He+OeHzV8yNcPSZSidE7CYSc6neyHSQ5nJG9imAdYip59WydVg6
         /tAK0/egbNg/yesQNZpKhXM5ZXVp0j3TCYSMWYaCAnzAnGd1vvmG96U6cKTA75tFQlCK
         wSyQ==
X-Gm-Message-State: AOAM532/PU+rDLHEm3LXaQfYwlcrs0dZmcTewRQ1rQNNeW0z0kjbGBcM
        xLRibyMBjnUQX4dwDy66WOz9PMj7tQ==
X-Google-Smtp-Source: ABdhPJxghrZqKHyTE+bK+1pDhBG1aZE7of6Mvctp26xHfyHYrc39RS2yDT2fHkCmrHl79016pP2nsA==
X-Received: by 2002:a63:2248:: with SMTP id t8mr1576526pgm.113.1593156441147;
        Fri, 26 Jun 2020 00:27:21 -0700 (PDT)
Received: from ?IPv6:2409:4072:8f:e5bc:398d:eac0:43d5:2c47? ([2409:4072:8f:e5bc:398d:eac0:43d5:2c47])
        by smtp.gmail.com with ESMTPSA id k14sm24364377pfk.97.2020.06.26.00.27.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 00:27:20 -0700 (PDT)
Date:   Fri, 26 Jun 2020 12:57:15 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <d54d1fe9d8378e7c44d19e7b366b909bf5dbb7dc.1593112402.git.cristian.ciocaltea@gmail.com>
References: <cover.1593112402.git.cristian.ciocaltea@gmail.com> <d54d1fe9d8378e7c44d19e7b366b909bf5dbb7dc.1593112402.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] MAINTAINERS: Add pinctrl binding entry for Actions Semi S500
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <EDE29F4D-CB0B-4A24-B7B4-01E2C11179A3@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 26 June 2020 1:46:20 AM IST, Cristian Ciocaltea <cristian=2Eciocaltea@g=
mail=2Ecom> wrote:
>Add a pinctrl binding entry for Actions Semi S500=2E
>
>Signed-off-by: Cristian Ciocaltea <cristian=2Eciocaltea@gmail=2Ecom>
>---
> MAINTAINERS | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index e6285c13bab0=2E=2E4b9eec04c937 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -1519,6 +1519,7 @@
>F:	Documentation/devicetree/bindings/clock/actions,owl-cmu=2Etxt
> F:	Documentation/devicetree/bindings/dma/owl-dma=2Etxt
> F:	Documentation/devicetree/bindings/i2c/i2c-owl=2Etxt
> F:	Documentation/devicetree/bindings/mmc/owl-mmc=2Eyaml
>+F:	Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl=2Eyaml

I think we can use wildcard now=2E

pinctrl/actions,*

Thanks,=20
Mani

> F:	Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl=2Etxt
> F:	Documentation/devicetree/bindings/power/actions,owl-sps=2Etxt
> F:	Documentation/devicetree/bindings/timer/actions,owl-timer=2Etxt

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
