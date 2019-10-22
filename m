Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24BECA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 12:13:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1BAC21920
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 12:13:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Z1ji21Yf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388517AbfJVMNn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 08:13:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44764 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387888AbfJVMNn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 08:13:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id 21so13908446otj.11
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 05:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lTda5Ge0EByHNIbd5X5BYoVMZ38RqoZsUImPxrYPgzw=;
        b=Z1ji21Yfvsjz2p8tLXV1U2tylHt5sdFNTvnDmHcShOIwiuyupj7RKWsz7GnuJ1wmZB
         a4jNTxfUGF7c8Nqak3/5npU3IELIMIzJDl72f21NvPT/2nLR1GxpQMB5+y0L0Ywx0/YA
         nwNnrPinZj9HatAvNI04lvuCZMRPJjo14h330nvsPLYiqZt6znd7ZNnoSt31YnCH7HCD
         vQK2KNutR4qOSwM3S498G++nEMFxBsO+7jGYQViO2B9pYAHY8keqUhqRHonylQpBRifh
         499L5Bs7+8ZW3hFneqJSpqEDCmT5oLblWQ34blXCQDmwPmEhbDOKhDABULRJ1kLchUrC
         Pa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lTda5Ge0EByHNIbd5X5BYoVMZ38RqoZsUImPxrYPgzw=;
        b=cUqRMX6bn/KjTF3vzuZCZuip7TmEMyBVxoQ264iUVM4XXC+6Utix6a6fZALD+ULyf7
         bkw3/uxdmay0k1PIVH1Zvzp23DLzmzZkL7Hr5UzDtgvrIxnNSjltuxVx/XafAHmeRAuW
         7h11f/PxVuS0nNEp4/ASM7Y2Pge2BIzq07v/vXkQcrJcnT/jNqxsBZzThE7/XmIBQNAn
         m7ANZRt09BHbGIp5lFv/TQarwbGdCxU4Qcb7aar4bQxArxl+H4ZjtT5+2QbgAwkDbLnj
         dwUjrNspYk3aGuuPF43MmcYhjX9EJAStqQoWjrXkVHOxTQErVTRDIOQAZbAN+oMnS3gz
         9ClQ==
X-Gm-Message-State: APjAAAWyp4Pihjau54lmispP+IYWsQjKIao9g7UwCoZTJ/KB6SDnBOB/
        C4SyuPrx3+B6qEzZ9hCeTsO5k+9ek92cFV9Y5Gm5+sodaDU=
X-Google-Smtp-Source: APXvYqx8ckHmAQl3TNhvrytWx65vvrk83xrh73bSuCEmVamvYtkVmJR8tyNutZepz08l3tWBWYDS5rYy2nHZsr2u6cU=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr2534837otb.85.1571746421021;
 Tue, 22 Oct 2019 05:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
 <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
 <CAMpxmJU_Vws0oGf+GQCEbs-NHFCniO8c2CbXrKy9oEVC_KUhMQ@mail.gmail.com>
 <CAAFQd5D=T+x7j+Lst8AQt0epLckPJv_bXtNGs3Dk=kbdbfw53Q@mail.gmail.com> <20191022111908.GC5554@sirena.co.uk>
In-Reply-To: <20191022111908.GC5554@sirena.co.uk>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 22 Oct 2019 14:13:29 +0200
Message-ID: <CAMpxmJUtYjF7L7W_OG6AP6CuLeW_1JPcgNxyBj201GJKfb+H9w@mail.gmail.com>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
To:     Mark Brown <broonie@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
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

wt., 22 pa=C5=BA 2019 o 13:19 Mark Brown <broonie@kernel.org> napisa=C5=82(=
a):
>
> On Tue, Oct 22, 2019 at 07:33:54PM +0900, Tomasz Figa wrote:
> > On Tue, Oct 22, 2019 at 6:00 PM Bartosz Golaszewski
>
> > > > I can see that the core returns the dummy regulator if
> > > > have_full_constraints() [1]. That is always true for DT systems, bu=
t
> > > > for others it's false by default, unless someone explicitly calls
> > > > regulator_has_full_constraints() [2].
>
> ACPI systems are also always marked as having full constraints, only
> systems with board files will see this.
>
> > > Not tested yet, but from the code it looks like it will then keep
> > > returning EPROBE_DEFER which doesn't sound right really, especially
> > > since we're printing an error message too. Shouldn't it be -ENODEV?
>
> > That's an interesting finding. Liam, Mark, what's the proper way to
> > bulk get optional regulators?
>
> The ambiguously named regulator_get_optional().  This should *only* be
> used for regulators that may be physically absent in the system, other
> regulators should use normal regulator_get().  It is vanishingly
> unlikely that all the supplies for a device will be optional.

I take it that this driver should also use regular regulator_bulk_get() the=
n?

I think the question about the return value of
regulator_resolve_supply() still stands though: is it normal that it
returns EPROBE_DEFER if it can't resolve the supply on systems without
full_constraints? This will cause the driver to loop on probe
deferral, right?

Bart
