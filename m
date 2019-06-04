Return-Path: <SRS0=ALZF=UD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mxs2.seznam.cz ([77.75.76.125]:40509 "EHLO mxs2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727413AbfFDOnB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 4 Jun 2019 10:43:01 -0400
MIME-Version: 1.0
References: <20190604113407.8948-1-sr@denx.de> <20190604113407.8948-2-sr@denx.de>
 <CAEEQaa9D0cWFNa_MtiGQ5hD4Z+0vG5ftV6etEr-dRMAW2AA1yQ@mail.gmail.com> <0b60c94f-4a06-90f8-cdb7-1cbef090bd3a@denx.de>
In-Reply-To: <0b60c94f-4a06-90f8-cdb7-1cbef090bd3a@denx.de>
From: Jan Breuer <jan.breuer@jaybee.cz>
Date: Tue, 4 Jun 2019 16:42:43 +0200
Message-ID: <CAEEQaa-VvoJRNM7QSKJf7eNvKDAPN9OK9NWOkPr3bvnsh31+KQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Stefan Roese <sr@denx.de>
Cc: Jan Breuer <jan.breuer@jaybee.cz>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

Hi Stefan,

On 04.06.19 16:03, Stefan Roese wrote:
>
> Hi Jan,
>
> On 04.06.19 15:00, Jan Breuer wrote:
> > Hi Stefan,
> >
> >> +#define MT76XX_I2C_INPUT_CLOCK 40000000
> >
> > This is peripheral clock and should be reachable by devm_clk_get() and
> > later clk_get_rate() should give value similar to
> > MT76XX_I2C_INPUT_CLOCK.
>
> Unfortunately not (yet) in mainline Linux.

Ou, I didn't notice.

> > I don't have currently recent enough kernel to test it or prove it,
> > but I see this in openwrt I2C driver for this platform
> > https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/patches-4.14/0045-i2c-add-mt7621-driver.patch
>
> Yes, its available in the OpenWRT v4.14 tree, but not in mainline
> Linux (AFAICT).
>
> I might try to make some time to add this clock driver for these
> SoC's. But I would prefer to use the hardcoded define in this
> driver for now, to not block its usage in mainline any longer.

So it definitely makes sense to hardcode it for now.

Best regards,
Jan Breuer
