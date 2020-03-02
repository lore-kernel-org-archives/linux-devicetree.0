Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ABAC3F2CD
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 21:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E60B621D56
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 21:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="sEXyPhSB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgCBVjT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 16:39:19 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:41407 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgCBVjT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 16:39:19 -0500
Received: by mail-yw1-f68.google.com with SMTP id h6so1316039ywc.8
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 13:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8BEzvz9oitySKcp5OKoa7suFFvhmHKYouPeCm8HxVkc=;
        b=sEXyPhSBrxy8VBGgDTKwilffCgrHYIAfzVqyhWUVsjwsCIGA5ieS4gdG7DngaBQVgt
         9ttFX2WUHnNTenr2P4BVT2YPSBdjJb4CFHPhyiMnXR8G0jwHBm3740ZW8K1XfLytpwEg
         RweQlb7Bo5hpHOvuOKj8ZPShu1onab8fcao+SiC2ZP1cGJE85zkIREShJ2W0oeKl+P2A
         WgnH17WxcSNmKJAPmz+k02nldLhUk0lAjWn2W5xkyu0IbijVxg3ZmKeZ0Is1oZZ/VKPl
         U0Fi0jgVFP98O6DPW0S0sCEwZxRffkYCAEBz0nRzS9IWjg+PUGJ7swKduVpMurLOjsv+
         g5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8BEzvz9oitySKcp5OKoa7suFFvhmHKYouPeCm8HxVkc=;
        b=TJiRYE/WtyNtqpN3jHC0VB+NxXsrhNQSznAwSB+BN0e/hf+BXlVzJ1AxCHv2VxDkbK
         bSODzBGODNR9KSkRadrxLT0cnsrPSct3tMm7ZER5SbaWs3UXSx+xA0jxL3bzOjSPCJaF
         FcTKiLdYNSe1N19J6bQVQZi6iKMBRKBYBCWnFCDZHTefhatPPpU4cG+NbXRo6E8L7zBD
         mICn6GK/EgJaGrKJrW5cC+oqRnb5HqkdN+kbcHmGxFh5ClL1vb2BZY0WLen7dLyB64fb
         +xzVfYJpcAV5EA/LP64IADflwdue8saw+BVVayZMtoiSMCgzYFJDXpxpqCNJqeShzSpn
         fyBA==
X-Gm-Message-State: ANhLgQ1Ooe3qSsc7CnmqqKp8XzvRdmgBJKXI6NDMAZ/ypm9HGDFjoR1O
        b0dVY8YtqjNfYPtjmkSFRqlmVQ9yG+Mt7rH+Es62NA==
X-Google-Smtp-Source: ADFU+vumAWzaEuI+PR4QiUMQSq+I5PMgIrDF38ORvv7gu2fZRTH9d/drH7VkenQZc1i0EWZDWAOxEbt3LAldAwqI+Ww=
X-Received: by 2002:a81:7015:: with SMTP id l21mr1373795ywc.425.1583185157939;
 Mon, 02 Mar 2020 13:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20200302001150.27952-1-vitor@massaru.org> <CAOMZO5DQ=sg9Qf7N4N9S-5DpS4EQFG1w6ZqK0nS9P3M0ghSzDg@mail.gmail.com>
 <334242262a770f99a441f15eeba1bc55081eba40.camel@massaru.org>
In-Reply-To: <334242262a770f99a441f15eeba1bc55081eba40.camel@massaru.org>
From:   Vitor Massaru Iha <vitor@massaru.org>
Date:   Mon, 2 Mar 2020 18:38:42 -0300
Message-ID: <CADQ6JjXQCDEM7Ep5UsFR1eS_9FUuciURA+rH6QugzZLmmL_r1A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: add gpio-fan/thermal support
 for Google i.MX 8MQ Phanbell
To:     Fabio Estevam <festevam@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Marco Franchi <marco.franchi@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabio,

I fixed the tabs on MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5 line too.

BR,
Vitor

On Mon, Mar 2, 2020 at 6:05 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> Hi Fabio,
>
> Thanks for your review.
>
> On Mon, 2020-03-02 at 14:03 -0300, Fabio Estevam wrote:
> > Hi Vitor,
> >
> > Forgot to say in the previous revision, but the typical Subject
> > pattern is:
> >
> > arm64: dts: imx8mq-phanbell: Add gpio-fan/thermal support
> >
> > On Sun, Mar 1, 2020 at 9:11 PM Vitor Massaru Iha <vitor@massaru.org>
> > wrote:
> >
> > >  &A53_0 {
> > > @@ -373,4 +383,58 @@
> > >                         MX8MQ_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B 0xc6
> > >                 >;
> > >         };
> > > +
> > > +       pinctrl_gpio_fan: gpiofanp {
> >
> > Please keep the pinctrl entries in alphabetical order.
> >
> > > +               fsl,pins = <
> > > +                       MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5 0x01
> >
> > This pad comes as 0x16 after POR, so please add it as:
> >
> > MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5 0x16
> >
> > > +&cpu_thermal {
> >
> > Please put it prior to the &i2c1 node in order to keep the
> > alphabetical order.
> >
> > With these changes you can add:
> >
> > Reviewed-by: Fabio Estevam <festevam@gmail.com>
>
> I'll send the PATCH v3.
>
> BR,
> Vitor
>
