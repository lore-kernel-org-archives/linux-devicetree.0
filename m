From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/4] Documentation: dt: gpio: Add gpio-number-forward
 property in snps gpio binding doc
Date: Wed, 31 Dec 2014 09:18:02 +0100
Message-ID: <CACRpkdaBVN46BMO3Q5mN8OncghG3VH2=zv66EyWJEK1rwx3P6g@mail.gmail.com>
References: <1417750722-14027-1-git-send-email-wangzhou.bry@gmail.com>
	<1417750722-14027-5-git-send-email-wangzhou.bry@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1417750722-14027-5-git-send-email-wangzhou.bry@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Zhou Wang <wangzhou.bry@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <gnurou@gmail.com>, liguozhu@hisilicon.com, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alan Tull <atull@altera.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jamie Iles <jamie@jamieiles.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, wangzhou1@h
List-Id: devicetree@vger.kernel.org

On Fri, Dec 5, 2014 at 4:38 AM, Zhou Wang <wangzhou.bry@gmail.com> wrote:

> This property is used to indicate gpiochip_find_base() to find GPIO
> base number in increasing order.
>
> Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>

NAK. GPIO numbers is a Linux-internal thing, not a OS independent
property.

Yours,
Linus Walleij
