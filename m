From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 03/14] clocksource: samsung-pwm: Add infrastructure to share PWM hardware
Date: Fri, 12 Apr 2013 22:47:16 +0200
Message-ID: <2367229.enzT7IXUEQ@flatron>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com> <1365794250-14436-4-git-send-email-t.figa@samsung.com> <201304122242.36801.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <201304122242.36801.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, john.stultz@linaro.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Friday 12 of April 2013 22:42:36 Arnd Bergmann wrote:
> On Friday 12 April 2013, Tomasz Figa wrote:
> > +
> > +Samsung SoCs contain PWM timer blocks which can be used for system
> > clock source +and clock event timers, as well as to drive SoC outputs
> > with PWM signal. Each +PWM timer block provides 5 PWM channels (not
> > all of them can drive physical +outputs - see SoC and board manual).
> > +
> 
> ...
> 
> > +Optional properties:
> > +- samsung,pwm-outputs: list of PWM channels used as PWM outputs on
> > particular +    platform - an array of up to 5 elements being indices
> > of PWM channels +    (from 0 to 4), the order does not matter.
> > +
> 
> There is probably a good reason, but can you explain why this is
> actually required to be a property? Wouldn't it be enough to just not
> refer to the PWM outputs from other devices when they are not used?

It is needed for the clocksource driver, to select unused channels for 
clocksource and clock event purposes.

Best regards,
Tomasz
