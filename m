From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 01/14] ARM: SAMSUNG: Move samsung-time to drivers/clocksource
Date: Fri, 12 Apr 2013 22:52:14 +0200
Message-ID: <2161915.CT7ruPYKGQ@flatron>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com> <1365794250-14436-2-git-send-email-t.figa@samsung.com> <201304122244.03964.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <201304122244.03964.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, john.stultz@linaro.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Friday 12 of April 2013 22:44:03 Arnd Bergmann wrote:
> On Friday 12 April 2013, Tomasz Figa wrote:
> > ---
> > 
> >  arch/arm/plat-samsung/Kconfig        |   8 -
> >  arch/arm/plat-samsung/Makefile       |   1 -
> >  arch/arm/plat-samsung/samsung-time.c | 394
> >  ----------------------------------- drivers/clocksource/Kconfig     
> >      |   7 +
> >  drivers/clocksource/Makefile         |   1 +
> >  drivers/clocksource/samsung_pwm.c    | 394
> >  +++++++++++++++++++++++++++++++++++
> In general, please send patches generated with 'git format-patch -M'.
> You can set that as a default using 'git config diff.renames true'.

Oops, I forgot to add the switch, sorry. Setting it as default might be a 
good idea indeed.

Best regards,
Tomasz
