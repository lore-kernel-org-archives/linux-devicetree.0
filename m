Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1919DCA9EBB
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 07:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEFDE2166E
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 07:45:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aE7hfwSN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408702AbfJXHpb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 03:45:31 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33718 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408700AbfJXHpb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 03:45:31 -0400
Received: by mail-wr1-f67.google.com with SMTP id s1so16097732wro.0
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 00:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XeNvbPkWOZzbOUeoTn9qzFs3Ekfhx4QcmYynZhqkS6c=;
        b=aE7hfwSN5qbqGx9cg9oWctzYcbpadJEcGj/Y6e+1I12ZiqXxSKJgWSzZgXuM+lGIU9
         J54vZ2RJr8My/bj32YKiI6ycNNeDIc1IQKRrYRGrfBKA6YNq9gOhRe7icjpdaTVV9vW7
         EXtzRMx+CALsGS7n9lx5Org+Pli09q8JNsGmZrOxjEpBuBwGGo6qi3kMW9RFKNsxaunX
         q7ifR7P8MjeOqrUgKdK1XdrnSAmhTDSH6Ukba9Sj/08aQonYXUTCx9+ZG2ADaDr1eiWR
         jLBFNIq2H8SvjKcGDzawl4DaSSEv2CFrF69MTex82AuooxzQoxjS5AKRB83Xphg+FqK/
         VZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XeNvbPkWOZzbOUeoTn9qzFs3Ekfhx4QcmYynZhqkS6c=;
        b=mRl/cdCDQt9K0P8HctfFG2izn5QOWGvcUa4KkeaaUCuxvkwVBeh1JrX7DaIEu7vbED
         /BsdMzgNRtL5zWyTLDs5g+QsWNuAQLIrnJvNLY1gDHZmudUuaQBy5fGuROA8cfLJ0QT9
         /UxdVtoqR/CCjFAQ801FIDq0A4hbc2tHmeFv2VVWOq+lwPK32dQ96ShYCsTpfP0/ERRb
         zeyayPeIRaXIQhiApHIbekBuuOrcr2GjBET3k0Y9nyAgZJPRhEGHD3xrD5hv4px80bqe
         j/p+o9ht3zzm0y0uNE2zG0MfKayI9xG/WI4FuQgsI6yG0TJ1uU0oHq2GpdVOE2aiXD+5
         LAaw==
X-Gm-Message-State: APjAAAWKw6I1gOuUrxWvem8LnxFR70kotWB5GwkpPxH9wABwTv0NZaD/
        1swkBIfez1NBUME+c3eaROSKKw==
X-Google-Smtp-Source: APXvYqznigT9eru6tguPuqwJKeKRdwVt7FNUpgUJwZ36Vk8rkh9HVEwSgcFxkrQjfbCI0eva3bkGoA==
X-Received: by 2002:a5d:4803:: with SMTP id l3mr2454204wrq.381.1571903128929;
        Thu, 24 Oct 2019 00:45:28 -0700 (PDT)
Received: from dell ([95.149.164.99])
        by smtp.gmail.com with ESMTPSA id v128sm2817524wmb.14.2019.10.24.00.45.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 00:45:28 -0700 (PDT)
Date:   Thu, 24 Oct 2019 08:45:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH RESEND v4 3/3] mfd: madera: Add support for requesting
 the supply clocks
Message-ID: <20191024074527.GG15843@dell>
References: <20191021135813.13571-1-ckeepax@opensource.cirrus.com>
 <20191021135813.13571-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191021135813.13571-3-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 21 Oct 2019, Charles Keepax wrote:

> Add the ability to get the clock for each clock input pin of the chip
> and enable MCLK2 since that is expected to be a permanently enabled
> 32kHz clock.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/mfd/madera-core.c       | 27 ++++++++++++++++++++++++++-
>  include/linux/mfd/madera/core.h | 11 +++++++++++
>  2 files changed, 37 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
