From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/7] pinctrl: armada-37xx: Add gpio support
Date: Mon, 24 Apr 2017 13:48:12 +0200
Message-ID: <CACRpkdYMt2X5-c2GOAdO-dWNnLK4L66-7hns1AwwCxDcTSdADw@mail.gmail.com>
References: <cover.65d0e6796fecf1fe6c5d07b981160b54dc9b4acd.1491405475.git-series.gregory.clement@free-electrons.com>
 <83a4f4c08275b41333a2583f01ceb0453b009d9f.1491405475.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <83a4f4c08275b41333a2583f01ceb0453b009d9f.1491405475.git-series.gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 5, 2017 at 5:18 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> GPIO management is pretty simple and is part of the same IP than the pin
> controller for the Armada 37xx SoCs.  This patch adds the GPIO support to
> the pinctrl-armada-37xx.c file, it also allows sharing common functions
> between the gpiolib and the pinctrl drivers.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
