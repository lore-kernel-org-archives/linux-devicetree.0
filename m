From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/9] gpio: Add Fujitsu MB86S7x GPIO driver
Date: Wed, 3 Dec 2014 14:32:31 +0100
Message-ID: <CACRpkdY_DFF8BjwLs5m4fe+-eBjmxYW6z4aU+zxiG+EgZys0+w@mail.gmail.com>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1416487023-25426-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1416487023-25426-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vincent Yang <vincent.yang.fujitsu@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Green <andy.green@linaro.org>, Patch Tracking <patches@linaro.org>, Jaswinder Singh <jaswinder.singh@linaro.org>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 20, 2014 at 1:37 PM, Vincent Yang
<vincent.yang.fujitsu@gmail.com> wrote:

> Driver for Fujitsu MB86S7x SoCs that have a memory mapped GPIO controller.
>
> Signed-off-by: Andy Green <andy.green@linaro.org>
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> Signed-off-by: Vincent Yang <Vincent.Yang@tw.fujitsu.com>
> Signed-off-by: Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>

This is a very simple MMIO GPIO controller.

Why can this *not* just select GPIO_GENERIC and
use drivers/gpio/gpio-generic.c?

You need a smallish driver making use of the generic
MMIO library, see for example
drivers/gpio/gpio-74xx-mmio.c
or any other driver selecting GPIO_GENERIC.

Yours,
Linus Walleij
