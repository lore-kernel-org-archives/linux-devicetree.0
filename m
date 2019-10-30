Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870D2CA9EC4
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 07:50:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DEB920663
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 07:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XyPVZBz2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfJ3Huw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 03:50:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44405 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbfJ3Huv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 03:50:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id z11so1088519wro.11
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 00:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=FLPIpnHOBePg/Y6da8w9/WRUoNiVkxQNWcq2DQOe07M=;
        b=XyPVZBz2kVqf6z+1cIyhTkCY9EFXOZzeQZGpHure5f5izzCxjf1ZVQ6kVBYmm9H1+U
         d/t30k/IvFZWYAj66fXjRzzv6d+hZ/7mVXinYxHIyoMrDgHZnV8vHynTWW4njmDFj9a6
         vEs84X07ky4e9x3e9KtjF1LWqsIFnWK6+82TOscZunOTqiGZeOYVRsNxts9VjEQKa+lt
         FhdpBJnumN6gY9IAN4yvMFF80r4RX3gQFjM1jg9NhL2pXmvBoC3b9DJa8zBtK6RPIeAl
         DqxNx0LhriVy4PCV06zjT9oR0h6QR3/Rd7c6ScnJbVfmiu0iLZnoBeXTiIVq1McqfwwE
         Y6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=FLPIpnHOBePg/Y6da8w9/WRUoNiVkxQNWcq2DQOe07M=;
        b=DBUj0o2iC5E8FNCrdqwfuOTcQr7xRmRu/imyzFVqO273T0KcU75xL01KiJzlFaQuLq
         cwR6+Cr8oA3jbzI7b0/Pj+XEUIY95sY8ZjFN94hGwvo3OLQyTP/3DCKDYEgwviUD7WAa
         m5oE9PT32r8hKdqiCfNKmHfe0zYpSTDVpjx1gb920HCQzXM88MPaQHOhbiuTifrJlh/8
         QsG4KBx5gZYa7XmdrD/cn3TkvZNfwQo+6+mDN08tf/L2Uk4GvpSF05Tm3NYxIHJdDL3J
         QlDxipaDAHz3Xc+/ZTLsO9OOGltEkGgRHGWhKfBS3i2fvWF5IzuXZIIuBQnaJSI3kTs8
         QNwQ==
X-Gm-Message-State: APjAAAVnE364SYRZSi4l6/SZBYtmbwUTFsuBgI968JcOEAFeeiP5+bor
        E4+L7Ok7UuCXzNKamA4xovf2Ig==
X-Google-Smtp-Source: APXvYqxqLawwSBkqOwElIXw0EitJZw7c5fIQELur6Ziwo9Eowbi50RtGdHxZjDIulp8GE33dkMbA8A==
X-Received: by 2002:a5d:4808:: with SMTP id l8mr22968551wrq.118.1572421849544;
        Wed, 30 Oct 2019 00:50:49 -0700 (PDT)
Received: from dell ([2.31.163.64])
        by smtp.gmail.com with ESMTPSA id r19sm1929303wrr.47.2019.10.30.00.50.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Oct 2019 00:50:49 -0700 (PDT)
Date:   Wed, 30 Oct 2019 07:50:47 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH next] dt-bindings: backlight: lm3630a: fix missing include
Message-ID: <20191030075047.GC4484@dell>
References: <20191029185350.31155-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029185350.31155-1-andreas@kemnade.info>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 29 Oct 2019, Andreas Kemnade wrote:

> example failed to compile due to undefined GPIO_ACTIVE_HIGH
> fix that by adding the needed #include to the exammple
> 
> Fixes: ae92365cdd75 ("dt-bindings: backlight: lm3630a: Add enable-gpios to describe HWEN pin")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../devicetree/bindings/leds/backlight/lm3630a-backlight.yaml    | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
