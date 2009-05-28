From: Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 20:04:58 -0400
Message-ID: <9e4733910905271704q14e98429x241bc91399ccc5d0@mail.gmail.com>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<20090527163223.GE1970@sirena.org.uk>
	<9e4733910905271150q1d51538draa8d039c8b147c05@mail.gmail.com>
	<20090527222420.GC5591@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527222420.GC5591-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
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

On Wed, May 27, 2009 at 6:24 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Wed, May 27, 2009 at 02:50:27PM -0400, Jon Smirl wrote:
>> On Wed, May 27, 2009 at 12:32 PM, Mark Brown
>
>> > This worries me too, my experiences with OF device tree handling for
>> > ASoC have been pretty negative - but then audio is one of the worst
>> > cases for handling within the device tree.
>
>> ASoC is where I2C was a year ago. I2C had it's own module loading
>> conventions. OF assumes the subsystem is going to follow the standard
>> kernel module loading conventions. I2C has now been fixed to use the
>> standard conventions and it happily works with OF now.
>
> As I just said to Grant this is not the case any more, unless you are
> using AC97. =A0You can instantiate all the component drivers for an ASoC
> card via the normal device model methods, the overwhelming majority of
> my ASoC work is done on systems that do exactly this.
>
>> The fight with ASoC is that two different entities are trying to link
>> the modules together - ASoC (machine drivers) and the device tree
>> code. There should only be one system linking everything together.
>
> That's not the fundamental problem that machine drivers solve, though
> they do the basic tab A into slot B stuff too. =A0The biggest problem that
> machine drivers solve is that they allow us to set up the clocks used in
> the audio subsystem in a way that is appropriate for the system based on
> how it's wired up and what it's supposed to do. =A0As I just said to Grant
> any OS neutral expression of this configuration suitable for use in a
> device tree would need to be able to provide some constraints and a wiring
> diagram. =A0These would then be used together with constraints from the
> current runtime configuration to calculate an actual clock configuration
> for the system.
>
> If we had a cross-platform clock framework which was capable of handling
> this then producing a generic machine driver would be more tractable but
> there's no visible prospect of that happening any time soon.
>
> Please read back over the original soc-of-simple thread, it goes into
> the problems in a bit more detail.
>
>> But you want these ASoC machine drivers on ARM because ARM doesn't
>> have device trees.
>
> This is nothing to do with the device trees, as I believe I've mentioned
> before the existing ARM equivalents of the device tree are exactly
> equivalent to it for device loading as far as things outside arch/arm
> are concerned.
>
>> I2C had the same problem. I2C wanted everything loaded form machine
>> drivers. The machine drivers are now optional. ASoC can be fixed in
>> the same way.
>
> It's very easy to say things like this but there's quite a way to go
> before they can be delivered upon; if it were straightforward to handle
> I'd expect that soc-of-simple would be able to cope with it.
>

It's an evolutionary process, let's get ASoC loading all of the right
modules first. Then we can move on to clocking, etc. I2C went through
the same process.  For example, the new efika-audio-fabric and
pcm030-audio-fabric files should not be needed once the binding
process is fully working. Next up we can try and simlify
mpc8610_hpcd.c.

When I disabled soc-of-simple that stop the autoloading of codecs on
i2s. That needs to be fixed. Next kernel cycle I will be working on
mpc5200 i2s.

-- =

Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
