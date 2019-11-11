Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDA8C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 09:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7115720674
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 09:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0EvthUF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKKJVI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 04:21:08 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44302 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfKKJVH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 04:21:07 -0500
Received: by mail-wr1-f65.google.com with SMTP id f2so13698503wrs.11
        for <devicetree@vger.kernel.org>; Mon, 11 Nov 2019 01:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7RU6yOrYbiYAtxRWuwt9fOb/9lrG5c5lBPALy2kT70c=;
        b=Z0EvthUFScBMeRxMopFucQK2FgEVtsxiKKG1vXP/zP+bdEmqI0f4LwOFLVKjWkwJkp
         pQ7hcTx7T8d4SkRbGFPLwiAnFhzCkeACnhMS223qEcbW60+9B2YHN7BQ8ZPnZ3/I9t69
         inSWcwSotzEzJs5HjXJ3rZ9/UILqNh/xSF1KD1kWbPfOdWLXYgdCA1tAmfrbHXyXHS87
         PD2HJ1nFC3Jh0ZQCtDvT04QZ/yUR8avsywhE9g1/L1VKBWW+UwbRwGaKqryjq765E8RO
         Q031N+gzb1VuuhzME3cXV6fvRKcALc+pvu8wnviGgH75MTYf8t/1aDFgsjm80iTV+LW9
         /Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7RU6yOrYbiYAtxRWuwt9fOb/9lrG5c5lBPALy2kT70c=;
        b=iWLCMOmUAlLgJ4W6TiqtBtx05+44VcAv0poObtqYjdPc3aS/5XZ/Uh0TMeomwzAzw5
         BjWK2u2yREnBZXgyozLalOdww/lJpx64nuzTeQnXZh0CU2ZCUDOnsfDe1Zafz/57pL/L
         8hyEo8L+cCdDyiaIHmZWx5kNOnI2ZdkLwFu3tNmgxK7eKf4ueOhLdaAIaTjRLVOUQuNw
         O1PrIvCJ+3SG5VM7ueOsHpbyrABuoR2M182PIiTP+0axMXcS2SRUob6Fkeqieova6lQI
         TvQvPG03jC3A8baOEWenmYDXrL1d+5L4R5SVnAq4G8Zzyel7FX3+6VqteDV5OaIQcL4P
         QHYw==
X-Gm-Message-State: APjAAAXc5r7ljyl/JQ8Dhg84RtX7BtkSLZbTQoSUj68+cZT3Y3iERGwI
        XlyymorkLa7JFtBuFJANmWqb2g==
X-Google-Smtp-Source: APXvYqztxlDFod/h0lSkGcnEZR3WMMtBryzjzlBSv5fmAd4Pn8ODaGZIKngLB14g9AD2Z58DliP3BA==
X-Received: by 2002:a05:6000:104:: with SMTP id o4mr13184672wrx.309.1573464065520;
        Mon, 11 Nov 2019 01:21:05 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id w11sm7253876wra.83.2019.11.11.01.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:21:04 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:20:57 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 2] dt-bindings: max77693: fix missing curly brace
Message-ID: <20191111092057.GN18902@dell>
References: <20191023093437.GA30570@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191023093437.GA30570@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 23 Oct 2019, Matti Vaittinen wrote:

> Add missing curly brace to charger node example.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> 
> Resending once more.  Sorry again guys. This time I added also the DT folks
> and used correct email for Bartlomiej.
> 
>  Documentation/devicetree/bindings/mfd/max77693.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
