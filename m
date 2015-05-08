From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 03/12] clocksource: sti: Provide 'use timer as sched
 clock' capability
Date: Fri, 8 May 2015 11:29:38 +0100
Message-ID: <20150508102938.GD29044@x1>
References: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
 <1431005924-21777-4-git-send-email-lee.jones@linaro.org>
 <1431074699.13593.4.camel@x220>
 <20150508093603.GB29044@x1>
 <1431078730.13593.14.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431078730.13593.14.camel@x220>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 08 May 2015, Paul Bolle wrote:

> On Fri, 2015-05-08 at 10:36 +0100, Lee Jones wrote:
> > On Fri, 08 May 2015, Paul Bolle wrote:
> > > On Thu, 2015-05-07 at 14:38 +0100, Lee Jones wrote:
> > > > --- a/drivers/clocksource/Kconfig
> > > > +++ b/drivers/clocksource/Kconfig
> > >=20
> > > > +config CLKSRC_ST_LPC_TIMER_SCHED_CLOCK
> > > > +	bool
> > > > +	depends on CLKSRC_ST_LPC
> > > > +	default y
> > > > +	help
> > > > +	  Use Low Power controller timer clock source as sched_clock
> > >=20
> > > This adds, as far as I can see, a Kconfig symbol that will always=
 be in
> > > lockstep with CLKSRC_ST_LPC. Ie, CLKSRC_ST_LPC and
> > > CLKSRC_ST_LPC_TIMER_SCHED_CLOCK will always both be 'n' or both b=
e 'y'.
> > >=20
> > > Are there plans to break that lockstep in the future?
> >=20
> > What's stopping CONFIG_CLKSRC_ST_LPC_TIMER_SCHED_CLOCK=3Dn?
>=20
> If CLKSRC_ST_LPC=3Dy you mean? The lack of a prompt, I'd say. Ie, you
> would need
> 	bool "A very short description"
>=20
> to be able to set these independently.
>=20
> But now I notice that I missed that there appears to be a problem wit=
h
> CLKSRC_ST_LPC too. I'll reply to 2/12 shortly.

Ah, you mean from menuconfig.  I almost forgot what that was. ;)

I can add a menu option, no problem.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
