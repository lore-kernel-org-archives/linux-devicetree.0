Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C99C33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C14D207FF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578956538;
	bh=wCn4/894KniO2ftSZq/2Wivodp6I96UmXRF8C4cmB2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xOJhiWNsEiBxueX7dLm1z+WAt/rv7GvYHuTiErzmf6ybYk1zFEnXM+1rMhsPOdyks
	 h/0awjv/Ot12c2WZdH4aGuFYHR0vf065u65pyGl1q/7QxYKyGJqU2ZFz/Gk/pxQknQ
	 OeSxzjKnfrCeLKH3u6szg/wXq7gxyIYZAPpTCDJY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbgAMXCR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 18:02:17 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36288 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728924AbgAMXCR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 18:02:17 -0500
Received: by mail-ot1-f68.google.com with SMTP id m2so5827098otq.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 15:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=18X4W8z+4oQOA0zZ9sp8Kgk/QX1t7Hw3G5i41pFALn8=;
        b=sFFgh64oK1gj5BGEqg1DNzrXFc/kWLyuVsL+ZxgX08Max5/xAogda/LOWxz3+M1wFY
         TH8hKOgzdeHNbkQIcYESm/WJ/lfIkE7jx/xKQms9bMNlVS/QVcUqubD0CqTdGa2sTdSE
         +6eP3KqpMpLyPG87dVYyB4VKm+0AQR0ppPxjHIjaG5KbnZ6Jj8BrfMQOdlKDvF0lh7Y9
         XVLyfFzq5HwwDUqtepXFuIkbjeMrUeyOzv3X7y2qxp23ubFr8qMw5rquyUt7HGHF+uDu
         7JYSEiyS0VunEdeF/YIGkTCDwTaTQwltvFO90w4HsbHPZ4C/FRYSTRMlsNxzTiylBLvq
         3QlA==
X-Gm-Message-State: APjAAAWmIjgeVhkWlHS2314ZlCFu02zSYPdqyxGsrrKkMLV9SB2EDVNx
        GaBhMR55onTMbrPekcofBh6Q9Ms=
X-Google-Smtp-Source: APXvYqwEt14sbgocNspMZ0Ka5W2x+RbfTq/XT870EcfgM82RRZ1hTcea6qGOEhgUvQoW7zSEho1uGA==
X-Received: by 2002:a05:6830:15ca:: with SMTP id j10mr12259939otr.190.1578956536850;
        Mon, 13 Jan 2020 15:02:16 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w72sm3991922oie.49.2020.01.13.15.02.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:02:16 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:02:15 -0600
Date:   Mon, 13 Jan 2020 17:02:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        linux-ide@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2 v3] dt-bindings: Convert Faraday FTIDE010 to DT schema
Message-ID: <20200113230215.GA32053@bogus>
References: <20200110081411.9806-1-linus.walleij@linaro.org>
 <20200110081411.9806-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110081411.9806-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 09:14:11 +0100, Linus Walleij wrote:
> This uses the new pata-common.yaml schema to
> convert the Faraday FTIDE010 to DT schema.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Rebase on the new common binding for just PATA
>   controllers.
> ChangeLog v1->v2:
> - Rename the node for the example controller to "ide@"
> - Rename the drives to ports, so ide-port@0 etc instead of
>   drive@0.
> ---
>  .../bindings/ata/faraday,ftide010.txt         | 38 --------
>  .../bindings/ata/faraday,ftide010.yaml        | 89 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ata/faraday,ftide010.txt
>  create mode 100644 Documentation/devicetree/bindings/ata/faraday,ftide010.yaml
> 

Applied, thanks.

Rob
