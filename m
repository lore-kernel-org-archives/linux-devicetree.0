Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92825C433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 19:34:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69C8B2075B
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 19:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598643292;
	bh=IEmPHvkA+z1REpWVKJHMI5dNKpMjsW03J3jnXMWQsYw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=KCD9CxOryZnVz4lGcHpHFiQD5205qfWzq32VbItFG2dIgexMx7Irs90KPDDwtLIzt
	 bfdZK0lR/Vvxdx/Ad5F0vA2cyFVaY6HGABoFd2Q9R3+cB85NDu74fuP4AInQBxq78i
	 iwQzXuhw0n0sgH8v3px6vGmdL73RFBkR9wUhxaPA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgH1Tew (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 15:34:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:53252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725969AbgH1Tev (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 28 Aug 2020 15:34:51 -0400
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E17020872;
        Fri, 28 Aug 2020 19:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598643291;
        bh=IEmPHvkA+z1REpWVKJHMI5dNKpMjsW03J3jnXMWQsYw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B1w7k7jyCe/Sh8nqooN21BOrpD3VkGkS/o/36TjeTOG+cjKEC1BfqV7eV6l3RuHD4
         NVDiucsungSSFVFQlEJSNTGQ9p2G9VmjTdhIBDfeIxPTrT5nqYRDeQZxAu3DM07rli
         ZSnkpb4fKKTsetoRCAbiJ1SxMCfqBkiCyAtyVQwA=
Received: by mail-ot1-f52.google.com with SMTP id k2so207679ots.4;
        Fri, 28 Aug 2020 12:34:51 -0700 (PDT)
X-Gm-Message-State: AOAM531M/S8uOg1ypQG/EqsnWCoLtzhqI0elyz3ub7Zoqwo9gnLQ5h4K
        imIz0cbAG265vfvuVTg/ccBA8sj9d4L44gtS0Q==
X-Google-Smtp-Source: ABdhPJzFGvXTUcaXp0hQDnvMMeUZzu/QHSmYBpFoxJjtVwfzrSUAmFhmmQAknImQsGHdQwJmyaicaxzJNOLB2x3ccE0=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr136998otb.107.1598643290454;
 Fri, 28 Aug 2020 12:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200826184851.3431531-1-robh@kernel.org> <20200826185328.GS4965@sirena.org.uk>
In-Reply-To: <20200826185328.GS4965@sirena.org.uk>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 28 Aug 2020 13:34:39 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+JCpQb=rDqxuhy-ZMDrnMiOKz1HSTta0supjvLVoEWMQ@mail.gmail.com>
Message-ID: <CAL_Jsq+JCpQb=rDqxuhy-ZMDrnMiOKz1HSTta0supjvLVoEWMQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: Remove unused 'linux,hdmi-audio'
To:     Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 26, 2020 at 12:54 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Aug 26, 2020 at 12:48:49PM -0600, Rob Herring wrote:
> > The binding was added in 2013 and has had no driver since 2015.
>
> There is the hdmi-codec driver that covers such hardware and would be
> compatible with the binding.  Of course there are no current users so...

I didn't dig into how TI restructured things to not need the binding
anymore, but I'd assume the hdmi-codec is instantiated as part of some
hdmi bridge device rather than being some standalone thing.

Rob
