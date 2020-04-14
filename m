Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C617EC38A29
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 21:49:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C91720771
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 21:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiskKmQU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440735AbgDNVsl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 17:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440734AbgDNVsX (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 17:48:23 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C215C061A0E
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 14:48:21 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id l11so1003720lfc.5
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 14:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hpWgqKZEMKAYtEzy1pWxF1ovmxOedCdsPJgCqZeJZZc=;
        b=SiskKmQUlzQlfIRqLeroGTc4op1A8Z924aUFvfgea000jB0f3mQM+qDWREzkH/xY0w
         sk7P14GIDz/2LZe9sLw8Sfd8G180xjeA6GVXLP8vDNh/dl6himkKLCMt+RSULuuJHHKk
         HOE0q+vvqkbEpfh0HOVPMH2Ss3EBiO3Wkq5mvzsjLlaYWoi1YGkEjnNNS2TpKkwDbMKt
         S0oE97q2gpb3631NmuHwWYMWzyHD2pK7rpKgzhqIvpRgnQTtU07Ub0BXivBDcJuSQ0rV
         xaKWNX+PZZm81FT8toPB1+Eg3l6F3c8lyw8y6j3LUYPHBsyKfueLahC0hwMivu6Se+WZ
         hyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hpWgqKZEMKAYtEzy1pWxF1ovmxOedCdsPJgCqZeJZZc=;
        b=uTM5D1rhLuAyBvTCjP5WItwzUjeinnLSlcVi+7ZAVxRvVkd/09JEtSBpfdbVpQm3lN
         HHvr1vxPobNPaV30fHO4ewjCclatWrqxogYApPHgt19Qm6CyJe8l/vEjIa3+ZUkcVkLu
         d0gsnoM0dBR3mhLEbaSPa6G5iRT87AkKoXm/xdfZAESbPr48V1lVKzObLIzEgRAK5ySe
         3f8mEDN2JLwA1yKM+gsQT4grSYjO8NBcQtsBjxU6gQ04hakRux+NPNG5x8Bt2GeWpt8g
         b4VOJxbP3kSz/LzvoZoDycm05P0jdKM17s0AV7rZAz7M7DLZKQtxZLZ4jjJiOKVNpkmg
         DtdA==
X-Gm-Message-State: AGi0Pua8lfzw8njHzQa8f86vPEPHvvPXb5HWwAUvM8Cgnvg1xkvBwhFG
        5CGuZe2okLsT84n69EoPPUM=
X-Google-Smtp-Source: APiQypLntGnJZtL0ubJlkyaw3rmTwB5lz961XDjd4JNK0NeYLpAByBVxvrsiVK57RJfIkqdu8ssbaA==
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr1023681lfp.4.1586900900104;
        Tue, 14 Apr 2020 14:48:20 -0700 (PDT)
Received: from curiosity (ip-195-182-157-78.clients.cmk.ru. [195.182.157.78])
        by smtp.gmail.com with ESMTPSA id b2sm6554193lfi.14.2020.04.14.14.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 14:48:19 -0700 (PDT)
Date:   Wed, 15 Apr 2020 00:52:39 +0300
From:   Sergey Matyukevich <geomatsi@gmail.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Willy Tarreau <w@1wt.eu>, devicetree@vger.kernel.org,
        Baruch Siach <baruch@tkos.co.il>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [bug report] armada-8040-mcbin: 5.6-rc5 boot failure
Message-ID: <20200414215239.GA471879@curiosity>
References: <20200413220520.GA25917@curiosity>
 <20200413222645.GT25745@shell.armlinux.org.uk>
 <20200414160354.GA463339@curiosity>
 <20200414160838.GA21435@1wt.eu>
 <20200414165533.GX25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414165533.GX25745@shell.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> > > I have not changed configuration since 5.3, so all the marvell phy
> > > drivers are in place. Is there anything in configuration that could
> > > be missed after moving from 5.3 to 5.6 kernel ?
> > 
> > FWIW mine works perfectly fine with 5.4 at 1G/2.5G/10G. From what I can
> > quickly check here are the relevant parts in my config for ethernet (not
> > sure all are needed though):
> > 
> > CONFIG_NET_VENDOR_MARVELL=y
> > CONFIG_MVMDIO=y
> > CONFIG_MVPP2=y
> > CONFIG_MDIO_DEVICE=y
> > CONFIG_MDIO_BUS=y
> > CONFIG_MDIO_BITBANG=y
> 
> Macchiatobin doesn't bitbang the MDIO bus.
> 
> > CONFIG_MDIO_BUS_MUX=y
> > CONFIG_MDIO_BUS_MUX_MMIOREG=y
> > CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
> 
> There's no MDIO bus muxing on Macchiatobin.
> 
> > CONFIG_MDIO_I2C=y
> > CONFIG_PHYLINK=y
> > CONFIG_PHYLIB=y
> > CONFIG_SWPHY=y
> > CONFIG_SFP=y
> > CONFIG_FIXED_PHY=y
> 
> CONFIG_FIXED_PHY should no longer be required.
> 
> > CONFIG_MARVELL_PHY=y
> > CONFIG_MARVELL_10G_PHY=y
> > 
> > Not tested 5.6 yet.

Thanks ! I tested mainline kernels 5.6-rc5, 5.6, 5.7-rc1: all of them
worked just fine on MacchiatoBin. After that I finally figured out what
was wrong with my setup even after updating ATF to 18.12.

Initally I used wireless-drivers-next kernel tree v5.6-rc1. It turned
out that this tree at that point included commit e1f550dc44a ("net:
mvmdio: avoid error message for optional IRQ") but did not included its
subsequent revert...

Regards,
Sergey
