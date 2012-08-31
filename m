From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: samsung: add devicetree init for s3c24xx arches
Date: Sat, 1 Sep 2012 00:52:11 +0200
Message-ID: <CACRpkdZws9ifr3WLKGJ-Mz0uYY5=itcd0GmnZYXBOTN7AkU=nQ@mail.gmail.com>
References: <201208252353.59345.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <201208252353.59345.heiko@sntech.de>
Sender: linux-doc-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@stericsson.com>, Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Aug 25, 2012 at 11:53 PM, Heiko St=FCbner <heiko@sntech.de> wro=
te:

> Until now the Exynos-SoC was the only Samsung-SoC supporting the GPIO=
s
> via the device tree. This patch implements dt-support for the
> s3c24xx arches.
>
> The controllers contain only 3 cells, as the underlying gpio controll=
er
> does not support controlling the drive strength on a gpio level.
>
> Tested with the gpio-keys driver on a s3c2416 based machine.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

I cannot figure out if you guys have reached consensus on this
patch or not.

I guess this will go through the Samsung tree in any case, I have no
objections from a GPIO subsystem point of view.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
