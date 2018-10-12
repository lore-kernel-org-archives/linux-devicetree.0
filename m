Return-Path: <SRS0=ZRjc=MY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43533 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbeJLQhn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Oct 2018 12:37:43 -0400
Date: Fri, 12 Oct 2018 11:06:12 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: SV: [PATCH RFC] gpio: new driver for a gpio simulator
Message-ID: <20181012090612.63f2p45d24gpilsm@pengutronix.de>
References: <20181008101356.5672-1-uwe@kleine-koenig.org>
 <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
 <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de>
 <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
 <20181011081646.np2pte7eeohuyhh6@pengutronix.de>
 <20181011094905.47onipkrzdp25psq@axis.com>
 <1539331329658.80509@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1539331329658.80509@axis.com>
Sender: devicetree-owner@vger.kernel.org
To: Einar Vading <einar.vading@axis.com>
Cc: Vincent Whitchurch <rabinv@axis.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Hello Einar,

On Fri, Oct 12, 2018 at 08:02:09AM +0000, Einar Vading wrote:
> Since I was just evaluating the mockup driver to use in a test setup
> I'll give my 2 cents.

very welcome, thanks.

> The benefit of the simulator is that we get the possibility to, if I
> understand correctly, monitor an input for changes on the connected
> output. Sure, we could also use ftrace but I like the idea of having
> the two connected GPIOs. As a matter of fact I was just thinking about
> implementing something that gave the same functionality for the mockup
> driver.
> 
> What I like from the mockup driver is the possibility to have *many*
> gpios on the same chip. We currently have a MCU I/O expander that
> gives us 110+ gpios. So for us 64 GPIOs is really not enough.

Currently several states are stored in an u32 where each bit corresponds
to a GPIO which simplifies some operations. Probably an array of
unsigned long could be used, which would have the benefit that set_bit
et al would work. Then we either need a compile time limit, a variadic
driver data struct or one additional allocation for each variable that
is an u32 currently.

Would it help to instanciate more than one gpio-simulator?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
