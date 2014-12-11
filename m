From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH 5/9] gpio: Add Fujitsu MB86S7x GPIO driver
Date: Thu, 11 Dec 2014 21:31:23 +0530
Message-ID: <CAJe_Zhef7D5-P4+bfgkbdaDB8HXm-Yb5SyrYRhO+SX1bcoLYNA@mail.gmail.com>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1416487023-25426-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<CACRpkdY_DFF8BjwLs5m4fe+-eBjmxYW6z4aU+zxiG+EgZys0+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY_DFF8BjwLs5m4fe+-eBjmxYW6z4aU+zxiG+EgZys0+w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vincent Yang <vincent.yang.fujitsu@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Green <andy.green@linaro.org>, Patch Tracking <patches@linaro.org>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>
List-Id: devicetree@vger.kernel.org

On 3 December 2014 at 19:02, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Nov 20, 2014 at 1:37 PM, Vincent Yang
> <vincent.yang.fujitsu@gmail.com> wrote:
>
>> Driver for Fujitsu MB86S7x SoCs that have a memory mapped GPIO controller.
>>
>> Signed-off-by: Andy Green <andy.green@linaro.org>
>> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
>> Signed-off-by: Vincent Yang <Vincent.Yang@tw.fujitsu.com>
>> Signed-off-by: Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>
>
> This is a very simple MMIO GPIO controller.
>
> Why can this *not* just select GPIO_GENERIC and
> use drivers/gpio/gpio-generic.c?
>
The math isn't the simple shift operation that the gpio-generic.c assumes.

-jassi
