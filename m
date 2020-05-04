Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB4DC28CBC
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 01:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AE77206E6
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 01:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588556151;
	bh=6QNsRipM6sMiQLp4Nrx1GDPocIQ2SNMCghZKmrGxthU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=2lD3GL8LZFyjM0LEIRI/52ETGoW4xszz+1Y92j36qIPiOvxemhGsMvQOO9nf0rnPR
	 Gi1ugKgFELOugWxN2KSVC0rJsjnQ4bnuNzPINic6k/I+gXCrbx3FdGPSHKw58PJ59m
	 iICs/vNOWFtRKD96y922j0u8lznku81phtbvvwaM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgEDBfu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 May 2020 21:35:50 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:30256 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgEDBfu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 3 May 2020 21:35:50 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0441ZORC010767
        for <devicetree@vger.kernel.org>; Mon, 4 May 2020 10:35:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0441ZORC010767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588556124;
        bh=DRkC1bJ0TkEaWLS3KyDJw8Cx1kzwiHdb1l+o/felGvI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oz3bel1XLpb4VlBTN7I4ICO3DE7odUkFbgK2ibUAQQeUov1mAY6Vha5+4+UWuXhc3
         N2DPzeCF+jtcHfoaMNjzOX32loAxadq0rnDaAP43Z9Ud57HTGhGAxmu8LD5DzPXVxh
         u0DC/I5cbqcNoPIPZC6LZuRpj/XLL/Oy+3b/8LmjAmDcgacWH7OPbwHzkwp1zze9HO
         x8llLVkqKMAkWvNLOg9XcXkhiAVwCZuEWgkoGw7WCGo3IWrPFBZrL6AQLpNMXjvlCE
         K+MaLTz/I1bK11t3It9sRSkn14rl+N++BKhlqIgMqcoGmnMIm1RiAgLPxgC1fk67iV
         rYcmFQgtYFEDg==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id u12so7192230vsq.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2020 18:35:24 -0700 (PDT)
X-Gm-Message-State: AGi0Pubpu3/w73x/c6kKtllAaVsk+IW+q8NZkBBoE/Lphn2mNUgj1Ouk
        EN0e8FDtbcdYMGIHzuar5dMcp/u0S1jSpjUirYQ=
X-Google-Smtp-Source: APiQypLT53uey5JdzAYN6Vjy9qaj3XgS8IoCGnlBWwZ/GqwK7P7LQ3bxlDbZXZOVVdPBnQjqIYYHoVP/LimU2RuBNmw=
X-Received: by 2002:a67:e94d:: with SMTP id p13mr10051129vso.215.1588556123275;
 Sun, 03 May 2020 18:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200501015147.32391-1-marek.behun@nic.cz> <CAK7LNARhK08CcDNij25PR0_r2A27Qx+psQp50_AgDJijexDAiA@mail.gmail.com>
 <20200501170816.2f95a2ad@nic.cz> <CAK7LNARo7tErhQzxsOktwrrBcu+W5Wz4VqadrcyiTRHeL6-F4w@mail.gmail.com>
 <20200502201621.2b93dda4@nic.cz>
In-Reply-To: <20200502201621.2b93dda4@nic.cz>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 4 May 2020 10:34:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNASKKAGAub5-2XRyig9fpwYq3MHV-a0eY0F_-o+ajtJo+Q@mail.gmail.com>
Message-ID: <CAK7LNASKKAGAub5-2XRyig9fpwYq3MHV-a0eY0F_-o+ajtJo+Q@mail.gmail.com>
Subject: Re: [PATCH] dtc: Use better check for libyaml
To:     Marek Behun <marek.behun@nic.cz>
Cc:     DTML <devicetree@vger.kernel.org>,
        Pavel Modilaynen <pavel.modilaynen@axis.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, May 3, 2020 at 3:16 AM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Sun, 3 May 2020 02:56:42 +0900
> Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > You missed to see the cost of parsing the Makefile.
> >
> >
> > scripts/dtc/Makefile is parsed every time
> > you run 'make'.
> >
> > Even if you have nothing to recompile,
> > it builds the tiny program in background.
> >
> > This happens for 'make mrproper' too.
>
> I missed this point by a large margin indeed.
>
> > Maybe, file a bug report to your distribution
> > if the pc file is strangely installed?
> >
> > ...
>
> Very well, thank you for elaborating on that. Sorry this took your time.

No problem.

> Now that I know this, wouldn't it make more sense to decide
> whether to build yamltree.c or not in config stage, eg. in a Kconfig
> file? Because now it seems that pkg-config is being run everytime we run
> make. I understand that it is much cheaper than gcc, but either way...


'make dt_binding_check' does not even require the .config


I do not like to run pkg-config while parsing Makefile.
Another solution is to build two dtc variants,
with/without yaml.

> Marek



-- 
Best Regards
Masahiro Yamada
