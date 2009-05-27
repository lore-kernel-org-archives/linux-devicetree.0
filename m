From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 14:42:13 -0600
Message-ID: <fa686aa40905271342v5bc51665tb9b5d92950a43b82@mail.gmail.com>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<20090527163223.GE1970@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527163223.GE1970-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 10:32 AM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Wed, May 27, 2009 at 05:05:27PM +0200, Robert Schwebel wrote:
>
>> I'm highly convinced that the existence of oftree-hell in ARM-land would
>> have been *the* key motivation for FSL to have worked on mainline
>> instead of inhouse-BSPs back in 2004 when we mainlined i.MX1 and in 2007
>> when we started the mainline work on MX27 and MX31.
>
> I remain to be convinced about that but anyway..
>
>> Seriously: oftree in general is a good idea. Just that it doesn't work
>> in practise. The concept has some serious flaws:
>
>> - Platform data makes it possible to store function pointers. There
>> =A0 is no equivalent to this concept in oftree-land.
>
> The handling of platform data is my main concern as someone working
> primarily on platform independant drivers - function pointers are a
> particular problem but the possibility of having to write code to
> handle both OF and non-OF systems to cater for systems using both
> approaches is also a concern for me.

Having a hook function which generates a pdata structure from a device
node on a per driver basis is a common approach.  Essentially, the
hook becomes an addon to the driver which doesn't impact the driver as
a whole.  i2c and SPI device tend to take this approach.

The other common pattern, usually used on platform drivers, is to
factor out the common code and use 2 separate bus binding blocks; one
for platform and one for of_platform.  It has some (low) impact on
driver structure, but not everyone likes this approach.

>> oftree could be a great tool if these things would be resolved.
>> Currently they are not, and in result, ARM just works and is easy,
>> whereas on PowerPC systems people often spend more time working on
>> binding stuff than on the actual functionality.
>
> This worries me too, my experiences with OF device tree handling for
> ASoC have been pretty negative - but then audio is one of the worst
> cases for handling within the device tree.

First steps are hard.  I2C and SPI work had similar groans and pains,
and ASoC is considerably more complex.  In the end the stuff in
drivers/of/* was added to handle the creation of i2c, spi and phy
devices from data in the device tree.  It is a mechanism which seems
to be working well.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
