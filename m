From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/2] gpio: mediatek: add driver for MT7621
Date: Mon, 9 Jul 2018 13:45:22 +0200
Message-ID: <CACRpkdbWbFi-vzHqSu3T2iE89BJaQNCfZHVNvV7Crqq-TsLnmg@mail.gmail.com>
References: <1530798191-25471-1-git-send-email-sergio.paracuellos@gmail.com>
 <1530798191-25471-2-git-send-email-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1530798191-25471-2-git-send-email-sergio.paracuellos@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, juhosg@freemail.hu, John Crispin <john@phrozen.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 5, 2018 at 3:43 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> Add driver support for gpio of MT7621 SoC.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Reviewed-by: NeilBrown <neil@brown.name>

This is looking really good.

Patch applied: anything remaining can surely be patched up
in-tree.

> +/*
> + * Copyright (C) 2009-2011 Gabor Juhos <juhosg@openwrt.org>
> + * Copyright (C) 2013 John Crispin <blogic@openwrt.org>
> + */

All OpenWRT drivers are moving upstream and I like it :)
Gabo and John wrote like 90% of them on their own :D

> +#define GPIO_BANK_WIDE 0x04

Nitpick: we usually call this "stride" rather than "wide".
I changed it while applying the patch.

Yours,
Linus Walleij
