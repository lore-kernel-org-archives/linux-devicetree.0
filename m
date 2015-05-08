From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 02/12] clocksource: sti: Provide support for the ST LPC
 Clocksource IP
Date: Fri, 8 May 2015 11:28:34 +0100
Message-ID: <20150508102834.GC29044@x1>
References: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
 <1431005924-21777-3-git-send-email-lee.jones@linaro.org>
 <1431079797.13593.28.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431079797.13593.28.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, devicetree@vger.kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, wim@iguana.be, a.zummo@towertech.it, linux-watchdog@vger.kernel.org, rtc-linux@googlegroups.com, linux@roeck-us.net
List-Id: devicetree@vger.kernel.org

On Fri, 08 May 2015, Paul Bolle wrote:

> On Thu, 2015-05-07 at 14:38 +0100, Lee Jones wrote:
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
>=20
> > +config CLKSRC_ST_LPC
> > +	bool
> > +	depends on ARCH_STI
>=20
> By itself this does nothing. You can't set this symbol to 'y', even i=
f
> ARCH_STI is 'y', right? Of course, ARCH_STI will select this symbol (=
see
> 11/12) otherwise it would be inert. But as ARCH_STI selects
> CLKSRC_ST_LPC I'd say this dependency isn't actually needed.

I guess this is more of a representative dependency, but you're right,
the likelihood is that no one is likely to accidentally enable it.

I can remove it.

> Are other selects of CLKSRC_ST_LPC expected to be added in the future=
?
> If not, CLKSRC_ST_LPC should operate in lockstep with ARCH_STI. In th=
at
> case you might as well not bother with CLKSRC_ST_LPC and use ARCH_STI
> directly. (But that forces you to move the select statement below int=
o
> the ARCH_STI entry, which might be ugly.)

Although true, there might be cases where we need to stop this from
being enabled on all ARCH_STI platforms.  It'll be easier to move
CLKSRC_ST_LPC around in arch code than to start renaming this symbol.

I'd prefer to keep this as CLKSRC_ST_LPC if you're not passionate
about the alternative.

> > +	select CLKSRC_OF if OF
> > +	help
> > +	  Enable this option to use the Low Power controller timer
> > +	  as clocksource.
>=20
> (Please add an empty line.)

I believe the new line comes in the next patch.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
