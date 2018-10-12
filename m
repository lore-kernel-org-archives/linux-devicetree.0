Return-Path: <SRS0=ZRjc=MY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59107 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbeJLRSn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Oct 2018 13:18:43 -0400
Date: Fri, 12 Oct 2018 11:47:04 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: SV: [PATCH RFC] gpio: new driver for a gpio simulator
Message-ID: <20181012094704.mow2nfm7xwdi2a4t@pengutronix.de>
References: <20181008101356.5672-1-uwe@kleine-koenig.org>
 <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
 <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de>
 <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
 <20181011081646.np2pte7eeohuyhh6@pengutronix.de>
 <20181011094905.47onipkrzdp25psq@axis.com>
 <1539331329658.80509@axis.com>
 <20181012090612.63f2p45d24gpilsm@pengutronix.de>
 <20181012092718.dpu6w6rqzknt2cm3@lnxeinarv1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181012092718.dpu6w6rqzknt2cm3@lnxeinarv1.se.axis.com>
Sender: devicetree-owner@vger.kernel.org
To: Einar Vading <einar.vading@axis.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Vincent Whitchurch <rabinv@axis.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 12, 2018 at 11:27:18AM +0200, Einar Vading wrote:
> On Fri, Oct 12, 2018 at 11:06:12AM +0200, Uwe Kleine-K�nig wrote:
> > Would it help to instanciate more than one gpio-simulator?
> 
> Hmm, I don't think that would pose a problem. With DT it would be easy to name
> the GPIOs and get then get them by name. What gpiochip they are on should not
> matter... I think.

The only downside is that you cannot atomically set GPIOs on different
chips. I didn't try to use naming, but maybe the gpio framework is good
enough that it just works.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
