Return-Path: <SRS0=ALZF=UD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mxs2.seznam.cz ([77.75.76.125]:51940 "EHLO mxs2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727169AbfFDNNa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 4 Jun 2019 09:13:30 -0400
MIME-Version: 1.0
References: <20190604113407.8948-1-sr@denx.de> <20190604113407.8948-2-sr@denx.de>
In-Reply-To: <20190604113407.8948-2-sr@denx.de>
From: Jan Breuer <jan.breuer@jaybee.cz>
Date: Tue, 4 Jun 2019 15:00:25 +0200
Message-ID: <CAEEQaa9D0cWFNa_MtiGQ5hD4Z+0vG5ftV6etEr-dRMAW2AA1yQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Stefan Roese <sr@denx.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Jan Breuer <jan.breuer@jaybee.cz>, John Crispin <john@phrozen.org>, =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

Hi Stefan,

> +#define MT76XX_I2C_INPUT_CLOCK 40000000

This is peripheral clock and should be reachable by devm_clk_get() and
later clk_get_rate() should give value similar to
MT76XX_I2C_INPUT_CLOCK.
I don't have currently recent enough kernel to test it or prove it,
but I see this in openwrt I2C driver for this platform
https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/patches-4.14/0045-i2c-add-mt7621-driver.patch

Kind regards,
Jan
