From: Hongwei Zhang <hongweiz@ami.com>
Subject: [v1, 0/1] gpio: dts: aspeed: Add SGPIO driver
Date: Wed, 25 Sep 2019 15:20:48 -0400
Message-ID: <1569439248-10430-1-git-send-email-hongweiz@ami.com>
References: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Cc: Hongwei Zhang <hongweiz@ami.com>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Doug Anderson <armlinux@m.disordat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> 
> > The related SGPIO driver has been accepted and merged into v5.4:
> > _http://patchwork.ozlabs.org/patch/1150357/
> 
> Oh what a mess, it didn't add the necessary code into Kconfig and Makefile, also names it sgpio-gpio.c 
> when everything else is named gpio-sgpio.c.
> 
> I guess I have to fix it up. My fault for missing.
> 
> Linus Walleij

Thanks Linus,

It's not your fault, I misunderstood a earlier comment from another 
reviewer and thought I should wait until the driver is accecpted, 
and then submit the patch to include / enable it.

As Bart suggested, I splitte the patches. 

Regarding the driver name, following the gpio-SoC_name.o convention 
in the Makefile, we choose sgpio-aspeed.o .

--Hongwei
