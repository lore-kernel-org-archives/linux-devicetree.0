Return-Path: <SRS0=om/t=MV=pengutronix.de=mfe@kernel.org>
Date: Wed, 10 Oct 2018 00:43:25 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 3/3] Input: add generic gpio brownout driver
Message-ID: <20181009224325.pxbqgjmxur5gd3ck@pengutronix.de>
References: <20180925094230.32679-1-m.felsch@pengutronix.de>
 <20180925094230.32679-4-m.felsch@pengutronix.de>
 <20180929001911.GC182370@dtor-ws>
 <20181001071921.hxu2vlqeji4f52gd@pengutronix.de>
 <1538411713.6709.3.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538411713.6709.3.camel@impinj.com>
To: Trent Piepho <tpiepho@impinj.com>
Cc: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Hi Trent,

On 18-10-01 16:35, Trent Piepho wrote:
> On Mon, 2018-10-01 at 09:19 +0200, Marco Felsch wrote:
> > On 18-09-28 17:19, Dmitry Torokhov wrote:
> > > 
> > > > 
> > > > This patch adds the support for a generic gpio-based brownout
> > > > detection. Upon a brownout the host system gets informed and the driver
> > > > sends a keycode signal to the userspace. Per default this signal is
> > > > mapped to KEY_POWER, so the system will shoutdown.
> > > 
> > > I do not believe this functionality should be exposed as an input
> > > device, as it has nothing to do with human interaction with the
> > > computing device. To me this is akin over-current on a USB port, or
> > > carrier signal on network interfaces.
> > 
> > I'm still uncertain putting the code into the input framework. I tought
> > a lot about the correct place. For me it's like a button, which is
> > 'pressed' by the hardware. Yes, it's a bit abstract..
> 
> For quite a few years, the hwmon subsystem has had devices that will
> generate an interrupt on low voltage (or high voltage, or high
> temperature ...) and drivers that export that interrupt to userspace.
> 
> This device doesn't seem any different that a somewhat limited hwmon
> device with just an "in0_alarm" attribute.

Thanks for the feedback and the idea. I will migrate the driver to the
hwmon subsystem.

Regards,
Marco
