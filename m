From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH v3 7/8] rtc: st: add new driver for ST's
 LPC RTC
Date: Wed, 25 Feb 2015 11:08:09 +0000
Message-ID: <20150225110809.GH21323@x1>
References: <1424260154-12868-1-git-send-email-lee.jones@linaro.org>
 <1424260154-12868-8-git-send-email-lee.jones@linaro.org>
 <20150223101223.GA14142@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150223101223.GA14142@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@stlinux.com, rtc-linux@googlegroups.com, wim@iguana.be, linux@roeck-us.net, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 23 Feb 2015, Peter Griffin wrote:
> On Wed, 18 Feb 2015, Lee Jones wrote:
>=20
> > ST's Low Power Controller (LPC) controls two devices; watchdog and =
RTC.
> > Only one of the devices can be used at any one time.  This is enfor=
ced
> > by the correlating MFD driver.  This portion of the driver-set cont=
rols
> > the Real Time Clock.
>=20
> <snip>
>=20
> > +{
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&rtc->lock, flags);
> > +
> > +	writel(1, rtc->ioaddr + LPC_WDT_OFF);
> > +
> > +	writel(msb, rtc->ioaddr + LPC_LPA_MSB_OFF);
> > +	writel(lsb, rtc->ioaddr + LPC_LPA_LSB_OFF);
> > +	writel(1, rtc->ioaddr + LPC_LPA_START_OFF);
> > +
> > +	writel(0, rtc->ioaddr + LPC_WDT_OFF);
>=20
> I think all the writel IO accessors in this driver can be replaced
> with the *_relaxed variant. This will avoid the overhead of taking a
> spinlock in the l2 outer cache part of writel.

Yes, there is no technical reason why we can't use the relaxed
variants.  Will fix.

> > +#ifdef CONFIG_PM_SLEEP
> > +static int st_rtc_suspend(struct device *dev)
> > +{
> > +	struct st_rtc *rtc =3D dev_get_drvdata(dev);
> > +
> > +	if (device_may_wakeup(dev))
> > +		return 0;
> > +
> > +	writel(1, rtc->ioaddr + LPC_WDT_OFF);
> > +	writel(0, rtc->ioaddr + LPC_LPA_START_OFF);
> > +	writel(0, rtc->ioaddr + LPC_WDT_OFF);
>=20
> Is there a reason for not disabling the IP clock in suspend / resume =
functions?

There is.  It will stop the alarm timer, which is undesirable.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
