Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9290C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 21:44:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B77FC2071A
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 21:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590788654;
	bh=AhZEqcIqoU3XCYXoKIAeYmUZg7CdTdaOgkemT7fqeYE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=T1YGfkJ6yOLOXW56m6r7jIUZIwmLmzZcJEqnuUsUfjQ5purxeVtjG979Iwe7eAqUK
	 pbhPrCsqwfO9ltKFyTnmAj+vDg/ieQcWhT6S1G5r4gENybDUPcPGbBjTjXBBQdyb6i
	 3u5ocKslvcBNBQnqtZEjJdAo7owQWmCi/3bj2YGE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgE2VoO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 17:44:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:44420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728138AbgE2VoO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 29 May 2020 17:44:14 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 002502071A
        for <devicetree@vger.kernel.org>; Fri, 29 May 2020 21:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590788653;
        bh=AhZEqcIqoU3XCYXoKIAeYmUZg7CdTdaOgkemT7fqeYE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gXoD01IFLcKFd5chvrWy20PNIl1FvszTW18mRFqTmrYcw6pSE6x5nQg5vIGAQqUUD
         XTVy0PuCuxa7Cw4ZeS06sUNhCYi/MxmQ+Y17gWWoSR+llDUNHcE1nvgnmJpIKtwk0S
         w6KuCgTgttawM1cx5edEjfcodGjfxfSRPyvYzsc0=
Received: by mail-ot1-f49.google.com with SMTP id m2so1153294otr.12
        for <devicetree@vger.kernel.org>; Fri, 29 May 2020 14:44:12 -0700 (PDT)
X-Gm-Message-State: AOAM532y2zoBjPhRrJZHSv6VTu+R2MKQTgCVkOyO2FuO2kwNVaE61mYJ
        Amhy611CzUx87L7tkoPoRMkv0aZJcNH31pB9LA==
X-Google-Smtp-Source: ABdhPJyKXSGm0uMa6anJydAADQvJ14ipR6NcNxYg0/WWgS7j2NvtMClo/gTCT9AeW4R4g1S31JjbLkyJEBgcyGpN85o=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr7960663ots.192.1590788652195;
 Fri, 29 May 2020 14:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200528132323.30288-1-geert+renesas@glider.be>
 <CAL_JsqJOPd2txkz298Rs12N+keJNYg2_qjCc-3vDwtL5iNXZmA@mail.gmail.com> <CAMuHMdU-FKoO+8cM2FOZRvENTuCEK02C=Si-bUiNCVrrp10qBA@mail.gmail.com>
In-Reply-To: <CAMuHMdU-FKoO+8cM2FOZRvENTuCEK02C=Si-bUiNCVrrp10qBA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 29 May 2020 15:44:00 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+goALPsbhQ=Euh7fUupfC1gXO+AZXR=Obm9G_zMN7q4A@mail.gmail.com>
Message-ID: <CAL_Jsq+goALPsbhQ=Euh7fUupfC1gXO+AZXR=Obm9G_zMN7q4A@mail.gmail.com>
Subject: Re: [PATCH dt-schema] Fix interrupt controllers with interrupt-map
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 29, 2020 at 10:02 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Fri, May 29, 2020 at 5:54 PM Rob Herring <robh+dt@kernel.org> wrote:
> > On Thu, May 28, 2020 at 7:23 AM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > When an interrupt controller has an "interrupt-map" property, an "is
> > > valid under each of" error is triggered.
> > >
> > > Fix this by allowing "interrupt-controller" and "interrupt-map" to
> > > coexist, in both the interrrupts meta-schema and the
> > > interrupt-controller schema.
> >
> > But both should not be present. If 'interrupt-controller' is present,
>
> Why not?

Well, maybe I'm wrong. If you have more than just transparent
remapping (i.e. mask/unmask/clear), then perhaps both are appropriate
because you want get the irq domain for the first irq parent.

> > the Linux irq parsing code will ignore 'interrupt-map'. Seems like
> > that's backwards, but this parsing code is older than dirt and we'd
> > probably break some 1990s machine changing it.
>
> That's fine.  rza1_irqc_parse_map() parses the interrupt-map itself,
> to map from downstream to upstream interrupts.

You shouldn't really be parsing interrupt-map yourself. The code there
doesn't account for #address-cells which can be a factor for
interrupt-map. dtc is gaining some checks for 'interrupt-map', so
let's hope you have it right.

Rob
