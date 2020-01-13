Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886CCC33CAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:02:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EE29207FF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578956531;
	bh=ZVJCKcmluivQaj5X7FSCb0b0MTOmY3kKJZnoxwSa5eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=H/qCxTWAlXuhH0HyW7H981I+7RBL+xOxbvADIP9J1jfFAP2nXNwv3uJEZ+0ocPmhA
	 xqPvmvcoMb4z/USfCF5EaJOKAGsaC2iqwZRDuThv3Vhj5jciYGrVOE8aa6cSpXYq7O
	 GZoEBz7w+yYqaWImPqfYCWmZ9jne3rIj3mRGTuic=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgAMXCK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 18:02:10 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41448 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbgAMXCK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 18:02:10 -0500
Received: by mail-oi1-f194.google.com with SMTP id i1so9988067oie.8
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 15:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tx39+4MJaLHivIxZTseGmPGOiWsM4jlyAIk8H9s0Snw=;
        b=jd/EmydXRdG8+HMTG69ssGg5/zunR7yPcqqQCtIhpupJeLY2PL5DYsZ0NiDqp37Mir
         lfWyTx/8a/gY9qpQrSrKM4ia7sn2y5sbM9rnfEDINpeD4/LGU8AYXHf6Pz5LK7YP9+on
         sWPkL+/cBRk+xPv81PGXq97/kfVJSfDDdtX3dDdeXx8KDv9t/7dz28L1iepLztFhYZWM
         mmy5qAt6Qt0Npugx+ocNCYnxSupwWvA/J3aXdVTv1lafl4Q5bk7j8bBGehwpPxePIrx1
         1wle5qlEWszLo2cv0YSMb5RPnD8mo+AI8qiaM7XE6dLV+GzC2kK68hVm26tKIwFWPQYy
         EtWA==
X-Gm-Message-State: APjAAAW9RYlxljUCmSMwpGZFUnNxLcI8ufXPwgBIVKkZ5vxNQvIQbeN1
        EzwaWrlu6l0Ga0Q+iWjmn4ydmVY=
X-Google-Smtp-Source: APXvYqzHld42dYMuLYQQn9jgUFVCGILU4Rk4gHnoewPCZ5rxJxYa3DekOjyS/yKMnajI/Ch6yLMlkw==
X-Received: by 2002:aca:5588:: with SMTP id j130mr13954697oib.122.1578956529139;
        Mon, 13 Jan 2020 15:02:09 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d11sm4658616otl.20.2020.01.13.15.02.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:02:08 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:02:07 -0600
Date:   Mon, 13 Jan 2020 17:02:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        linux-ide@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2 v3] dt-bindings: Create DT bindings for PATA
 controllers
Message-ID: <20200113230207.GA31662@bogus>
References: <20200110081411.9806-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110081411.9806-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 09:14:10 +0100, Linus Walleij wrote:
> I need to create subnodes for drives connected to PATA
> host controllers, and this needs to be supported generally,
> so create a common YAML binding for "ide" that will support
> subnodes with ports.
> 
> This has been designed as a subset of
> ata/ahci-platform.txt with the bare essentials and
> should be possible to extend or superset to cover the
> common bindings.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Only support PATA controllers for now since it is all I
>   need right now. SATA controller have complex topology and
>   might need more elaborate subnodes, possibly a subnode for
>   the multiplier itself, so I will split that off into its
>   own RFC patch.
> ChangeLog v1->v2:
> - Use ide@ and sata@ as node names.
> - Use ide-port@ and sata-port@ for the ports toward the
>   drives, rather than letting the subnodes be the drives
>   themselves.
> ---
>  .../devicetree/bindings/ata/pata-common.yaml  | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ata/pata-common.yaml
> 

Applied, thanks.

Rob
