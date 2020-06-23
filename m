Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D830C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 09:30:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 173C220724
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 09:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="itSqhEL9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732141AbgFWJab (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 05:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731965AbgFWJab (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 05:30:31 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1771DC061573
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 02:30:31 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id a12so9188670ion.13
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oLaLVpG0MyDInMfdyKDIo+dI3RLGik3lpc5kwQdQ/vw=;
        b=itSqhEL9M1HNMjjg0HmGB6ODcp78KKoys2tcbmkfbxbnFf0gtzRbl1v0p9UyS87C8U
         yBHI8y2mDuy/mYr4ZiVTXs0cIFQwbnoQ+DZ9UbLCGrsDywa5eSErM0ZGFTcKNGqeHDAk
         I0xodIoqS41AnBblnoQzKSN47HDqK9EAE48fnMz7osH1NcTj39rXx6xxY1XJla4eeFm5
         9FR6iUvRSFkvNghRKuu/IUf2XlRd3VycKWML0IuQRexvK7ewZL+Qhna1Amw9TZZjSCfF
         4ISeQ29W2dUdLJDTabFJPAc9GXCAnZuqCrfBpDCrs8JLKV9piimbaQ8MqthMBFgCJdF3
         lHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oLaLVpG0MyDInMfdyKDIo+dI3RLGik3lpc5kwQdQ/vw=;
        b=JcjkAIHQuTHpYcE/dJDs3igTJvofHNf/fOvVBu0LpWP1nr0zASQKLQmG/QqirzlK9L
         BsBBIRYVIHVeqojY6tDPT1qlshrX1oBDZ8R7HRXxfe8MbgnWTv5Zc2T5adjgdTsyp4b5
         AVSUx9YZK0/pTIt5Xb8xGnJJ1jIbvlDxfRh1jiQ4qNmVPDtZ6Ua5SvLZ8XDTVtAp+2gu
         evfcF5uTNQa/39yIuF4H6KptOxc//lsIWBicSrWCycIUjGRxEf8jraCCW85WdXaTjLBt
         ZMq+ZBEFpT2sQ4B3+JQhX9Dfi0xZXOgU1f/tCy6iA528B7zAk//SN7NkWlgh1cZYcJpu
         DkSA==
X-Gm-Message-State: AOAM530jr7drdAoDVN40IGxGFvXXtTJhUmzZgHuGMXxiVuG0m9Qr2ehq
        gN8iBhBHcbWLm3qTlnMMHweK4dhI05J0kB0TVGqXCQ==
X-Google-Smtp-Source: ABdhPJzAIxv0yIi9GjnJO0SiHwTFon80qm+0CZass27KwI8p5hZbCaGVWbdjSE1htxm4yeVgmXJhlPla03/26+P1YPU=
X-Received: by 2002:a05:6638:979:: with SMTP id o25mr21315946jaj.24.1592904630490;
 Tue, 23 Jun 2020 02:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200622093744.13685-1-brgl@bgdev.pl> <20200622093744.13685-14-brgl@bgdev.pl>
 <20200622132504.GH1551@shell.armlinux.org.uk>
In-Reply-To: <20200622132504.GH1551@shell.armlinux.org.uk>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 Jun 2020 11:30:19 +0200
Message-ID: <CAMRc=MeXst5fOD+PJHHzXbDvf-i_jcJp_srzjH1P=Y03OPGxag@mail.gmail.com>
Subject: Re: [PATCH 13/15] net: phy: mdio: add support for PHY supply regulator
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Iyappan Subramanian <iyappan@os.amperecomputing.com>,
        Keyur Chudgar <keyur@os.amperecomputing.com>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        netdev <netdev@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        Fabien Parent <fparent@baylibre.com>,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

pon., 22 cze 2020 o 15:25 Russell King - ARM Linux admin
<linux@armlinux.org.uk> napisa=C5=82(a):
>
> On Mon, Jun 22, 2020 at 11:37:42AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Currently many MAC drivers control the regulator supplying the PHY but
> > this is conceptually wrong. The regulator should be defined as a proper=
ty
> > of the PHY node on the MDIO bus and controlled by the MDIO sub-system.
> >
> > Add support for an optional PHY regulator which will be enabled before
> > optional deasserting of the reset signal.
>
> I wonder if this is the right place for this - MDIO devices do not have
> to be PHYs - they can be switches, and using "phy-supply" for a switch
> doesn't seem logical.
>
> However, I can see the utility of having having a supply provided for
> all mdio devices, so it seems to me to be a naming issue.  Andrew?
>

I followed the example of the phy reset retrieved in
mdiobus_register_reset(). I'm happy to change it to some other name.

Bart
