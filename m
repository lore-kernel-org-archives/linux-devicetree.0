Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C13C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 21:05:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77DDD24680
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 21:05:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="lywlX1xn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgCBVFE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 16:05:04 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40714 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbgCBVFE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 16:05:04 -0500
Received: by mail-qt1-f193.google.com with SMTP id o10so1140464qtr.7
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 13:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HyjvmbGUrx1qLv3PKRB9uNAzBi2Wn73ynuYg2iJm3yM=;
        b=lywlX1xn0iicr0AEnMandLgLCAYqANxv1jUL4T33zxP2CJ+wI6JiEe/8K9SST/9c8M
         ztFDm5+63fwsxl3MhDnB3zVb5FMj2FvNZ6xanxyQcN1OvZjA43Xoczh/sw/GaD+R/PEu
         RNaFPxEZLANVmGSHgkPN7Tp9R/iwKiuRoQ9EjUObou1k1mMYF4bnsdM/KFyql1/7TgDN
         GKvyoLgRNfZZ8T/nCYtZRDS5/p3Hw2hi8RyD2l6blcY92VvLoDNF4/FdwmsWm6GngnZl
         +MuNnx969w6D2T6AjZ7lA2T9TMyW+IrQbASMwIwJqCCjz6kA4B6pR0fqRHQXVlB4+vz3
         A8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HyjvmbGUrx1qLv3PKRB9uNAzBi2Wn73ynuYg2iJm3yM=;
        b=AE7fejjVOd5swOsKxa6/KM1qfibcWpCEsPwJB/PnuduDQ8cATcTCg15vKAMc4Xu4Ay
         FronhErLrrKmbo8SvfEmqVpQT02kdq0isSqhp8KEnbutvmBq8wDADqhUpY5eNjq1fCQw
         +NcQeVHhuJQifiGmY6wlEAJDA0zPQ9TB7xjPdIUIEqnhzXGrNPQS/4vSCOiAAriSQ5/a
         hBZDJkXGdnfXaYjdO7BgowMfZIMJb0AaNP8sSMpLKhCdBy0kUd0apm7fl8BNNiQduuoi
         jJsRCbElthWp0W/09SGyaVE99SilCaODUUgKjZZfl9S493J/8OT1bkz5kCZJS30yerOc
         weqA==
X-Gm-Message-State: ANhLgQ3nAorviaKVQYuSM9IZXld7A8lKb1JRh9uEIC+Gd71AsTJ/sdbB
        TiiQKB7U9BBKgVLZK0sZLkaD0A==
X-Google-Smtp-Source: ADFU+vsG/0ugIV8NVdOJYhHGWfIV5vdY+NlRDT6/PuFMdZx8ckT+DF5VWnyjWgokve0J6y6T/mD/hA==
X-Received: by 2002:ac8:42cd:: with SMTP id g13mr1569714qtm.168.1583183101720;
        Mon, 02 Mar 2020 13:05:01 -0800 (PST)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id z194sm10860555qkb.28.2020.03.02.13.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 13:05:01 -0800 (PST)
Message-ID: <334242262a770f99a441f15eeba1bc55081eba40.camel@massaru.org>
Subject: Re: [PATCH v2] arm64: dts: freescale: add gpio-fan/thermal support
 for Google i.MX 8MQ Phanbell
From:   Vitor Massaru Iha <vitor@massaru.org>
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
Date:   Mon, 02 Mar 2020 18:04:57 -0300
In-Reply-To: <CAOMZO5DQ=sg9Qf7N4N9S-5DpS4EQFG1w6ZqK0nS9P3M0ghSzDg@mail.gmail.com>
References: <20200302001150.27952-1-vitor@massaru.org>
         <CAOMZO5DQ=sg9Qf7N4N9S-5DpS4EQFG1w6ZqK0nS9P3M0ghSzDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabio,

Thanks for your review.

On Mon, 2020-03-02 at 14:03 -0300, Fabio Estevam wrote:
> Hi Vitor,
> 
> Forgot to say in the previous revision, but the typical Subject
> pattern is:
> 
> arm64: dts: imx8mq-phanbell: Add gpio-fan/thermal support
> 
> On Sun, Mar 1, 2020 at 9:11 PM Vitor Massaru Iha <vitor@massaru.org>
> wrote:
> 
> >  &A53_0 {
> > @@ -373,4 +383,58 @@
> >                         MX8MQ_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B 0xc6
> >                 >;
> >         };
> > +
> > +       pinctrl_gpio_fan: gpiofanp {
> 
> Please keep the pinctrl entries in alphabetical order.
> 
> > +               fsl,pins = <
> > +                       MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5 0x01
> 
> This pad comes as 0x16 after POR, so please add it as:
> 
> MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5 0x16
> 
> > +&cpu_thermal {
> 
> Please put it prior to the &i2c1 node in order to keep the
> alphabetical order.
> 
> With these changes you can add:
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

I'll send the PATCH v3.

BR,
Vitor 

