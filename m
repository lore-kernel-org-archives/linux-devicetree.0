Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC87C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 22:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B83320780
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 22:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593642510;
	bh=CQoLjCvVWSNdm1wSu07odj4x0bP83pMXj6gR1QhYTA0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=hg+P602Xl8n/EflwyCz5OP3LS1kDSjG8qSQvYoqsou+QFJTCwsUuqha4Xsu4AR8pY
	 4wNe0eCJBvKA01HFziO2XF8eMgS/yOt6XntduEQTqJaBDpMf/btlRjPhJzQI8cmqxw
	 N2r1Qii/MsTgkvqyuWuSEUuHSLke5+hyX4SVHojU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgGAW2a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 18:28:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbgGAW23 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Jul 2020 18:28:29 -0400
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8AEF20780
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 22:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593642508;
        bh=CQoLjCvVWSNdm1wSu07odj4x0bP83pMXj6gR1QhYTA0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rr6NyPFKuysi3BqpwA30/kvPI6XNFatjwE8VHD20QlyPn/NHa7Qy7MssJB4RLFzU4
         or4iJTeNx6oobg6pS9A3iZFYtp4Fu6HsN+mHhd83JaKofy2V4jHV1enj2e+FWJVxvv
         sNFgCtA+mEOg0IehUtdcGlM3NFL/5B2Bqt4ZrjFU=
Received: by mail-ot1-f50.google.com with SMTP id 72so22680757otc.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 15:28:28 -0700 (PDT)
X-Gm-Message-State: AOAM531Rp9VmVV1gHpxgtyWJbMxMLnb3cNGsBDriDab9bfMqHjSm76kV
        77x8qnsnPiWPqqmnmy8y3Ozu1vp+/3XPpC9Bhg==
X-Google-Smtp-Source: ABdhPJzNc0YwqiAvVov7e4Lfkj5nA8eHsEAJmp5uOMLSsbhI8wcaqnnf2Dc6U3W9pLQJ2XIUTNtfDgEH5XByiXRy1hw=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr24830173ots.192.1593642508080;
 Wed, 01 Jul 2020 15:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200630223020.25546-1-festevam@gmail.com> <159364215574.10630.10014931369710772889.b4-ty@kernel.org>
In-Reply-To: <159364215574.10630.10014931369710772889.b4-ty@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 1 Jul 2020 16:28:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLzae5qUJXF-otsUQqy+zyk9fD_AKd8b8F+PFWZBH1QDw@mail.gmail.com>
Message-ID: <CAL_JsqLzae5qUJXF-otsUQqy+zyk9fD_AKd8b8F+PFWZBH1QDw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Fix 'make
 dt_binding_check' warnings
To:     Mark Brown <broonie@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 1, 2020 at 4:22 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, 30 Jun 2020 19:30:20 -0300, Fabio Estevam wrote:
> > The following build warnings are seen with 'make dt_binding_check':
> >
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:209.46-211.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@0: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:213.37-215.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@1: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:250.42-261.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:263.42-288.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:270.32-272.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@0: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:273.23-275.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@1: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:276.23-278.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@2: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:279.23-281.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@3: node has a unit name, but no reg or ranges property
> > Documentation/devicetree/bindings/sound/simple-card.example.dts:290.42-303.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@2: node has a unit name, but no reg or ranges property
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Can you apply this for v5.8 or drop and I can apply with all the other
warning fixes I have queued. This is the last one.

Rob
