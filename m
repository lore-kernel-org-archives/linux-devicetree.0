Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461ECC33CB1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 13:30:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 173652077C
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 13:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iTCAlZeC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbgAPNag (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 08:30:36 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52306 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgAPNag (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jan 2020 08:30:36 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so3778786wmc.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jan 2020 05:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=00a+Q4mRpgzQBV1cPIKAh4zjIphnbswAUhTHY9znNH4=;
        b=iTCAlZeCQ7uKek41RyttwGtPeyePxTcuNs5Lg0PW4h0I/E3sHCuQ94y++nt1VdUqtr
         2A+KBexpEoP+z1CQEQ8I65w9PYBtwYTj7YGiA28ER3HXaGy0pTUrHLwkPzhX996SQOTt
         UV2nj6IgmrOdrpoFy+US97/zmPbjPyXPcHpMjqJ0/FwdN+Br46B3MD5wQJGOYksSPGut
         aaVkSK4Q9h3v5mNDvmihWCZhX17PRkiKLcQ7hR7JccTInRCTcU5JK0MahEbXYKdF+zhz
         9D8o3HVIO1rxG/wFPvHVy1E2DdUmAc+Ws1RYc+Uyk8ZNqklrwOcgAWyTEJ1cRtPV//m/
         /nKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=00a+Q4mRpgzQBV1cPIKAh4zjIphnbswAUhTHY9znNH4=;
        b=JkeRfQ5KmRllJ66wH/6pxkqslaXe18XJPX4uMhamT3FnvDoRsELKQun4dkEbfnuF67
         cq2PilGFdxC5rQyGO9gI1V/QFq0c0lTBA6nyz0S342sElxZfsCaHPoov9ZG0Fmav4b5C
         5vfGxfUd3b7ANEH4ncGvLOwZeHTAMRQF9fN4VafXHJf3MvX9kHC2YH7M/ydxRlQC+xIn
         EcfsNJCouFE6HNfnOwKdDsAO6dT2WWRqSwI+8ia+3OMuUBuFmv7r2xQ+ljAjKgMoYG+e
         EqrF0/eO+wH5K7KJK/lC8Kgg0LNqh4NVQAufZID9hKUPyR0uXilZzaXz14y7NjFLhKi8
         6Vgg==
X-Gm-Message-State: APjAAAUk2Mfex87ZZ4njFfG/sGrwo9eP/GowTsv3vNn9nvTCQwLZUjhT
        1NcaahyrsgmVeqwSQh8xnHuKzg==
X-Google-Smtp-Source: APXvYqyqW5SAwtM3InQeq3J80Yv0ePNzerEYYhqvdq4g+a9Hcq6N6diGySL/l1tecHCD81O0kGt8WA==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr5740908wmc.145.1579181434697;
        Thu, 16 Jan 2020 05:30:34 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id o4sm28987915wrw.97.2020.01.16.05.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 05:30:33 -0800 (PST)
Date:   Thu, 16 Jan 2020 13:30:48 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: atmel-tcb: remove wildcard
Message-ID: <20200116133048.GO325@dell>
References: <1578997397-23165-1-git-send-email-claudiu.beznea@microchip.com>
 <1578997397-23165-2-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1578997397-23165-2-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 14 Jan 2020, Claudiu Beznea wrote:

> Remove wildcard and use the available compatibles.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-tcb.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
