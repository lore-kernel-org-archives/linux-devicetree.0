Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D91C3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 14:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 953A122527
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 14:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H2tl9knl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbfLLO4c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 09:56:32 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:45817 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbfLLO4b (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 09:56:31 -0500
Received: by mail-vs1-f66.google.com with SMTP id l24so1718023vsr.12
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 06:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OX4zk4wxYTktxsmTx0I1SgEecxCR7OBq76rwcWS2QcM=;
        b=H2tl9knlt3H8RgNGDBtl4J7XukIIgVP0iDZZLdpVUMwUSKgzdJG1Zz4EME71NkxtkX
         YQnCixPbi5kXFyUfqCAsAXfesEzvhYlD4JFEiFLK8tMMqdgYc6X9pLvup7iQ5I8vboK+
         HWqSdTnE712mmUu7DaEZcaG5t+8oDpHpdM2bla3yJaqZKzZKqfs8LzP9bR+JiwXBi5Me
         VXE6mzGfOEcn9/PBvhthyVj/LS0Fvqz9LNF79QXa07Tbv0xE9ns2FcaO/28LN4BRHaJw
         J45i78TCJzhKM+/CNKLjQrs1MI91VLYW1Rb5L49jSbZPWeW+We+4clJnZOdXXiZqISlu
         3xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OX4zk4wxYTktxsmTx0I1SgEecxCR7OBq76rwcWS2QcM=;
        b=PxdDkxkUspMmMODgt4vgh1J9OcNfaHh8V+wLiAWk1nT1I0oot5UhOhLiiykspPj34c
         TBDaJvfRkn4szab5NHxHS+tj/D1UrFHy1nkk6vD57pgNi8Ttvw3iWTzDdiABbfhMxq/e
         Kqn2zfd1NXw43vzolgRj0EZkKWRGDDxuHaw138+gG/0RoOF6m4wwEzOa0cPm4tJ/IjvN
         AJM8bwpiS8WU3Bjuv4gRwTY9TWrhZmHt6KYzZHxo7ejIfRlSnKZRmjNFOJXAxZQo1AuH
         G9DP+W8EVpMzZxX1yxYl/YYP6MhcJ8FgC1aB7/XqRvTwNDISEjxoB6kMXAh84ZJti1j/
         418A==
X-Gm-Message-State: APjAAAUwDU2/Uay98+F8NtsGwRrhNIE08HsPKZH+MXDgpLFxqNGEh26b
        3nxZEcTwUr0UmqfGK+r0UoPF/YKVBMjEgY74KA4l1w==
X-Google-Smtp-Source: APXvYqwfEZXZnabpRD+WvBNGhPlP1tTWmH1yYXCkCdRzn+3pp4QCG4wELwnFl0M3dm+IXwfFn2jInwxXQSj1giwhzEg=
X-Received: by 2002:a67:1447:: with SMTP id 68mr7148934vsu.115.1576162590859;
 Thu, 12 Dec 2019 06:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20191129165817.20426-1-m.felsch@pengutronix.de> <20191210095115.kxvm7elfkiw2kdem@pengutronix.de>
In-Reply-To: <20191210095115.kxvm7elfkiw2kdem@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 15:56:18 +0100
Message-ID: <CACRpkda0BCBj1LeFkWsjBPHi_4d-F+eu0tDLm9VrFbn1RyWkWA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add DA9062 GPIO support
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 10, 2019 at 10:51 AM Marco Felsch <m.felsch@pengutronix.de> wrote:

> gentle ping.
(...)
> > Marco Felsch (3):
> >   dt-bindings: mfd: da9062: add gpio bindings
> >   mfd: da9062: add support for the DA9062 GPIOs in the core
> >   pinctrl: da9062: add driver support

I can merge this to the pinctrl subsystem but then I need
Lee's ACK on patches 1 & 2 as they are to the MFD subsystem
and I think he will want me to create an immutable branch too?

As Lee is not even on the To: line I think it is unlikely to happen,
so maybe repost, stating your request for his ACK?

Yours,
Linus Walleij
