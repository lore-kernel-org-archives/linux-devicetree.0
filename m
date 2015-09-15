From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [PATCH 0/5] New Atmel PIO4 pinctrl/gpio driver
Date: Tue, 15 Sep 2015 11:15:05 +0200
Message-ID: <20150915091505.GP32379@odux.rfo.atmel.com>
References: <1439281685-3020-1-git-send-email-ludovic.desroches@atmel.com>
 <20150907131210.GC32379@odux.rfo.atmel.com>
 <20150915085703.GA4018@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150915085703.GA4018@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On Tue, Sep 15, 2015 at 10:57:03AM +0200, Sascha Hauer wrote:
> Hi Ludovic,
> 
> On Mon, Sep 07, 2015 at 03:12:10PM +0200, Ludovic Desroches wrote:
> > Hi Sascha,
> > 
> > Any comments about this version? Maybe you missed it since you answered
> > me on the RFC version. Of course I'll do the changes you requested for
> > the next version (remove gpio_request_*() stuff and add macros for gpio
> > muxing case).
> 
> The binding looks good to me. I wonder where the pinmux defines have
> gone, they were part of the last series but not of this one.

It was because I planned to send it when I will add pinctrl of all the
devices.

I'll add it for the next version since you agree the bindings.

Regards

Ludovic
