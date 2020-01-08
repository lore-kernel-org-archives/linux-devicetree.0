Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188D1C282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:25:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6E9F2072A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578500726;
	bh=1wADvEiqa9qIsC7lGv534Zmj9LZwtYZ8+g3o5ggAR6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2gRW0dZkqYVGkUE2lmpWq5lBA6/6WnMirj3eKR2+Sts3eX1Vui+Nm4rcQHZhdQQic
	 mVAv15DvcoltnAxqDDeHyBpKyrC3pFtCYJnjLYd5zx1UiWHPltQ+08wpsxJA+ISThN
	 bx3p+KJ25pPamOTmY5VSWnBJ4BUYJy/XUEKeEON0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgAHQZZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:25:25 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44139 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgAHQZY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:25:24 -0500
Received: by mail-oi1-f195.google.com with SMTP id d62so3099295oia.11
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yz35zFP2aSNw0+gIRfSaZMhcsEm+gudXf2tyLjffdvY=;
        b=mHnXSRdgY5/3Qj2FgK0WZp6gjTNNjdu1R7cbZb3XzTEx50a/ra8mgOebokuDDNEEwx
         Ju/wUzdEppfVc+O3YRv/mtktJVEaAH0HIpgny6CVe/4k03wNMSaguw9epYUfO8/vuoOB
         scZUI1+rGSbIyGQlHQ1Yji/GPZt+reHrA0DU/bWAoAUuR3A+VgklUhro2GnQG9IulytU
         qgyEjkOQYYO7OHCxYkxj+JM15n7LF9waqNqNOC3lPDmXhq/D8Gkrdy0KaTeB6gTj+2mD
         Ph7fgMqAO4P2DFA3OQeaLO142GMmjAa/btR/h6Sic6eYlCDXy3HFOT1Vk3uA+lmFvMNv
         aYDQ==
X-Gm-Message-State: APjAAAXzsoWfpfs6YIEwCwB1OQDouRkTt5HV92G3ic4M/RE+pqc1XgAA
        o9o1VUenQ8+ozRLz9mCmiicy8S0=
X-Google-Smtp-Source: APXvYqwU1oKbRA3GsRrpfGJsPMC6ZaZld6spVa4ui/03zeZroT78lZiA/pp6TPuc8wMzMqDCzwzYuw==
X-Received: by 2002:aca:b286:: with SMTP id b128mr3797991oif.147.1578500723165;
        Wed, 08 Jan 2020 08:25:23 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m89sm1268507otc.41.2020.01.08.08.25.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:25:22 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:25:21 -0600
Date:   Wed, 8 Jan 2020 10:25:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ath10k@lists.infradead.org
Subject: Re: [PATCH 1/2] ath10k: Add optional qdss clk
Message-ID: <20200108162521.GA23484@bogus>
References: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
 <20191223054855.3020665-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191223054855.3020665-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 22 Dec 2019 21:48:54 -0800, Bjorn Andersson wrote:
> The WiFi firmware found on sm8150 requires that the QDSS clock is
> ticking in order to operate, so add an optional clock to the binding to
> allow this to be specified in the sm8150 dts and add the clock to the
> list of clocks in the driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 2 +-
>  drivers/net/wireless/ath/ath10k/snoc.c                         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
