From: Hongwei Zhang <hongweiz@ami.com>
Subject: [v1, 1/1] gpio: dts: aspeed: Add SGPIO driver
Date: Wed, 25 Sep 2019 15:19:48 -0400
Message-ID: <1569439188-10378-1-git-send-email-hongweiz@ami.com>
References: <1569352021-6383-1-git-send-email-hongweiz@ami.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569352021-6383-1-git-send-email-hongweiz@ami.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Cc: Hongwei Zhang <hongweiz@ami.com>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Doug Anderson <armlinux@m.disordat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> >  obj-$(CONFIG_GPIO_BD70528)             += gpio-bd70528.o
> > --
> > 2.7.4
> >
> 
> This should be split into separate patches with one extending the binding document and one adding 
> actual support.
> 
> Bart

Thanks Bart,
I just submitted splitted patches.

--Hongwei
