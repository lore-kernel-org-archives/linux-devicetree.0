Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB772C33CAC
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 18:05:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B35D121741
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 18:05:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB8w4JAK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgBFSFl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 13:05:41 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44458 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727662AbgBFSFl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Feb 2020 13:05:41 -0500
Received: by mail-qk1-f195.google.com with SMTP id v195so6416956qkb.11
        for <devicetree@vger.kernel.org>; Thu, 06 Feb 2020 10:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=49S47XoQqXwXHsFOLx6ntP9UXJ87XOcROvuRKpQ4giE=;
        b=TB8w4JAKd0wFrHjCM/EmjDXBTE3zK6HJRd22wZ0xRFwxDAhId7cXcDNBjK8pUIeto3
         w1oU5hSyIlXe5eR0QKfmpOHRUwAOileTKzrf2RpDfiaxMhdwTQQFl7NjYsjA8sxJabM1
         NjipRNsz3VyuEpl16r+7wiVvrzpj2HRfM3BvqfNFw2kdZGoX0jrf/vLZV2abc/cdD5Fm
         70l6LCDmbKOa55G5Wdqlc5fn9kib4uPRP7+3gPTZ0hDpnaKVFU88eoqme9xeTncJLjpL
         u0PT1fTEomStoBQBaLHmK2Af1BCxvbNArNpQMDPn/9pCuaDo+MKkesp0Ch09bZuo0SAQ
         y8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=49S47XoQqXwXHsFOLx6ntP9UXJ87XOcROvuRKpQ4giE=;
        b=hr2yNgIeHVHN6ION1BZM0dTG3aOTAd48yhhEoStxV78PLRHiVmEaQz8sYvoSPEapId
         CzcH/gUR7AVc8LFb+ceMpH9hC0Ttb8TRYWD9qKAjpe2Nfh3kWSWsR6J2YeZ+YpWZvbi7
         TPnSTd3hrSW3DdaOLniFQhylJLF/snkTEjGGWH8PqJcJSz/y+nTpF9UQslajc4uQY2sQ
         +wRnj8grAtT8SLEyLOLUWvSK6nAkW0lf8yyw8ZavM0AO7x6bf2EHw9R5jtrfZBmGfcto
         idRVDQSdKOeZdi4neftg6ph9timg8Dog6ukljmRCKCnS01FXLkpKF6YeHRzmT/lU7Xn9
         LwKA==
X-Gm-Message-State: APjAAAXT+BZmArzs2aNQKIBVenB18rrP93sUkL8gxjnKcFw9yXOKas6d
        aoabXdxrKLz+O+qkYSqvXgKOmvvy+128nYDcjwc=
X-Google-Smtp-Source: APXvYqxafw1KYCRW+g1pUzcBJs4USC+9damKNSPhYvm1gHT6c26z+rVK91B/8GCMIMexX8ouo9DdPR/UMU4gcePBv2Y=
X-Received: by 2002:a05:620a:143b:: with SMTP id k27mr3509139qkj.262.1581012338688;
 Thu, 06 Feb 2020 10:05:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580950046.git.robin.murphy@arm.com> <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
 <20200206114606.GM3897@sirena.org.uk> <ad2c941a-9724-510e-959f-3cca3cab1dc2@arm.com>
 <20200206135718.GQ3897@sirena.org.uk>
In-Reply-To: <20200206135718.GQ3897@sirena.org.uk>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Thu, 6 Feb 2020 13:05:27 -0500
Message-ID: <CAMdYzYqTEnG_Q-8SvO2R6PeaPXQ3VBKu6iVYhYvb=wK7tT7c3A@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE control explicit
To:     Mark Brown <broonie@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, lgirdwood@gmail.com,
        Heiko Stuebner <heiko@sntech.de>, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 6, 2020 at 8:57 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Feb 06, 2020 at 12:36:04PM +0000, Robin Murphy wrote:
> > On 2020-02-06 11:46 am, Mark Brown wrote:
>
> > > This makes sense but it is an ABI break so is going to need
> > > quirking for existing boards that unfortunately rely on the
> > > existing behaviour.
>
> > I guess the existing (mis)behaviour could be predicated on an
> > of_machine_is_compatible() check for Rock64 boards - it's ugly, but should
> > do the job if you feel it's more important to be 100% strict about not
> > regressing supported systems for any possible kernel/DTB combination.
>
> Yes, that's what I'm suggesting - we don't need to be exhaustive
> but having an obvious place for people to put the quirk in if
> they are affected is much better practice than just silently
> letting things break.

Might want to put a warning in there too, so that if someone is paying
attention they will see that they are using an out of date device
tree.
