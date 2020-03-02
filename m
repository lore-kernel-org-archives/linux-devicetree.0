Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6C4C3F2D8
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 11:54:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 502A724677
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 11:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6j9t0b6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgCBLx7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 06:53:59 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52068 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbgCBLx6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 06:53:58 -0500
Received: by mail-wm1-f65.google.com with SMTP id a132so841715wme.1
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 03:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=azUAbwec9h/nTfVaFPcgmhe6fEkHKvdkY4Og3qBi37Y=;
        b=r6j9t0b6YVsKN35LyP/H5lUyKRUrdC0WhAe7pyoL9zqxJsdyHeGhs2X3RPXsG77ucE
         jE/L3lSF6Wv872Mzbni4tCKo2Uf/J5FiErTEvIguKLvUeYhUGNPKhhpaGFNRNrWGk+f2
         1QjGeQADib8veuFWed0VG38BvxD1/BlcZKNZvBoIdZaKVu4tpxIefsYEaasn1pXrO6pw
         1IS1EFDyfxBfwjF3zBykGgdaT4Xa+9qN7Hg+f7ZRYZZU9a6HuY5nByYkE4VPQwAGEqOh
         HGZj0HxfvbruJPh91RNIa+cmcx57q78ersUThwaD49igmWlsnmeX5r7Lhm6Fksn6cv6m
         AmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=azUAbwec9h/nTfVaFPcgmhe6fEkHKvdkY4Og3qBi37Y=;
        b=njmvg/Y3yhM1jxd5s2QKW8MIXJdyAuuX+VEWUunXYrXFG3FN5TYrTMW1uxRYSN/8ZG
         9+2M0KG80BwDD0NBADlQed0OEekNRDbdzSO7dj2uPSH5Rwv+awvRVvxPv79YvONrurjr
         ikpdUq1mOEr3AjgZR1FEA3L1zXcQiYGsqFizysz/Djde+WlT2PTvLav5X7eQH/+Ek9bi
         nRviyfgdo+iE9295igop/RHXbgZ+P+nMnqvZ5SCj0stMYwTtrGTkv9vXpK7LpAj8w1QU
         FOWwtbUo+uJ9NsFbgWy528SJ9O6hmJjw72OeR2dI4YiGRljaOuA1Z5SxWzmcRewOiUyg
         iYog==
X-Gm-Message-State: APjAAAVNiyqOk7sCFCygnPKdS7V+G8COosIUSBLuu+T6ExS59xWicj8B
        l70G/eNDNOwZPc8cYvgWfWqAIQ==
X-Google-Smtp-Source: APXvYqynY+onBCIIhC4P/zjfJVC1tFcUN36uleAbHJTeNOVBp0N74P2fBTF9cu3aqLEh5sEG98Rv7w==
X-Received: by 2002:a1c:9d85:: with SMTP id g127mr19364122wme.75.1583150036591;
        Mon, 02 Mar 2020 03:53:56 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id j5sm27954117wrx.56.2020.03.02.03.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 03:53:55 -0800 (PST)
Date:   Mon, 2 Mar 2020 11:54:32 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 02/12] docs: dt: convert usage-model.txt to ReST
Message-ID: <20200302115432.GX3494@dell>
References: <cover.1583135507.git.mchehab+huawei@kernel.org>
 <0432bc8cdb6abb8618eac89d68db7441b613106d.1583135507.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0432bc8cdb6abb8618eac89d68db7441b613106d.1583135507.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 02 Mar 2020, Mauro Carvalho Chehab wrote:

> - Add a SPDX header;
> - Adjust document title;
> - Use footnoote markups;
> - Some whitespace fixes and new line breaks;
> - Mark literal blocks as such;
> - Add it to devicetree/index.rst.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/index.rst            |  1 +
>  Documentation/devicetree/of_unittest.txt      |  2 +-
>  .../{usage-model.txt => usage-model.rst}      | 35 +++++++++++--------

>  include/linux/mfd/core.h                      |  2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  4 files changed, 23 insertions(+), 17 deletions(-)
>  rename Documentation/devicetree/{usage-model.txt => usage-model.rst} (97%)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
