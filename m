Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74747C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 13:44:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BA32208D5
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593697443;
	bh=3MSMquasFAjnciVa57vrc8ovpDKT0aHiUA9DL1SWpI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=r7VlzY/ONM7FI3ScLUIUWxEZ1CisrRN8/KYbqRpL2VzSR4My8BB2z8o4O2B6C3RNA
	 jOlAIK23i6DLyzFe7mHFOUotPUAwi20XIqNWvhif6BOah32NuJOu9VFOUcW0RMDMCE
	 cUE1EYkT5oKUiBu3WtotW4zh8FXIGnfV7j2pSi3g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbgGBNoC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 09:44:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:38070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729293AbgGBNoA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 2 Jul 2020 09:44:00 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59565208D5
        for <devicetree@vger.kernel.org>; Thu,  2 Jul 2020 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593697440;
        bh=3MSMquasFAjnciVa57vrc8ovpDKT0aHiUA9DL1SWpI8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bvgK32p72fDSWie8VaIV4AsDZq8PqPB16wEnSplqMb8KnuL9LBCzL0/DG9bco5GPL
         BST3oQhsE+sLn7s9/FJkBFBG5CEGcKpWVSHtdM5c7Uafdk1KoLi2xfUwtfsEGhmwoh
         E4VWJySd5iLyQXDL10a52YycuQTYV9GNGrVNLsFs=
Received: by mail-ot1-f54.google.com with SMTP id 5so22141439oty.11
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2020 06:44:00 -0700 (PDT)
X-Gm-Message-State: AOAM532xEse83O53nVc9Nw55We11lEEi2oAhpVOwTrst3KlzQMmMHSs3
        qGGu8xJk2ZMDNfAPJXn9tJLawqThuWxT7Q34Vw==
X-Google-Smtp-Source: ABdhPJxP9ySsJVKfJwG+UMovWOfxtv+Snj67Sfxn4ir4gfqlxAwfDrHeOiKxBwoJpo6+5RpBkmfjlNjsM6io2P+1Kzg=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr25256828otb.107.1593697439697;
 Thu, 02 Jul 2020 06:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200630223020.25546-1-festevam@gmail.com> <159364215574.10630.10014931369710772889.b4-ty@kernel.org>
 <CAL_JsqLzae5qUJXF-otsUQqy+zyk9fD_AKd8b8F+PFWZBH1QDw@mail.gmail.com> <87eepuzufl.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eepuzufl.wl-kuninori.morimoto.gx@renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 2 Jul 2020 07:43:48 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+a+XvCU6GY0H0WV3BFyW1JncORdeMs5xpSHtcNbJyOrg@mail.gmail.com>
Message-ID: <CAL_Jsq+a+XvCU6GY0H0WV3BFyW1JncORdeMs5xpSHtcNbJyOrg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Fix 'make
 dt_binding_check' warnings
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 1, 2020 at 5:29 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob
>
> I'm posting same patch and waiting review/response.
>
>         Subject: [PATCH] ASoC: dt-bindings: simple-card: care missing address #address-cells
>         Date: Thu, 21 May 2020 12:54:56 +0900

https://lore.kernel.org/linux-devicetree/20200528223916.GA804926@bogus/

>
> and am sending question mail accordingly
>
>         Subject: Question about "xxx,yyy" style property
>         Date: Fri, 29 May 2020 11:41:53 +0900
>
> Nothing happen until now...

Sorry, if it's not a patch queued in patchwork, I may or may not see it.

Rob
