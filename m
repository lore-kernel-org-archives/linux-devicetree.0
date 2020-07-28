Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4498CC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 06:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E19420792
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 06:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3iAUbzc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgG1Gdm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 02:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727887AbgG1Gdm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 02:33:42 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2975C061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 23:33:41 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f18so6192391wmc.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+9ymQbKkfvO2y0f7evJNoJIbYaR/0FS5usSf9zZXVSk=;
        b=X3iAUbzcAVC2eGpCBvjCn4obAVo7l+i3+wwa7yIxH/WmhUWBjuFq7hGzz+fvnSyaAB
         quMvdv5Qi/JkmwdW4QFJllKbLYmPkiabffTbT1uJpqUBUcuN3ybpia01rAKe0pviFXV4
         pn9HVSNZVHlsv3vHcTlRyakcLbag1Lm0myAzUxLVBzeNtZXOhdUpyOnKf7eHu1lRJoRL
         2x+BoJIcXgKB2tderQzucrwj5kbuv3/SQl/n4jod67tA0T/Zb6UilZLrfdQyEbHMZpUm
         nOeYxCxqZKOGnK33Na20Pw/+zsJR0JnXZN5Ljy8cM6+CHnL24CTbRFcq1irhI+CCND/x
         J1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+9ymQbKkfvO2y0f7evJNoJIbYaR/0FS5usSf9zZXVSk=;
        b=lfrb58K+FtX2Q3OAv4zfKPrdpD8jTei07LhqESagKQH9iieEHWTst0SIPDu1GkGOZ/
         5ORuEklh1+TUL6G6jsgPGWwH35dqKI/b2tB0GlCOHAx94zRovpepyC/MvBYxs20bfVKr
         l0r3REmbKrW5W2pGz45ayJhYXdsG47tujtnohN/c0uCTzYwhDw71JArGrgsiPGWMBzhc
         TQ3MAGgNdiS+nqxvigVZ3NfkWO4BWdLsWcftfZ5inGWqsnj3/Iw5HK46d5BzTWSnmJm2
         qNCU5GIhEiCUxzGpzVmSrF/u8OamWer1UdbI4Cf0beag7MPh5Ty51jxuyoQVjrukjeRM
         dMTw==
X-Gm-Message-State: AOAM530m9YIDXqI8+q9TjQ/CLxxQrW+0By0+PS9L4Qa0eadQVutqcHm8
        lo3Rx+PnlJaB8EOQutcDY8R4Bg==
X-Google-Smtp-Source: ABdhPJzjVOkrHdjavp13uvCll7m2KDhHn6VDGg3h7jEdKnRlL7BYK4WvIkBkSIt4th7SG9tF/xjpCw==
X-Received: by 2002:a7b:c921:: with SMTP id h1mr2351362wml.29.1595918020669;
        Mon, 27 Jul 2020 23:33:40 -0700 (PDT)
Received: from dell ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id c10sm16074682wro.84.2020.07.27.23.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 23:33:40 -0700 (PDT)
Date:   Tue, 28 Jul 2020 07:33:38 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Josef Friedl <josef.friedl@speed.at>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>
Subject: Re: [PATCH 2/8] dt-bindings: mfd: Add compatible for the MediaTek
 MT6359 PMIC
Message-ID: <20200728063338.GZ1850026@dell>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1595509133-5358-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1595509133-5358-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 23 Jul 2020, Hsin-Hsiung Wang wrote:

> This adds compatible for the MediaTek MT6359 PMIC.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
