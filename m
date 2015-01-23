From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 RESEND 2/8] irqchip: Supply new driver for STi based
 devices
Date: Fri, 23 Jan 2015 16:32:31 +0000
Message-ID: <20150123163231.GB11745@x1>
References: <1421920133-7914-1-git-send-email-lee.jones@linaro.org>
 <1421920133-7914-3-git-send-email-lee.jones@linaro.org>
 <alpine.DEB.2.11.1501231702280.5526@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1501231702280.5526@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, jason@lakedaemon.net, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 23 Jan 2015, Thomas Gleixner wrote:
> On Thu, 22 Jan 2015, Lee Jones wrote:
>=20
> > This driver is used to enable System Configuration Register control=
led
> > External, CTI (Core Sight), PMU (Performance Management), and PL310=
 L2
> > Cache IRQs prior to use.
>=20
> I'm wondering how this is related to irq_chip,=20

It doesn't really.  At least, it doesn't make use of the framework. =20
It was the most relevant subsystem.

> but well, I don't mind it being parked here.

Thanks Thomas.  I was hoping for that response.

> Though I really cannot say anything about this DT translation
> machinery for a single sysconfig register, other than it looks
> completely overengineered to me.

I understnad where you're coming from, but don't all drivers just
'twiddle some register bits'?

> The only technical comment I have is: shouldn't all the stuff except
> the resume function be marked __init or is any of this required post
> init?

It's not common to mark functions invoked at and affter *_probe() as
__init.  At least, not as far as I'm aware.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
