Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4E1C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 09:37:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9136A205ED
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 09:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lCHh5BlR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfLJJh1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 04:37:27 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:38542 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfLJJh0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 04:37:26 -0500
Received: by mail-ua1-f67.google.com with SMTP id z17so6929896uac.5
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 01:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uCytU3M00vgppQHFdUfwUVTCWccLfFwVZT8F9TsGTdM=;
        b=lCHh5BlRESGFd8IJw3pd1l7zQCwFYi9SIVuZFu2W54pNbR2iW2Ic1sRAzJQzShL+V8
         FhndlgDjLhVagoGevcG/kw8XbnLp28EXuw2/Xg3DVYY3SagNVnO4Cn+FmvNTGYE5olT2
         g1TXLaqWyF10MT3XiskpBKKxDaApmX0A/elIkUrQMpK1xVMvFR2hUc+8XTF0e9kJvvcH
         U3MHLUQcu6nhmTRgP16una9achLbMN+1uc57r3BdGo3Ugy8I5nseuohBp2cFX8+NHq11
         YNv9Fk4nAaJNRjJGET0HwK8mBFY+nJhevmfoHDEly0HWcp84CoabM7lydd4+l0wWh95x
         VJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uCytU3M00vgppQHFdUfwUVTCWccLfFwVZT8F9TsGTdM=;
        b=STudD7aXbApRsURSF+Ic6fIcKRH6v8Eb7wZWFWiHq4hsqDzAde4In8Tw+2Qne7+xIU
         W2buBiyzm7wIEjK75FQwRI7ytYvXOXyw1ZmUnvMy3MhQ13gnmauzBTb4ywASvT3XRRpM
         95hrWeyAG5xm/02zqP0mL+5UkeMmepDSCdv79PZtWj9/loLwgSFQa86RL25s6L4qbQgO
         MTc5wpdmOhdlx6TAAezGfZ2guLKlIMBVxW8GL5ldZEYuQnh+V1uV+ehJavjCwohz1509
         vHJ91nkS0CR16y5a4+H6TbDrIoEARWHsRfI0PoPgHADjcS5YC4x10nnaDDxmsqH+3JCk
         V5NA==
X-Gm-Message-State: APjAAAVUhzYP8Lpr05jln6ijOjIQoB1NKGA4oM4BE0FzIlpL+DytI0Y/
        mJtJV3hvINa2DOUbSOqsD5RU5dwovwuqs4xraUNNMA==
X-Google-Smtp-Source: APXvYqw8/vUxHXJk8srw/I46Ax82pbKgk3Cmvfv6WFW1zub4DRuJ6pt9rcaoDRoxeYXRCfvktNah3Ok5+A/sr3ZmrXw=
X-Received: by 2002:ab0:4ea6:: with SMTP id l38mr28555420uah.129.1575970645669;
 Tue, 10 Dec 2019 01:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20191202144104.5069-1-jun.nie@linaro.org> <20191202144104.5069-5-jun.nie@linaro.org>
 <20191202175202.GA6488@infradead.org> <CABymUCM09L3TfLsPhLWPkoYXJ6OVGhHvd9_o4FCO07_Z3Y6A8w@mail.gmail.com>
 <20191203073620.GA360@infradead.org> <CABymUCNHMKvVCkKdwnOcDZC9rNhLTEHLfLoH_O+CEf9XuZY+_A@mail.gmail.com>
 <20191204150043.3a82cec0@xhacker.debian>
In-Reply-To: <20191204150043.3a82cec0@xhacker.debian>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 10 Dec 2019 10:36:49 +0100
Message-ID: <CAPDyKFrreSgNfHX9hSKvYO7UxBEyqu0DSxX9NGp4phbR-F1fxQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] mmc: sdhci: Add DMA memory boundary workaround
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Christoph Hellwig <hch@infradead.org>
Cc:     Jun Nie <jun.nie@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 4 Dec 2019 at 08:14, Jisheng Zhang <Jisheng.Zhang@synaptics.com> wr=
ote:
>
> On Wed, 4 Dec 2019 14:00:08 +0800 Jun Nie wrote:
>
> >
> >
> > Christoph Hellwig <hch@infradead.org> =E4=BA=8E2019=E5=B9=B412=E6=9C=88=
3=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=883:36=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Tue, Dec 03, 2019 at 11:29:15AM +0800, Jun Nie wrote:
> > > > Thanks for the reminder! So I need to parse the segment_boundary fr=
om
> > > > device tree and use below code to set it, right?
> > > > For the max_segments accounting error, I did not see it so far thou=
gh I
> > > > believe it is true in theory. Maybe it is due to segment boundary v=
alue is
> > > > very large.
> > > >
> > > > +++ b/drivers/mmc/core/queue.c
> > > > @@ -374,6 +374,7 @@ static void mmc_setup_queue(struct mmc_queue *m=
q,
> > > > struct mmc_card *card)
> > > >                 WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
> > > >                                                         mmc_dev(hos=
t)),
> > > >                      "merging was advertised but not possible");
> > > > +       blk_queue_segment_boundary(mq->queue, mmc->segment_boundary=
);
> > > >         blk_queue_max_segments(mq->queue, mmc_get_max_segments(host=
));
> > >
> > > Yes, I think should do it.  Maybe modulo a check if the low-level
> > > driver actually sets a segment boundary.
> >
> > For the block device, such as SD card, it is right solution. But I
> > have concern on SDIO case. Maybe we should add workaround together
> > with block layer segment boundary restriction. How do you think about
> > it?
> >

Yes, buffers for SDIO are a consern. Especially since those buffers
are allocated by SDIO func drivers or even from upper layers, such as
the network stacks, for example.

I think SDIO func drivers simply need to respect the constraints the
host has set via the .segment_boundary, .max_seg_size, .max_segs, etc.
We should export SDIO func APIs to make the information available for
the SDIO func drivers.

>
> Another trouble is how to workaround if the sg is constructed by mmc and
> no block layer interactions at all. e.g __mmc_blk_ioctl_cmd(), and all
> those sgs in mmc_test.c

Those should be easier to fix, as the buffer/sg allocation can be
fixed internally by mmc core. Just post some patches. :-)

I am more worried about SDIO, as those buffers are not that easy to control=
.

Note that, there have been suggestions on adding an SDIO interface
where an sg can be passed [1]. Unfurtunate those patches got stuck and
didn't make it.

Kind regards
Uffe

[1]
https://patchwork.kernel.org/patch/10123143/
