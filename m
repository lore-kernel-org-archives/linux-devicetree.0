From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: mediatek: add driver for MT7621
Date: Mon, 9 Jul 2018 15:28:50 +0200
Message-ID: <20180709132850.GB2529@foobar>
References: <1530798191-25471-1-git-send-email-sergio.paracuellos@gmail.com>
 <1530798191-25471-2-git-send-email-sergio.paracuellos@gmail.com>
 <CACRpkdbWbFi-vzHqSu3T2iE89BJaQNCfZHVNvV7Crqq-TsLnmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbWbFi-vzHqSu3T2iE89BJaQNCfZHVNvV7Crqq-TsLnmg@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, juhosg@freemail.hu, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 09, 2018 at 01:45:22PM +0200, Linus Walleij wrote:
> On Thu, Jul 5, 2018 at 3:43 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> 
> > Add driver support for gpio of MT7621 SoC.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > Reviewed-by: NeilBrown <neil@brown.name>
> 
> This is looking really good.
> 
> Patch applied: anything remaining can surely be patched up
> in-tree.
>

Sound good, thanks.

Should I send a patch to remove the driver from staging or just
is removed by Greg? How is this achieved?
 
> > +/*
> > + * Copyright (C) 2009-2011 Gabor Juhos <juhosg@openwrt.org>
> > + * Copyright (C) 2013 John Crispin <blogic@openwrt.org>
> > + */
> 
> All OpenWRT drivers are moving upstream and I like it :)
> Gabo and John wrote like 90% of them on their own :D
> 
> > +#define GPIO_BANK_WIDE 0x04
> 
> Nitpick: we usually call this "stride" rather than "wide".
> I changed it while applying the patch.

Thanks :-)

> 
> Yours,
> Linus Walleij

Best regards,
    Sergio Paracuellos
