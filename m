Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63283C4BA0E
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 11:38:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A21624685
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 11:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TSDY4K1j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgBZLiU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 06:38:20 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34811 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgBZLiS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 06:38:18 -0500
Received: by mail-wm1-f67.google.com with SMTP id i10so3259704wmd.1
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 03:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mQFv2ptApTIAiUn/IDnNgZylYWpvb4JaReKMP2qGRB8=;
        b=TSDY4K1jK4zC8azCDNMC5WXyxnatPyfc/pal1j+EIbnQKW2zaRx9qYncNZj9heQkOO
         JPA+Ec8cjsQg6KPJTGTR298QW22hIk2vO2pSGBmthLDnIMXTxfy4D5uUGGeH/dYYm0ud
         eMcAg3Bu9XFBTe55fTumqTQ3Wa7el+GPollNpMOMT2TW/Qvto6SaX5A8pyz9WNbivBlr
         vFofurtnEsP0LMC65L6LOWe/25tOhrBG5tmt7XQ1Q7ePkCKHLhS3dVhxEPoemgBU+6FQ
         hgqDhOq0ydIzX+XqKIKeRoM+qkoUsa9SbbsP/GG/pObX16rdcmO2HtjTUv2aTs5/gHkc
         +VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mQFv2ptApTIAiUn/IDnNgZylYWpvb4JaReKMP2qGRB8=;
        b=JMqkhKjRw0d5iPWZ6yisEJuCkqG4oprrt3qQJ83i6wxm+7IwVtc60qFnSv0pO1cNFC
         WxpuNtO+k2i0MrOOUIl5DFkd63AFN22mU46+t6wZf42c3LdoMHt1gFq2ELDCLT2W94kJ
         /sz4xYBzlXbdOht/3QZxxmnx/b66/BREUJix6L0S6o3jX5ykH4M+0Q7GN1NbHKh9dTGe
         6dw0J03iLeddcK4lKZqeXOdT3SQKJBGAw8f8SQuY+YInuos8q8ivKlAzaCIDh6zRng5b
         c2ipKUHdVbAeSf6jtdGV10T7dsSocIBuQsVAqsYBIuTNaJO8sikGc1axDxtQPOgaQKz1
         4Vmw==
X-Gm-Message-State: APjAAAXoryRtOEAkvWiyQJgouShooWsprHzZibp2D4zkrdBVWFupqA4N
        0ho3rchPANmH0FVkr8xuUPcqmw==
X-Google-Smtp-Source: APXvYqyak90IvO19aKLILtWxBiJdRlI2XwGyaViPcGIDLyWqQbmhah1/I7K4BB75W9pOuWCAz2jGYQ==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr5369132wmi.25.1582717095791;
        Wed, 26 Feb 2020 03:38:15 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id h13sm3391406wrw.54.2020.02.26.03.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:38:14 -0800 (PST)
Date:   Wed, 26 Feb 2020 11:38:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Adrian Panella <ianchi74@outlook.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: add smb208 support
Message-ID: <20200226113846.GM3494@dell>
References: <20200219163711.479-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219163711.479-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 19 Feb 2020, Ansuel Smith wrote:

> Smb208 regulators are used on some ipq806x soc.
> Add support for it to make it avaiable on some routers
> that use it.
> 
> Signed-off-by: Adrian Panella <ianchi74@outlook.com>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 4 ++++

Acked-by: Lee Jones <lee.jones@linaro.org>

>  drivers/regulator/qcom_rpm-regulator.c             | 9 +++++++++
>  2 files changed, 13 insertions(+)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
