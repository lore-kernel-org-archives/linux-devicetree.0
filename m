Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE03C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:02:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A536820706
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:02:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Euc8qOQr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbfKYWCx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 17:02:53 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33726 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfKYWCx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 17:02:53 -0500
Received: by mail-oi1-f195.google.com with SMTP id x21so7575838oic.0;
        Mon, 25 Nov 2019 14:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lzw1koOlG6AU/5fLlo3Vm5FYX8EGSzhUjEGJB0YbmZI=;
        b=Euc8qOQryfLxQGHFEmQspkPxC5+krVH0fJqiVlzF/VBEUJZ77CwlRrhVWol+93ELp+
         3tXRgpl+gI9iHklzMUyyAKdGwZPbninkagQyjKK2c9FJeers6WbSTLt/E9vL00IZ/JOD
         b9no+vQduOZ7CoAvlRR22JSGsNietL09Npvy9t5NfxiEFXe9MVXuFekcqXoGSmpsYbrN
         RHa+Nl3eqAZsQriZ/q8HkHkGHj86A/zF4eEXlq+RYAkJJrYUApHE34RXkJjXf7OLizyw
         CBWb4Ds9a93pNbBtfTADm9RGWhynlJId5mBtvvksMTDa/axGG8rAAvyTT9uu4Gh+Ozw1
         PIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lzw1koOlG6AU/5fLlo3Vm5FYX8EGSzhUjEGJB0YbmZI=;
        b=hnI0c11fe4rzSaa8GN7jQGnED5YHXhkGc6EopXNEG5fqB4k7mNt88a5XtyvvAiHHKM
         qyfFuxzuxCuLYJEIAAYY87FPt6e7Bhsx9hR4rX5xUil0k5ITZBltIBeuvdz9JeqwyJZJ
         4SPyRdNnzxJyWrstLyRWozJrI/+PCTSaYKBpdMGXR38sJNbXoUCY8Vmdpuht9m9CjD+D
         f1esUzyUl0ayboimXwZv7cJVC+taiSitWEmY+WdQkbYGkk1XqzawH+2Ju+Jh2KC45Ies
         M17E0Ui9OXcK32+ewyojgqIDbYDDfMNInzQ/W3dS4WcoMaWvArklhnQu4GTI7/Isshsd
         fBSw==
X-Gm-Message-State: APjAAAVXs12dWS3pfx8LA4BNivCJjDA1r+nNHRnSfpHti7253LhTrBjN
        NGvNej2W47nCYDHF/BHb03vOZs56HNCIigiCKZA=
X-Google-Smtp-Source: APXvYqz2+uidMUMLdNPqKNBo+rgLlQc8P1ma/5QS/iXoES2Nu/oybeV80n0xcKuG+JaAuSMC59DQ4pufmrhKpQozzCc=
X-Received: by 2002:aca:110f:: with SMTP id 15mr911822oir.47.1574719371254;
 Mon, 25 Nov 2019 14:02:51 -0800 (PST)
MIME-Version: 1.0
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCDA=ZekRC0hgQnPLRZM3LMnqBZ6TWCvXhyixAmgDyTAsw@mail.gmail.com> <5c0029ec-7377-4c1a-0062-3b59a87f8dea@amlogic.com>
In-Reply-To: <5c0029ec-7377-4c1a-0062-3b59a87f8dea@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 25 Nov 2019 23:02:40 +0100
Message-ID: <CAFBinCBypbB4W42GOAc8ejAYHVQLTDRdat_z_L92TZvC2p+5rQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: meson: Add support for USB on Amlogic A1
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hanjie,

