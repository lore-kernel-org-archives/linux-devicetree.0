Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1266CC11D05
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 13:37:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA53920658
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 13:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qRt7DBLZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgBTNhQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 08:37:16 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40591 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbgBTNhQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Feb 2020 08:37:16 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so2065453wmi.5
        for <devicetree@vger.kernel.org>; Thu, 20 Feb 2020 05:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=B4PLo7ULnoL8yyxNbBuvmhizTKdxVbJiDyyciEc36Lc=;
        b=qRt7DBLZBTVQjM1tmi4ELDLZ8ufVlBTbCqFqtzgJ9BHN030AEdAoh3uAIzOzj+XaUd
         qGcHTGaeJ7u4Pl392ptxOLZvSLUN/rNczq8f87EnApfyE1oEpsNf6NjIsXHqF5fGolJt
         QkIOU219N8LG8XCiKD7oZMb9rtkxOVG3H8u73O9Su5KwaQHYtYxU+uwx5d1PfHUk9kc5
         dy02FIlFosCGGi/uUmJmptrHNTYXjJqRw/xpzmM/yU0dNMmX7r9ys4t1FYLo2qQGTxo7
         lvREku+RWOMk7LtwEikUgSNvEUKxKzpKZdJ6jhDJXqKFqIdOkdeDSou4B6vHcWhVnOf8
         9tPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=B4PLo7ULnoL8yyxNbBuvmhizTKdxVbJiDyyciEc36Lc=;
        b=ZgmBDk5919Af6sfIe684OOeFk+gxEuJn91DGIq46UGlcRBRRs4aKTlk7c6aZgQTCmY
         kwUXsqQYapzDrl68Z3+Ktmh6k8FwfSOaCwPUnXu2UCOt6wbpxtj8vCOUh4LhtaLskS+F
         N63TEDjKbI4aWltyfezLzm6kxU9LeuB4PuH7xkF0GOwD08h2xwuWHjMPX/G9ygU4XMa5
         m2fSuHlQvbFtjAA/fZ9y+ECPZ9qquvPz4MZsHagK7epEpFJkVeNL5JPxlCk3wZf+6+F5
         o1hBU5/bSy5+CyW5JQdlXtlFuN3nCxqAxQmD3+0sgiFxp6dWAfWUaundQkTZqvp/bkYR
         2Ogw==
X-Gm-Message-State: APjAAAUPHfA4oJlMOuPDAoSk2U/2I0Z+ELxcxapz2PjjKyelwgeRrKe4
        VifV2dzErYqLAWpeqpBvGFGvig==
X-Google-Smtp-Source: APXvYqxeEECe1zPsmH3M53hHGcqRTpW593ckp3/6EuRcU0KckGtsaWYA5KUQiu8gYOO5hhf+lwdcPg==
X-Received: by 2002:a05:600c:2c44:: with SMTP id r4mr4567137wmg.140.1582205833995;
        Thu, 20 Feb 2020 05:37:13 -0800 (PST)
Received: from dell (89-145-231-170.xdsl.murphx.net. [89.145.231.170])
        by smtp.gmail.com with ESMTPSA id u14sm4551648wrm.51.2020.02.20.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 05:37:13 -0800 (PST)
Date:   Thu, 20 Feb 2020 13:37:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, tglx@linutronix.de,
        fabrice.gasnier@st.com, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mfd: stm32: Add defines to be used for clkevent
 purpose
Message-ID: <20200220133739.GG3494@dell>
References: <20200217134546.14562-1-benjamin.gaignard@st.com>
 <20200217134546.14562-3-benjamin.gaignard@st.com>
 <e9f7eaac-5b61-1662-2ae1-924d126e6a97@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9f7eaac-5b61-1662-2ae1-924d126e6a97@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 20 Feb 2020, Daniel Lezcano wrote:

> 
> Hi Lee,
> 
> On 17/02/2020 14:45, Benjamin Gaignard wrote:
> > Add defines to be able to enable/clear irq and configure one shot mode.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> 
> Are you fine if I pick this patch with the series?

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
