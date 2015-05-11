From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [rtc-linux] [PATCH 07/12] rtc: st: Update IP layout information
 to include Clocksource
Date: Mon, 11 May 2015 11:54:33 +0100
Message-ID: <20150511105433.GB20742@x1>
References: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
 <1431005924-21777-8-git-send-email-lee.jones@linaro.org>
 <20150509135854.GE3338@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150509135854.GE3338@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, devicetree@vger.kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, wim@iguana.be, a.zummo@towertech.it, linux-watchdog@vger.kernel.org, rtc-linux@googlegroups.com, linux@roeck-us.net
List-Id: devicetree@vger.kernel.org

On Sat, 09 May 2015, Alexandre Belloni wrote:

> On 07/05/2015 at 14:38:39 +0100, Lee Jones wrote :
> > Initial submission adding support for this IP only included Watchdo=
g and
> > the Real-Time Clock.  Now the third (and final) device is enabled t=
his
> > trivial patch is required to update the comment in the RTC driver t=
o
> > encompass Clocksource.
> >=20
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Thanks.

> I'm guessing this will go through the mfd tree along with the driver?

Yes, that is the plan, if that's okay with you?

> > ---
> >  drivers/rtc/rtc-st-lpc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
> > index 3f9d0ac..74c0a33 100644
> > --- a/drivers/rtc/rtc-st-lpc.c
> > +++ b/drivers/rtc/rtc-st-lpc.c
> > @@ -208,7 +208,7 @@ static int st_rtc_probe(struct platform_device =
*pdev)
> >  		return -EINVAL;
> >  	}
> > =20
> > -	/* LPC can either run in RTC or WDT mode */
> > +	/* LPC can either run as a Clocksource or in RTC or WDT mode */
> >  	if (mode !=3D ST_LPC_MODE_RTC)
> >  		return -ENODEV;
> > =20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
