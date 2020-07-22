Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC78EC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 18:47:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9B5120737
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 18:47:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iBmDF3hj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730843AbgGVSrJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 14:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgGVSrI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jul 2020 14:47:08 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27470C0619DC
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 11:47:08 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n26so3388490ejx.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 11:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b2zFqQtiWwwuE6o9MvMdIIP5I5L8PSSMkB6993UVu0s=;
        b=iBmDF3hjSsRa6Z5hBuqlaIf7wp1GV52U9qLVLrSsEgsxt9F2iM6agbXvz7L3DZ4atl
         n3OuHERMh75DPJylM80/qtiQJpgOB+xofzbsUz45Y1NPB2XrYpR+zxrVjPmer1lsGrA5
         CSHAPcboEjilCMNrWp2EdAbabKvUmaL7phqLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b2zFqQtiWwwuE6o9MvMdIIP5I5L8PSSMkB6993UVu0s=;
        b=sJ0ZjwCyeaXfmQqXkwm/nzuDpOufAHYCr+MHCCSPjqBPO4bCwaHmK3IQa+pJ34JxyL
         FvTF3w5b4o9iirTZXEYFfGau+8A+yoZFSESO9pKNKIrkuL5fOAV6VYOFo8+YNxL/ta6M
         Zc3FRxC3Otv4bw4nmBOujlSQ7zDiJYKTZ8mNVSJsrb2xCH3stMODsrM6AfE0F65+o1fJ
         XnzeXGseQ7DXSPCByD8Xmo6VpNQmPqQMBWzHIq4AtmyX9O/hbaCvOvolGtHS8n5aj56p
         NRDzMn8WJMfEDx+kMMRPLpnTQ3k12+kfouMEPMmQR5fXZZ8uxPg2HSp9/tpuVPOcVMNo
         hBAQ==
X-Gm-Message-State: AOAM533rCbi2LHI0PJE5dZTyA0qmfpz3fNYOVB3nszklgY6MGP4UaP4t
        kRHYrsA28EaLm1PzS/27rWghTvKfcms0liBW2kdzxw==
X-Google-Smtp-Source: ABdhPJzLFI+oPv2wEswSdyyLhvpgYCiA11cxdmWi82y6TH/j8fu6kVApfWE7FZ1zGbwKm4FVEwTgwrG1hZElm2OQ25M=
X-Received: by 2002:a17:906:950c:: with SMTP id u12mr899107ejx.37.1595443626883;
 Wed, 22 Jul 2020 11:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200720105846.367776-1-jagan@amarulasolutions.com> <8444056.acRTkLjuym@phil>
In-Reply-To: <8444056.acRTkLjuym@phil>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 23 Jul 2020 00:16:55 +0530
Message-ID: <CAMty3ZCxynb3_GTxhf=Nrf=F=SbijqEfDVysCzQ1KXsF_MCjxw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: rockchip: Add usb host0 ohci node for rk3288
To:     Heiko Stuebner <heiko@sntech.de>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        William Wu <william.wu@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Heiko,

On Thu, Jul 23, 2020 at 12:04 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Jaganm
>
> Am Montag, 20. Juli 2020, 12:58:46 CEST schrieb Jagan Teki:
> > rk3288 and rk3288w have a usb host0 ohci controller.
> >
> > Although rk3288 ohci doesn't actually work on hardware, but
> > rk3288w ohci can work well.
> >
> > So add usb host0 ohci node in rk3288 dtsi and the quirk in
> > ohci platform driver will disable ohci on rk3288.
>
> If I remember the discussion correctly, we expect the board dts
> or the bootloader to enable the ohci, right?
> So that block go away ... just making sure, I don't remember
> untrue stuff ;-)

Our (with Robin) initial discussion [1] is to manage OHCI enablement
in the bootloader but since it requires many checks at bootloader
level we finally rely on board dts to enable it as normal.

[1] https://lkml.org/lkml/2020/7/3/424

Jagan.
