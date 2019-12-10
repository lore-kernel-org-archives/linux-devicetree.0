Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B28C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 17:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54F2420828
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575999649;
	bh=whY+UczReApYurdxQ/i4Wyw13rqi5K2A0iRjpnJiQXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=E+d9Svib4A3rH7S3K5vEF+KQktF30yoN8caFxn7Q/FFY5YVng810/YrUBADNwDOPZ
	 mdJ1KYk2CxWNTEdb1QhKzFKoHs5z6V/Ye2K6+rqFZjOZHOR/KHPVT+SC+OOWWsxZD0
	 nxkmLiWI5hf3JIVCx3XEoQAA7l6x8yV+TI2fWEfI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfLJRks (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 12:40:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:59978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727527AbfLJRks (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 12:40:48 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0331E20836
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575999648;
        bh=whY+UczReApYurdxQ/i4Wyw13rqi5K2A0iRjpnJiQXU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RSLM2wWovn5TjinsaHi4oXldr2FYpJfczva1XSQczXHZXcVtTmuJMeI3o/2qVvxrg
         CWCcB8LWB6w3lF46eJOj9whirJqaigBHXXBUwLcA6g5S9jtwZA5NEY5CkFji3C/+m6
         SxJYRaoVWYZJo8AvidxxNbtlyCWGOsRLffmC0KyI=
Received: by mail-qt1-f177.google.com with SMTP id k11so3555121qtm.3
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 09:40:47 -0800 (PST)
X-Gm-Message-State: APjAAAXb/DuwLcsYPYG6Ie2Jl5EvI0RFF/7Q96x/OJqTSeWz1qfIaFG6
        ITkzjJl5Rx94tmpc3UfalfD76ydrX2nL3Gvbbg==
X-Google-Smtp-Source: APXvYqyzyYY82vf1hRBGQbrkKaCwyz61tPWJCZ5gDYUZdarnDGl6QMWtYZm4OY3BWhQ7GfEcsKv3xMQ+0OMymbZUAcE=
X-Received: by 2002:ac8:5513:: with SMTP id j19mr31095838qtq.143.1575999647203;
 Tue, 10 Dec 2019 09:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20191120145536.17884-1-robh@kernel.org> <20191210110419.GI1463890@piout.net>
 <0ea488f6-adf9-d2fe-ef55-373a70cf04fe@axentia.se> <20191210111452.GJ1463890@piout.net>
In-Reply-To: <20191210111452.GJ1463890@piout.net>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 10 Dec 2019 11:40:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKjiFG0oi22iTa4m9rdZY_d8mepdhrQT0czcGX=EryheA@mail.gmail.com>
Message-ID: <CAL_JsqKjiFG0oi22iTa4m9rdZY_d8mepdhrQT0czcGX=EryheA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: Remove leftover axentia.txt
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Peter Rosin <peda@axentia.se>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 10, 2019 at 5:15 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 10/12/2019 11:10:33+0000, Peter Rosin wrote:
> > On 2019-12-10 12:04, Alexandre Belloni wrote:
> > > On 20/11/2019 08:55:36-0600, Rob Herring wrote:
> > >> The bindings described in axentia.txt are already covered by
> > >> atmel-at91.yaml, so remove the file.
> > >>
> > >> Cc: Peter Rosin <peda@axentia.se>
> > >> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > >> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > >> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > >> Signed-off-by: Rob Herring <robh@kernel.org>
> > > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >
> > Right, this one fell of out of my memory due to overload. Sorry.
> >
> > Acked-by: Peter Rosin <peda@axentia.se>
> >
>
> Rob, I assume you are going to apply it in your tree. If you want that
> to go through arm-soc, tell me, I can apply it too.

It's already in v5.5-rc1.

Rob
