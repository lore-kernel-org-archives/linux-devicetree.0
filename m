Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D925CC2D0C8
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 09:14:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF34A2073B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 09:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7HSxYUq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfLJJOC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 04:14:02 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40871 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfLJJOC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 04:14:02 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so19104575wrn.7
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 01:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=B63WesuGLdNVCzlGVgtcrtdlXTE/3v6MnyY3zv3G9ws=;
        b=b7HSxYUqlLNqzneUOd44nLhL9XHNxJjgPvjEOiqGtXHLAbTh+oIbyz4ZyTIFSTbD64
         DEXWoN/fFGADQVt7fqdLzmTP8esSWiO5Ei3ZjOPzPP4LsmzLaLVODvu1Ct/dQs2lqJRn
         OJC4kM4LIAseN43bh7y4zZcNV6Z1PX07G9T84Z81E1cW0NRaZRWns3iI8C1z0U168sr+
         rJTtcfcj4DNiGsEP3cDtpsZxGYHk6JkOmP/vSbjrQzrPYcCPEN6UPNzILwz9WCXNphvp
         WsYozi0s1G434e6vMqGu8XX1qmVpZ0tLPgDDzv79zDi6M0teZIbYQ76eXhn0veRkZKtP
         u4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=B63WesuGLdNVCzlGVgtcrtdlXTE/3v6MnyY3zv3G9ws=;
        b=bMSX87Z0h3C70Ju8sJnVLuWLGvq4EYNonYKwQ0yOLZoNk4ltVCYhvc6qNkot8pKdXT
         0/exXIUcTfQV5BTMHZFsCf797+MauHKdT4RBPMGMlVmxmRqv8U4yGby5hsDrCI3NFBVa
         9yPMqjwWT11FDWCD036vL3rR7DSBFQqwHEzqwCCXrqYV2MTAo0KIsomEGCHNaV3MDRCz
         vyczOcF+NueWth+HEL5MiSN+2Qy/Gfj8WTBgneQIirEitwEoERSkKz69AR5AuzTHst9v
         r4Io7u/DGddk9DD3ahvX4IFGM0jiajJNfApeUuZyFLotQYv107oRoV3Ql7tzYw06eHe4
         Ml4w==
X-Gm-Message-State: APjAAAW/qehEKj2zPxH816MrodtBLM5+5EAIF/qiDs1f6DY2g66dpzMl
        Gsidz2gOFdw2fXTkaKHLlD1G7w==
X-Google-Smtp-Source: APXvYqxk5k21iFZ4KWmyRAtmnKPgQrcN6gRJTh9ZNTyKlRxVIzHzX8f0yf1RaS4DCqcNR74upbZFPg==
X-Received: by 2002:adf:fe4d:: with SMTP id m13mr1777747wrs.179.1575969238339;
        Tue, 10 Dec 2019 01:13:58 -0800 (PST)
Received: from dell (h185-20-99-176.host.redstation.co.uk. [185.20.99.176])
        by smtp.gmail.com with ESMTPSA id e10sm2305538wma.46.2019.12.10.01.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 01:13:57 -0800 (PST)
Date:   Tue, 10 Dec 2019 09:13:51 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 2/6] mfd: rn5t618: prepare for irq handling
Message-ID: <20191210091351.GS3468@dell>
References: <20191129212045.18325-1-andreas@kemnade.info>
 <20191129212045.18325-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191129212045.18325-3-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 29 Nov 2019, Andreas Kemnade wrote:

> rn5t618 currently lacks irq handling. To prepare implementation

"RN5T618"
"IRQ"

> in a rn5t618-irq.c, move main file to rn5t618-core.c

Why do you *need* to call it "core"?

> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/mfd/Makefile                      | 2 ++
>  drivers/mfd/{rn5t618.c => rn5t618-core.c} | 0
>  2 files changed, 2 insertions(+)
>  rename drivers/mfd/{rn5t618.c => rn5t618-core.c} (100%)
> 
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c1067ea46204..110ea700231b 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -216,6 +216,8 @@ obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
>  obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
>  obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
>  obj-$(CONFIG_MFD_RK808)		+= rk808.o
> +
> +rn5t618-objs			:= rn5t618-core.o
>  obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
>  obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
>  obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
> diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618-core.c
> similarity index 100%
> rename from drivers/mfd/rn5t618.c
> rename to drivers/mfd/rn5t618-core.c

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