On Mon, Nov 25, 2019 at 8:53 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>
>
>
> On 2019/11/22 15:52, Martin Blumenstingl wrote:
> > Hello Hanjie,
> >
> > On Fri, Nov 22, 2019 at 7:55 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> > [...]
> >>   dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
> >>   dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
> >>   phy: amlogic: Add Amlogic A1 USB2 PHY Driver
> > drivers/phy/amlogic/phy-meson-g12a-usb2.c seems very similar to the A1
> > USB2 PHY you are introducing here.
> >
> >>   usb: dwc3: Add Amlogic A1 DWC3 glue
> > drivers/usb/dwc3/dwc3-meson-g12a.c is also very similar to the dwc3 glue.
> >
> > I have two questions:
> > - how is the PHY and the dwc3 glue different from G12A (or SM1)?
> > - why do we need a separate set of new drivers (instead of updating
> > the existing drivers)?
> >
> > We try to use one driver for the same IP block, even if there are
> > several revisions with small differences (for example the SAR ADC
> > driver supports all SoC generations from Meson8 to G12A/G12B/SM1,
> > because 80-90% of the code is shared across all revisions).
> >
> >
> > Martin
> >
> > .
> >
>
> Hi Martin,
>
> thanks for the comment.
>
> 1, G12A have usb2-phy0/usb2-phy1/usb3-phy0 three phys and an interrupt to support host/peripheral/otg modes.
>    A1 has one usb2-phy0 phy and only support host mode.
dwc3-meson-g12a treats PHYs as optional
so if you only pass "usb2-phy0" and skip usb2-phy1/usb3-phy0 then it
will still work fine
(I didn't check whether the binding also reflects this)

> 2, G12A glue/phy drivers are for G12A SoCs, there are some diffrences to A1.
>    G12A glue driver have dr_mode and interrupts two attributes to support otg mode while A1 hasn't this requirement.
dwc3-meson-g12a ignores the interrupt for HOST-only mode
(I didn't check whether the IRQ is optional in the dt-binding)

>    G12A glue driver has a hard coding vbus regulator code to support otg mode while A1 hasn't this requirement.
my understanding is that whether a board has a VBUS regulator depends
on the board design. it has nothing to do with the SoC itself

>    G12A glue driver has a hard coding support phys while A1 only supports host mode.
>         enum {
>                 USB2_HOST_PHY = 0,
>                 USB2_OTG_PHY,
>                 USB3_HOST_PHY,
>                 PHY_COUNT,
>                 };
this goes together with comment #1 - you can skip USB2_OTG_PHY and
USB3_HOST_PHY and the driver should still work fine

>    G12A glue driver only supports one clock while A1 needs four clocks.
indeed, the dwc3-meson-g12a needs to be updated to support this
I don't think that I have used it myself yet but there's the
clk_bulk_data framework
it seems to fit this use-case pretty well: define an arbitrary number
of clocks for G12A/B an another set of clocks for A1 - then use the
clk_bulk_data framework to enable/disable them all at once

>    G12A and A1 phy drivers have different register configurations since hardware differences.
other drivers have similar requirements: (mostly) identical register
layout but different values per SoC
here are two examples (I'm not sure if they are good examples though):
Lantiq/Intel SoC [0] and Allwinner SoCs [1]

I compared your driver with phy-meson-g12a-usb2 and only found four differences:
1) PHY_CTRL_R18_MPLL_DCO_CLK_SEL is set for A1
2) PHY_CTRL_R13_UPDATE_PMA_SIGNALS is not set for A1
3) PHY_CTRL_R21 is updated twice for A1 (once for earlier gen SoCs)
4) A1 doesn't reference the "xtal" clock

Difference 4) seems to be a general problem because there seems to be
a PLL inside the PHY registers and that PLL must be fed by some input
clock
So I believe that there is some clock input (which is currently
missing from your A1 USB2 PHY driver)

> 3, We have estimated these differences and we thought it's more clear and readable to have a dedicated glue/phy
>    driver for A1 SoCs, so also dedicated dt-bindings.
I think we should separate the driver and dt-bindings

Based on what I have seen so far my preference for the PHY is:
- use the existing dt-binding, because it seems to be the same IP
block with different register configuration
- use the existing driver because there are only three different
register values (to me it feels like a dedicated driver for these
means more overhead for little benefit)

for the glue I think:
- extend the existing dt-bindings and make some of the PHYs and the
interrupt line optional. making the PHYs optional will be needed when
adding GXL/GXM/AXG support anyways
- use the existing driver and make the clock inputs depend on the SoC
- everything else should already work as is

please let me know if I missed something:
comparing/reviewing the new and existing drivers is harder than just
copying the existing one and modifying that copy
(this is one of the reasons why I think that duplicating code makes
the drivers harder to maintain)

I also thought about the negative consequences of extending the
existing driver(s).
modifying the existing code could break the driver for existing boards.
however, I think that is not a problem because BayLibre's Kernel CI
labs have good coverage for G12A, G12B and SM1.
so if you add some A1 boards there (or host your own lab with A1
boards) any breakage will be found early (the Kernel CI bot even does
git bisect and sends emails)


Martin


[0] https://github.com/torvalds/linux/blob/d2912cb15bdda8ba4a5dd73396ad62641af2f520/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c#L47
[1] https://github.com/torvalds/linux/blob/c942fddf8793b2013be8c901b47d0a8dc02bf99f/drivers/phy/allwinner/phy-sun4i-usb.c#L862
