From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: fix wrong irq_banks number for H5 pinctrl
Date: Tue, 22 Aug 2017 14:49:10 +0200
Message-ID: <CACRpkdY9YraRZrfLZ7izmEyBtYsW4F4cxBewRSLznHTm3v9GvA@mail.gmail.com>
References: <20170811142735.2970-1-icenowy@aosc.io> <20170811142735.2970-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170811142735.2970-2-icenowy@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 11, 2017 at 4:27 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> The pin controller of Allwinner H5 has three IRQ banks, however in old
> versions of drivers and device trees, only two are set, which makes
> PG bank IRQ not available.
>
> If it's directly set to 3, the old device trees will fail to boot.
>
> Add a workaround (and a warning) for older device trees, and allow new
> device trees to use correct 3 IRQ banks.
>
> Fixes: 838adb576d4a ("drivers: pinctrl: add driver for Allwinner H5 SoC")
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Patch applied with Chen-Yu's ACK.

Yours,
Linus Walleij
