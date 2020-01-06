Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A200C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:40:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43C94207FF
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578350426;
	bh=zEjg60b8UbprMH/aBQ9z3IQetPpLk8aSRgbjocYpZnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=f6BMuU0eJnG+Tg2jSkLUHdLRy0eDuNgEqJYGXaNYyAwRSAv5I04d3lY4Pb/oeOPvh
	 pCIPxmuH9uW9p1Ff/jViqoRhwz7s6t2Ugew/lOZiR7lhOGhPDoFsU3agbUtdMmpabB
	 FKlvqiW/cebDAzQQ/66iJ2lnkqmAFK2L7npiGPLk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgAFWkZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 17:40:25 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34870 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgAFWkZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 17:40:25 -0500
Received: by mail-ot1-f66.google.com with SMTP id i15so6016490oto.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 14:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4xRmuseBXBvXecEvchHMqQ1KbIr+16qRs88/qPH/zRs=;
        b=MHxxnWQUmLdyVu3bogLVU9P/6CJy7JgW+LYkGxSXEpt+D0qTw6G7+LdBK1dgyPb+qI
         3jwYdVyT56WDZu/XzYWLq12M6JmllcMW+0ueNZxhEuKWYSvr1On55YS2cW+r6un5mKgV
         kmHYbD/O2MAw/ugW11UfGebHY+GZlDLhN++d6DnMVjtKraKj7rg6Dw0pHwiaNthsHyms
         27cNWR5cRkGgvty1dayLR4CcHjX7zCyoaikdgybQh132VuFmQ85nXPV6AFA6WRGzPdzJ
         zxid6vd5uJiRN41K4Yune5VoFd8tYpGe8yG57sW+zHlx0XB6BTIricZNoXNSDjj1Q2HJ
         7mlQ==
X-Gm-Message-State: APjAAAUOO5ZFjqoqWYo+XDewwstQRNc179MAkt5Dpy+2r8SohEmOuXBE
        DztOamA707JL6T4c/xUKEKXxSik=
X-Google-Smtp-Source: APXvYqwuHisz/nWmfozHo3iDQ9R4Be+wua3atC7zWogKX2E30tZkYTUSYhXs17c4Ih1AMAlWtushCA==
X-Received: by 2002:a05:6830:10d5:: with SMTP id z21mr122761079oto.30.1578350424524;
        Mon, 06 Jan 2020 14:40:24 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id m19sm24627280otn.47.2020.01.06.14.40.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:40:23 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22043f
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:40:20 -0600
Date:   Mon, 6 Jan 2020 16:40:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        linux-ide@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2 v2] dt-bindings: Convert Faraday FTIDE010 to DT schema
Message-ID: <20200106224020.GA5136@bogus>
References: <20200106015256.13194-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106015256.13194-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  6 Jan 2020 02:52:56 +0100, Linus Walleij wrote:
> This uses the new pata-sata-controller.yaml schema to
> convert the Faraday FTIDE010 to DT schema.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
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

Reviewed-by: Rob Herring <robh@kernel.org>
