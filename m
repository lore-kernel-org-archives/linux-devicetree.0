From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: i2c: Add LPS001WP to the Trivial
 Devices list
Date: Thu, 5 Sep 2013 12:30:01 +0100
Message-ID: <20130905113001.GR18206@e106331-lin.cambridge.arm.com>
References: <1378302655-13258-1-git-send-email-lee.jones@linaro.org>
 <20130904142422.GM18206@e106331-lin.cambridge.arm.com>
 <20130904151159.GA8980@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130904151159.GA8980@lee--X1>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "sa-z923LK4zBo2bacvFa/9K2g@public.gmane.org" <sa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org" <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org" <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 04, 2013 at 04:11:59PM +0100, Lee Jones wrote:
> > Cheers for producing a binding.
> > 
> > On Wed, Sep 04, 2013 at 02:50:55PM +0100, Lee Jones wrote:
> > > LPS001WP is a Pressure and Temperature sensor.
> > > 
> > > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/i2c/trivial-devices.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> > > index ad6a738..6038807e6 100644
> > > --- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> > > +++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> > > @@ -57,6 +57,7 @@ st-micro,24c256		i2c serial eeprom  (24cxx)
> > >  stm,m41t00		Serial Access TIMEKEEPER
> > >  stm,m41t62		Serial real-time clock (RTC) with alarm
> > >  stm,m41t80		M41T80 - SERIAL ACCESS RTC WITH ALARMS
> > > +stm,lps001wp		Pressure and Temperature sensor
> > 
> > As I hinted at in the other thread [1], I don't think this can be
> > documented as a trivial binding -- the driver expects a couple of
> > regulators which should be described in the binding (or the driver
> > shouldn't be using them...).
> 
> Surely all devices need to be powered and would subsequently require a
> regulator of one description or other? We don't really *need* to
> manually enable it on my platform but that's because it's 'always
> on', but we do anyway for completeness.

They may or may not, that's a grey area. Regardless of whether you
actually need it, the driver is currently looking for two undocumented
entries in the DT. If you want to be able to use them, they must be
documented so that people know they exist, what format they are expected
to be, and what they actually represent.

We should not allow for undocumented ABIs.

> 
> Would a (regulator: vdd) note in this patch be suitable? It seems a
> shame to have to produce a boilerplate binding entry for the sake of a
> regulator.

I thought this could have two regulators (vdd and vms)? 

I also note that the device can also be attached to SPI. Do we have any
other devices which may be attached to either? Do we handle that, and if
so, how (do we have the same compatible string for both interfaces?)?

Thanks,
Mark.
