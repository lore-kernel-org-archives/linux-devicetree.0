From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 1/2] gpio: mediatek: add driver for MT7621
Date: Fri, 29 Jun 2018 16:31:35 +0300
Message-ID: <20180629133135.dohzidxjm5k7jkbn@mwanda>
References: <1530276212-18376-1-git-send-email-sergio.paracuellos@gmail.com>
 <1530276212-18376-2-git-send-email-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1530276212-18376-2-git-send-email-sergio.paracuellos@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, driverdev-devel@linuxdriverproject.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, neil@brown.name
List-Id: devicetree@vger.kernel.org

Looks pretty clean to me.  Sorry for not reviewing v1.  Smatch (private
devel version) points out a little bit of dead code.

drivers/staging/mt7621-gpio/gpio-mt7621.c:200 mediatek_gpio_irq_handler() warn: address of 'gpio_data->gc_map[i]' is non-NULL
drivers/staging/mt7621-gpio/gpio-mt7621.c:225 mediatek_gpio_irq_unmask() warn: address of 'gpio_data->gc_map[bank]' is non-NULL
drivers/staging/mt7621-gpio/gpio-mt7621.c:246 mediatek_gpio_irq_mask() warn: address of 'gpio_data->gc_map[bank]' is non-NULL
drivers/staging/mt7621-gpio/gpio-mt7621.c:266 mediatek_gpio_irq_type() warn: address of 'gpio_data->gc_map[bank]' is non-NULL

But that's harmless and very minor.

regards,
dan carpenter
