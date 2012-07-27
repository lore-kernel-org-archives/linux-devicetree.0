From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] OF: pinctrl: MIPS: lantiq: implement lantiq/xway
 pinctrl support
Date: Sat, 28 Jul 2012 01:23:26 +0200
Message-ID: <CACRpkdZi+-V+-LGKiws-c=t0ZjvjV=CFxpuZCBwf9i_q5P+6UQ@mail.gmail.com>
References: <1343112660-12245-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1343112660-12245-1-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 24, 2012 at 8:50 AM, John Crispin <blogic@openwrt.org> wrote:

> Implement support for pinctrl on lantiq/xway socs. The IO core found on these
> socs has the registers for pinctrl, pinconf and gpio mixed up in the same
> register range. As the gpio_chip handling is only a few lines, the driver also
> implements the gpio functionality. This obseletes the old gpio driver that was
> located in the arch/ folder.
>
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

I still ACK it, just a comment:

> +/* these are the offsets to our registers */
> +#define GPIO_BASE(p)           (REG_OFF * PORT(p))
> +#define GPIO_OUT(p)            GPIO_BASE(p)
> +#define GPIO_IN(p)             (GPIO_BASE(p) + 0x04)
> +#define GPIO_DIR(p)            (GPIO_BASE(p) + 0x08)
> +#define GPIO_ALT0(p)           (GPIO_BASE(p) + 0x0C)
> +#define GPIO_ALT1(p)           (GPIO_BASE(p) + 0x10)
> +#define GPIO_OD(p)             (GPIO_BASE(p) + 0x14)
> +#define GPIO_PUDSEL(p)         (GPIO_BASE(p) + 0x1c)
> +#define GPIO_PUDEN(p)          (GPIO_BASE(p) + 0x20)
> +
> +/* the 1/2 port needs special offsets for some registers */
> +#define GPIO3_OD               (GPIO_BASE(0) + 0x24)
> +#define GPIO3_PUDSEL           (GPIO_BASE(0) + 0x28)
> +#define GPIO3_PUDEN            (GPIO_BASE(0) + 0x2C)
> +#define GPIO3_ALT1             (GPIO_BASE(PINS) + 0x24)
> +
> +/* macros to help us access the registers */
> +#define gpio_getbit(m, r, p)   (!!(ltq_r32(m + r) & BIT(p)))
> +#define gpio_setbit(m, r, p)   ltq_w32_mask(0, BIT(p), m + r)
> +#define gpio_clearbit(m, r, p) ltq_w32_mask(BIT(p), 0, m + r)

These are a bit confusing since much of this stuff is not dealing with
GPIO at all (but some pulling, open draining etc).

Consider renaming some of these some day.

Yours,
Linus Walleij
