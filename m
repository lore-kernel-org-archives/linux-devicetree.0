Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36197CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 15:42:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 060CF205C9
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 15:42:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NhW+MIN9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387731AbfJVPmp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 11:42:45 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41192 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387716AbfJVPmp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 11:42:45 -0400
Received: by mail-ot1-f66.google.com with SMTP id g13so14573948otp.8
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 08:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jm/Xl9/34Vwl6Ga29hMrEteCAU4iE0Ifnw+ZCozjmqY=;
        b=NhW+MIN9NBxQj3UlVLFIMOShYenXqKE5K7WlBP5wSNdk7JHAbDvblbrtVnkFb8w7Vw
         g6WgBlIiG6xLzIKaBeEHtYL+oPHqLC1tOtL8kClpYetNONYFGhpnus9m1zZuFGnrZZ58
         qN9bEtD81dnVjhXqMZJ/1OiFpDLwSi5j8dFmyL/ArQx3lbxLhFC/UFC5AyR9pp02Ahp3
         qTR6ed26ffoiwN4MZVTuON4hjij2alEbkNyVKY8w64i1z/zak9+irXraRRmlTPHLgWMu
         /M5LZLdJXaQzouuqZhgbtDyr6EF/dMekbpd4kSgXHa1WuKrdo8mhtRFfC04seurI0N9l
         K9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jm/Xl9/34Vwl6Ga29hMrEteCAU4iE0Ifnw+ZCozjmqY=;
        b=l0yC51/whw1n7hgkRf9XqVHQzdRf6jDpkJapDsogoeMBk0rCI+QviaXGhZdXCHyrT/
         bxUUcES74zg2DDsNEUenOFjvvaJPMt+cdOTftefYEQGsdVHEMhfPDSjNwmNDt5LW+sye
         M91nO52rAttir8gmnKIeF6q1dlBwQMHX4ZKjCtRflU/VhQLEwMh3mUG1NhS/i0uBeeS1
         pJdy3pAdBC+QtnvYWwseMx8jpGQI4cXrWf2Oy4DHAzbBUQL2ASH7jKyiwk3UC3MoJdqh
         +8XiCkurWyFfbbyr1tu8NXoi953BRxWmZZp7e83fh9ZkSGEHjVXks9NlS2N3yrz/bSF3
         5QeQ==
X-Gm-Message-State: APjAAAVReypSvHQa0h+pm3mdT7wScha339ouzH2PIkeHZfflaO7BKPAf
        eaNjy+Ym4K7IjNyEToNb5ORpw+jG1RFot4DDLMtWdg==
X-Google-Smtp-Source: APXvYqxxM4cntE/lC2zDpxcAEH7bAYwyzDXjwtYskjG70T1GIfUcpMm2S3GK7g1oGQoS5xsgdm82LzsXbQ08jRrtN/M=
X-Received: by 2002:a9d:7d09:: with SMTP id v9mr3346639otn.292.1571758964454;
 Tue, 22 Oct 2019 08:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
 <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
 <CAMpxmJU_Vws0oGf+GQCEbs-NHFCniO8c2CbXrKy9oEVC_KUhMQ@mail.gmail.com>
 <CAAFQd5D=T+x7j+Lst8AQt0epLckPJv_bXtNGs3Dk=kbdbfw53Q@mail.gmail.com>
 <20191022111908.GC5554@sirena.co.uk> <CAMpxmJUtYjF7L7W_OG6AP6CuLeW_1JPcgNxyBj201GJKfb+H9w@mail.gmail.com>
 <20191022150346.GF5554@sirena.co.uk>
In-Reply-To: <20191022150346.GF5554@sirena.co.uk>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 22 Oct 2019 17:42:33 +0200
Message-ID: <CAMpxmJUqapF79TuhAbGeaZbnjyHo=-gbb-MT-PkX829myU3kGQ@mail.gmail.com>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

wt., 22 pa=C5=BA 2019 o 17:03 Mark Brown <broonie@kernel.org> napisa=C5=82(=
a):
>
> On Tue, Oct 22, 2019 at 02:13:29PM +0200, Bartosz Golaszewski wrote:
> > wt., 22 pa=C5=BA 2019 o 13:19 Mark Brown <broonie@kernel.org> napisa=C5=
=82(a):
>
> > > The ambiguously named regulator_get_optional().  This should *only* b=
e
> > > used for regulators that may be physically absent in the system, othe=
r
> > > regulators should use normal regulator_get().  It is vanishingly
> > > unlikely that all the supplies for a device will be optional.
>
> > I take it that this driver should also use regular regulator_bulk_get()=
 then?
>
> It's really up to whoever maintains the driver but I'd recommend it
> since it tends to be easier.
>
> > I think the question about the return value of
> > regulator_resolve_supply() still stands though: is it normal that it
> > returns EPROBE_DEFER if it can't resolve the supply on systems without
> > full_constraints? This will cause the driver to loop on probe
> > deferral, right?
>
> Yes, that's right.  The idea is that anything using regulators will call
> that once it's finished setting up constraints, if you're not using
> regulators at all you should compile out the API entirely.

Ok, makes sense. Thanks Mark!

I'm just wondering if all boardfile-based systems actually do call it.
I recently had to sent a fix for old DaVinci boards where the lack of
this call caused one of the GPIO expanders to fail to probe.

Bibby: in that case please remove the entire has_supplies checking and
just rely on dummy regulators.

Bartosz
