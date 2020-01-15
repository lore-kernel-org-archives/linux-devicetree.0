Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB797C33CB3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:56:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0F25214AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579100209;
	bh=4hSgjlf+j7uAXIz4y06dxEdBrPMPHgzLbs71F0VcQCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MJF+fb4NeLbkwyjnHJC3Z8SsXXPNPtTWevzn3eD4KTmpIXRlIgllpnAHFqkWhkpCF
	 tE7J8qL8VbihQ2nrAYJFlqfprrSkzy14SbupeehBoqYQVt1ip/oY/UgDHc/WyPoTxt
	 VI+P82/QxJg69tezqSyQvB6ullBWrXvpn1u2yXdY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgAOO4t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:56:49 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37599 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgAOO4t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 09:56:49 -0500
Received: by mail-ot1-f67.google.com with SMTP id k14so16351631otn.4
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 06:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9gnxD+G4FNn+U8wzPNZLFG38GLzn+JUvySqC1BxpFAA=;
        b=Io+LBrM/2SLFxSk04x8SivC0h/ZOCsQhPn9JK8N5QHUDyD0ZWDsKY4ArbCIKGq2UxV
         GZyyD2odI4ZyG9d6Rueh/qr/JWr8EfCP7k60E+ACZRh/iPwEuDR4l1huA9e9BE99Cg/5
         CeHCEgHFY0TRl9ekFnAQn9EeFSMZH07fzMrcNNE/fNVqOLkMNJ9iFuAim80/WwFh7Xwd
         hft5gHqsW5LNJUWkrfKuCtzM2rNzoeuV4MI626VqTEwz7XWaVDqnWZhwhEIbtZVg/bsZ
         KrCxXM9ekFY0pNQRdnIoREMuAWjzpGdgeGdEFi4B/JmgkLqrSugDfxEHoFFTtAEZU1Ur
         1XJQ==
X-Gm-Message-State: APjAAAWzrpigi4JmVRelLC1BgMijpapSrT/E/UpJJ3LpcBjzd7M35fuB
        rT7so9SZyH+K4fO4vkisLhwyzf4=
X-Google-Smtp-Source: APXvYqz5BfZMmTkMDiL+RPw005MPGS6+lWcHba1lhqWoBN8cEJucdfJx0w2/q1xfZcmRuCVQQgFRIA==
X-Received: by 2002:a9d:66c1:: with SMTP id t1mr2753783otm.73.1579100207734;
        Wed, 15 Jan 2020 06:56:47 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k17sm5794242oic.45.2020.01.15.06.56.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:56:46 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22040c
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 08:56:45 -0600
Date:   Wed, 15 Jan 2020 08:56:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ludovic Barre <ludovic.barre@st.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        srinivas.kandagatla@linaro.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 5/9] dt-bindings: mmc: mmci: add delay block base
 register for sdmmc
Message-ID: <20200115145645.GA599@bogus>
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-6-ludovic.barre@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110134823.14882-6-ludovic.barre@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 10, 2020 at 02:48:19PM +0100, Ludovic Barre wrote:
> To support the sdr104 mode, the sdmmc variant has a
> hardware delay block to manage the clock phase when sampling
> data received by the card.
> 
> This patch adds a second base register (optional) for
> sdmmc delay block.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  Documentation/devicetree/bindings/mmc/mmci.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmci.txt b/Documentation/devicetree/bindings/mmc/mmci.txt
> index 6d3c626e017d..4ec921e4bf34 100644
> --- a/Documentation/devicetree/bindings/mmc/mmci.txt
> +++ b/Documentation/devicetree/bindings/mmc/mmci.txt
> @@ -28,6 +28,8 @@ specific for ux500 variant:
>  - st,sig-pin-fbclk       : feedback clock signal pin used.
>  
>  specific for sdmmc variant:
> +- reg			 : a second base register may be defined if a delay
> +                           block is present and used for tuning.

Which compatibles have a 2nd reg entry?

>  - st,sig-dir             : signal direction polarity used for cmd, dat0 dat123.
>  - st,neg-edge            : data & command phase relation, generated on
>                             sd clock falling edge.
> -- 
> 2.17.1
> 
