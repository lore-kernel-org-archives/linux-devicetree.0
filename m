Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD26C33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D731207FD
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578955959;
	bh=veUkhuWj56Oql55ZqqS+wmUdDbbo2ngb7WraR/GRYCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JoxEgAghKdWuAD7dbxEJNW8utzYgAXHAJGZKU7NB8nUP/O4Zl8FjCFHXqhtAd2KFe
	 RapnuhuzM3F1nfWCTXz0QXwPIdIKk7jhYPbkmcgStACQU7gNekKmmgdax07rvdek+j
	 LpgIxSNJeYa+A0sODyTzyo8qXBMJoFIld1mHCDcY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbgAMWwi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:52:38 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39831 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728833AbgAMWwi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:52:38 -0500
Received: by mail-oi1-f196.google.com with SMTP id a67so9991341oib.6
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 14:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=J+zBhW/gDhabcv8JezsZDbLiOV+72tFZs2kFt+zjTFs=;
        b=e4X5d4+T3POmlK4voBnBjDKHFLl8VSdgLuUkR/s7d7aountJPfcovYVGS3mENnXsyP
         C9XySDAWrr41BUWvxuCYdWL0KLub/iTGB+5+Bybagy51PtfGCuRNx5CQTMqh/FRTOkFO
         j6AeFEXrXEn7p5J8hcmtGbioJw9k0ZcT4Kc5NX5fjQUFJGYvRad8aNbPLEb+6xWZ04b3
         fsnBiP8JJZ8MnYZRJPi+nU8JrEWQPelCBkgqP934sj5Hv92HeiGvSrtq/5Nb7r/9JRNh
         TDsUAVUKjLP03/tR8wd1+KOI5UbY9yUoBbiWGkBMOh0BP26oMyheH/uhBljxFkUE6sX1
         PZdA==
X-Gm-Message-State: APjAAAVpuh8GkJER0jd3ukza59UHogCzdxjAvFATKkqDzFqLT9wS6XCi
        Di0JJGPkf/+llBlC3m2qtYoVCxU=
X-Google-Smtp-Source: APXvYqzN5GFmny88ct4hQmz8IHAN/kKCP0d3zshMX3VyZNF6NcT6PH5nqsBjMh16AINVNsOsEqSUkQ==
X-Received: by 2002:aca:c551:: with SMTP id v78mr14824592oif.161.1578955957536;
        Mon, 13 Jan 2020 14:52:37 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m185sm4001687oia.26.2020.01.13.14.52.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:52:37 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219cf
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:52:36 -0600
Date:   Mon, 13 Jan 2020 16:52:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Minkyu Kang <mk7.kang@samsung.com>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Oskar Andero <oskar.andero@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2 v4] iio: light: Add DT bindings for GP2AP002
Message-ID: <20200113225236.GA17926@bogus>
References: <20200112111341.21388-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200112111341.21388-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 12 Jan 2020 12:13:40 +0100, Linus Walleij wrote:
> This adds device tree bindings for the GP2AP002 light
> and proximity sensor.
> 
> As with other early proximity sensors (~2010) the light
> sensor and proximity sensors were combined into a single
> component.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Minkyu Kang <mk7.kang@samsung.com>
> Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Cc: Jonathan Bakker <xc-racer2@live.ca>
> Cc: Oskar Andero <oskar.andero@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Resend with the changes in the main patch.
> ChangeLog v1->v3:
> - Drop the maxitems on the supplies, it is already 1
> - Drop quotes around "alsout"
> - Limit the sharp hysteresis to 8 bits as it should be
> - Use /bits/ 8 in the example so it is correct
> ---
>  .../bindings/iio/light/sharp,gp2ap002.yaml    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
