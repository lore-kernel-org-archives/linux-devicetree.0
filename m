From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: mediatek: add driver for MT7621
Date: Fri, 29 Jun 2018 15:51:05 +0200
Message-ID: <CAMhs-H9NcFrTUM+9zSSObYZPvc8sqeAgomnT3RRpRgumwe8ZzQ@mail.gmail.com>
References: <1530276212-18376-1-git-send-email-sergio.paracuellos@gmail.com>
 <1530276212-18376-2-git-send-email-sergio.paracuellos@gmail.com>
 <20180629133135.dohzidxjm5k7jkbn@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180629133135.dohzidxjm5k7jkbn@mwanda>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, driverdev-devel@linuxdriverproject.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 29, 2018 at 3:31 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Looks pretty clean to me.  Sorry for not reviewing v1.  Smatch (private
> devel version) points out a little bit of dead code.
>
> drivers/staging/mt7621-gpio/gpio-mt7621.c:200 mediatek_gpio_irq_handler() warn: address of 'gpio_data->gc_map[i]' is non-NULL
> drivers/staging/mt7621-gpio/gpio-mt7621.c:225 mediatek_gpio_irq_unmask() warn: address of 'gpio_data->gc_map[bank]' is non-NULL
> drivers/staging/mt7621-gpio/gpio-mt7621.c:246 mediatek_gpio_irq_mask() warn: address of 'gpio_data->gc_map[bank]' is non-NULL
> drivers/staging/mt7621-gpio/gpio-mt7621.c:266 mediatek_gpio_irq_type() warn: address of 'gpio_data->gc_map[bank]' is non-NULL
>
> But that's harmless and very minor.

That warnings should not being in the staging version. Last patch
series was applied yesterday... Maybe you have not run against the
updated tree?

This patch fix them:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-testing&id=bfb623c5b0935a2e4b5fe86eab79a37a37b67209

>
> regards,
> dan carpenter

Thanks.

Best regards,
    Sergio Paracuellos
>
