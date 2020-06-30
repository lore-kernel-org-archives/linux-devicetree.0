Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC4FC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 02:05:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14D5D2076C
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 02:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593482701;
	bh=BUtdG4bAJTG+dBtOCq0KzLbYQbt70hu87qxYqXDw31w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nlW2JvhrTH6YhEju10FHia6h5Z1+O2yZksOoivIH8aSLrIhi9qdUeHgBt5FF6skSh
	 HHbiEVxGpfU0PycAGKQ2qSzIjQJu8WFmeSMHXQ39hXjO+DSDCnyIkzq2JPcKlc341G
	 QKNIfdDC+OvTi/OamaZEuiDmtMPE9OAuPH/vd8b4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgF3CFA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 22:05:00 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:42639 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgF3CFA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 22:05:00 -0400
Received: by mail-il1-f194.google.com with SMTP id t27so11344695ill.9
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 19:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2kBj/yLU/8dyOAy3Sh9af5jeL1KhrMVazhDhXX996R8=;
        b=D8fB7JFNywdi3hke7z6tFAvA+E80/u8FT2nVLfq6nexxpMLrRbqD3POQg4yFZTQxim
         ImJKcY4y7qb7LsMgiqaV8eIoio+8OlvO37VAwlNPmV1Jaz0QwlDss0oaURipC5f4J6kj
         JBLmTpjOdWqRzJBR7eL4P7TUYnIkjtrdvFp3t67I8YO0Ini+m4JMngEtE7pDAyQHBO9y
         Cpp5xazjSxqOsdes2nB2iQjHqnHsOCpTEm9BdJMQkVJ77yjk1uriGZOW7ynPxog9HHQ9
         sc0F3ptOd+ywbnZz3hATKUG6FdScqXwD3Qsru4To8bCMhmnCP+hWSUQUOp2RmF1HxEbW
         Ztag==
X-Gm-Message-State: AOAM533fikLaOiFhYS9RKuA0wzrKnBNBGZWysh2K82Kauwu8AqWJJQDd
        539S6n8PFb/H+KAi3+chHAqbR0vPiA==
X-Google-Smtp-Source: ABdhPJzi6s7bzrVADi0+ERaD+gTn9pVBoGAAZPz57H3nL5si6xNQfrx2OFb0BlkeO3kahacAcSPPKg==
X-Received: by 2002:a92:cf09:: with SMTP id c9mr419320ilo.214.1593482699818;
        Mon, 29 Jun 2020 19:04:59 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id a187sm813829iog.2.2020.06.29.19.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 19:04:59 -0700 (PDT)
Received: (nullmailer pid 3469487 invoked by uid 1000);
        Tue, 30 Jun 2020 02:04:58 -0000
Date:   Mon, 29 Jun 2020 20:04:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     yamada.masahiro@socionext.com, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: uniphier-system-bus: Use 'serial' as node
 name
Message-ID: <20200630020458.GA3468954@bogus>
References: <20200629221818.20366-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629221818.20366-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 29, 2020 at 07:18:18PM -0300, Fabio Estevam wrote:
> Use 'serial' as node name to fix the following warning seen with
> 'make dt_binding_check': 
> 
> Documentation/devicetree/bindings/bus/socionext,uniphier-system-bus.example.dt.yaml: uart@5,00200000: $nodename:0: 'uart@5,00200000' does not match '^serial(@[0-9a-f,]+)*$'
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../devicetree/bindings/bus/socionext,uniphier-system-bus.yaml  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Already applied a fix for this.
