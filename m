Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA72C32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 19:19:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 580EA2187F
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 19:19:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A4YVAjQs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgAOTTt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 14:19:49 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43880 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbgAOTTt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 14:19:49 -0500
Received: by mail-pg1-f193.google.com with SMTP id k197so8641020pga.10
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 11:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y0L/6Kcm1GJKcnyPUoPeqUBC5pfceEUnD+q3JyvYAEE=;
        b=A4YVAjQsjO9yS+bZ2p+xPTeFVjMqzAsB1haQHadcdWHedJzXAM6Cy6GYdTg9jS3xnB
         ySSsVnvIo3WyNXb2ttDB6HFq9twxR0X1qjmFtg3RD7vTf9F6+BmwIevAFElHrDLqQ9zD
         XJeHYsPAqifBydAE1iUwj2tew8zcqf9Tb6fQ1BK+RW5saqvk6Qn10yqHoTfOJoq3AhwL
         kVt9GKUZtqLY0kkYedefoKWmKule6N33eUfBZqT4RAEA0HyRUewDbdGrqbskFoSCsdIJ
         MDhHHYM2naLrVzRoZgTt6iOlsGD7mahhutqDgKBq9uusoCVsCClu9Dw5oX4UgOWPyDne
         Hbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y0L/6Kcm1GJKcnyPUoPeqUBC5pfceEUnD+q3JyvYAEE=;
        b=cdvljK/tPDngRN8cRFlxcAQc0JHr3ilcQUJ3TAa87so16AKjZ8R6szq0LQlCxlaFCl
         606zKmuDLu76z1fgxAAsO0ghMA233zIQtz3kQKxhgYguxKK6vbXVvJFBGX+VDjVRPDet
         McnhSyg9WNKZJcA6UkvkyvvUZNZPia+xSnVGnNObG5HGr+ZaklBAPQ9NheP0MqqtNZQc
         QOhwXvVwTUZ8mRYqnr49aapyz2eYkjU4Ftg/ecdcWGLGPyaNTJL9Vq91xiDdyWP/sDZV
         2w/gTXwm+wMmrciY/E/4owbXb0zafFAKLWIkvzbXE4UfzWY6G3qkhsl+lBGS5LiIG1rw
         wQMg==
X-Gm-Message-State: APjAAAV0bxd85U1kXYQ9xzu6B2kGblRulW+b28tlPANxFQiuVkilm5f7
        nTeKafPk9OgNYdqYnEEUwRhijw==
X-Google-Smtp-Source: APXvYqxONnTtCwwnSki0/OOTTRl5EWXhbKn6I/OQTaLOzJ8xq81wDXDeIljZnF/OQciErxJzcjfMiA==
X-Received: by 2002:a63:5442:: with SMTP id e2mr33667216pgm.18.1579115988269;
        Wed, 15 Jan 2020 11:19:48 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a10sm21968793pgm.81.2020.01.15.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 11:19:47 -0800 (PST)
Date:   Wed, 15 Jan 2020 11:19:45 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, ath10k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 0/2] ath10k: Enable QDSS clock on sm8150
Message-ID: <20200115191945.GM1214176@minitux>
References: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
 <87zhevsrwk.fsf@codeaurora.org>
 <87r201xf8p.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r201xf8p.fsf@kamboji.qca.qualcomm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed 15 Jan 01:04 PST 2020, Kalle Valo wrote:

> Kalle Valo <kvalo@codeaurora.org> writes:
> 
> > Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> >
> >> On SM8150 the WiFi firmware depends on the QDSS clock ticking, or the system
> >> will reset due to an NoC error. So this adds an optional clock to the ath10k
> >> binding and makes sure it's enabled while the WiFi firmware needs it.
> >>
> >> Bjorn Andersson (2):
> >>   ath10k: Add optional qdss clk
> >>   arm64: dts: qcom: sm8150: Specify qdss clock for wifi
> >>
> >>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 2 +-
> >>  arch/arm64/boot/dts/qcom/sm8150.dtsi                          | 4 ++--
> >>  drivers/net/wireless/ath/ath10k/snoc.c                        | 2 +-
> >>  3 files changed, 4 insertions(+), 4 deletions(-)
> >
> > Via which tree are these supposed to go? I'll take patch 1 and arm
> > mantainers take patch 2, or what?

That sounds good (you take the ath10k and we'll take the dts).

> 
> No reply, so I'm planning to take patch 1. Please holler if I
> misunderstood.
> 

Sorry.

Regards,
Bjorn
