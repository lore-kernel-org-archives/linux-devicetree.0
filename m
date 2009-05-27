From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 22:38:45 +0100
Message-ID: <20090527213841.GB5591@sirena.org.uk>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<20090527163223.GE1970@sirena.org.uk>
	<fa686aa40905271342v5bc51665tb9b5d92950a43b82@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa40905271342v5bc51665tb9b5d92950a43b82-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 02:42:13PM -0600, Grant Likely wrote:
> On Wed, May 27, 2009 at 10:32 AM, Mark Brown

> > The handling of platform data is my main concern as someone working
> > primarily on platform independant drivers - function pointers are a
> > particular problem but the possibility of having to write code to
> > handle both OF and non-OF systems to cater for systems using both
> > approaches is also a concern for me.

> Having a hook function which generates a pdata structure from a device
> node on a per driver basis is a common approach.  Essentially, the
> hook becomes an addon to the driver which doesn't impact the driver as
> a whole.  i2c and SPI device tend to take this approach.

Yes, this is what I mean about doing it twice - you have to have the
regular platform data structure plus another function to map the
OpenFirmware data into it.  The fact that quite a few of the devices I
deal with want function pointers as platform data doesn't help here.

> > This worries me too, my experiences with OF device tree handling for
> > ASoC have been pretty negative - but then audio is one of the worst
> > cases for handling within the device tree.

> First steps are hard.  I2C and SPI work had similar groans and pains,
> and ASoC is considerably more complex.  In the end the stuff in
> drivers/of/* was added to handle the creation of i2c, spi and phy
> devices from data in the device tree.  It is a mechanism which seems
> to be working well.

Instantiating the devices is a solved problem - with the current code
you can load the drivers for all the various parts of the audio
subsystem via the standard device model with everything appearing on
whatever bus it normally should.  The only exception to that is AC97
(because it's a bit special and needs some general TLC).  Some more work
is needed on the core to fully take advantage of what this bought us but
as far as loading and initialising device drivers goes you should be
there already.

What's a really crippling problem for what people seem to want to do
with the device tree right now is expressing the clocking trees and
requirements for a non-trivial audio subsystem.  The current clock API
is quite a way off being able to cope with this at runtime and without
that the benefits of trying to put the data into device trees are
questionable - a plaform independant representation of this data most
likely needs us to be able to automatically configure the clock tree
based on a description of the interconnects and their constraints.
