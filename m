Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9905AC2BB85
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 08:00:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 762C5214D8
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 08:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgDQIAn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 04:00:43 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:34634 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729254AbgDQIAm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Apr 2020 04:00:42 -0400
Received: by mail-oo1-f66.google.com with SMTP id q204so285366ooq.1;
        Fri, 17 Apr 2020 01:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xHhu0kspZ14qeBXGO9rKCMyphZAfBrfaLwo1PwMniTE=;
        b=UZKyDVLGYP8EKwEAGmPl55vfH7ImATEHrO+osq8PkrhPGuNuRYws1z2NOFrOebb9c8
         lWjiyXKD3HewMu00fK8zFJf0+47mOkJrsz3lpxDc8qZ5LR2q448HaHdXI2e9HNq79LJs
         jtlO3NwL1NBytNSvPcq/4TPxqISaGb0r10LBGafc0CRJhHeZhlKSo0bZDAzWIAURG7H1
         glfLICFkCiMsdIfEVTPuHBUcrI6yWYNaMHFiPYsApyFH06gHPPtRHr61AZEFZ3voVhBi
         h7Rpt6bpxR9SQqweoOZhqYe/2i0jI5XF6wzBOvzMvTz80cGVwxXdIH35WD6sgAfoRk3+
         iUrA==
X-Gm-Message-State: AGi0PuYDa8i4yW6nJyzrhsMIkQTGDnSqy/xbQQM2QnwhY9p76L+F5TYQ
        iig541yMypAC5CGGwod36ZUNOSQHPOk7vuBgq7oSuZeN
X-Google-Smtp-Source: APiQypIcw/l+vgYHRaoQmnHZKfU4V4tlbrMUUMpjk5XZHHi9k+Xxr+phFeKqAp2KqMP/WxKicbFvQNxyRmCFUc/aL70=
X-Received: by 2002:a4a:4c46:: with SMTP id a67mr1536212oob.1.1587110441872;
 Fri, 17 Apr 2020 01:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <1587106953-1415-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1587106953-1415-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Apr 2020 10:00:30 +0200
Message-ID: <CAMuHMdWJRXLRf1Qk0iALaTaqw+KYThM10KEbdDWzFoQjOtPVtg@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Shimoda-san,

(not related to the json-schema conversion)

On Fri, Apr 17, 2020 at 9:03 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> +  renesas,ipmmu-main:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Reference to the main IPMMU instance in two cells. The first cell is
> +      a phandle to the main IPMMU and the second cell is the interrupt bit
> +      number associated with the particular cache IPMMU device. The interrupt
> +      bit number needs to match the main IPMMU IMSSTR register. Only used by
> +      cache IPMMU instances.

Note: Apparently the master IPMMU instance has an interrupt bit number
in the MMU Interrupt Status Register, too.  This is currently not
described in DT, as no renesas,ipmmu-main property is present for the
master instance.  Currently this doesn't matter, as the driver doesn't
use the interrupt bits at all.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
