From: Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 08:47:37 -0400
Message-ID: <9e4733910905280547w7ee65d40yb4b3ab9559e14dae@mail.gmail.com>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk> <4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<1243496236.3171.140.camel@pasglop>
	<20090528091513.GA14789@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090528091513.GA14789-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2009 at 5:15 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, May 28, 2009 at 05:37:16PM +1000, Benjamin Herrenschmidt wrote:
>> On Wed, 2009-05-27 at 18:56 +0100, Russell King wrote:
>> >
>> > smc91x is a prime example of the kind of information drivers need - ba=
se
>> > address and irq are very much insufficient to describe how this device=
 is
>> > connected. =A0There's much more information required to specify this d=
evice
>> > fully, and throwing it into the driver doesn't work. =A0We've been the=
re
>> > and proven that point.
>>
>> The device-tree is a very nice and convenient way to convey all the
>> informations the driver need straight to the driver without any platform
>> code in the middle :-)
>
> I'm still uncertain whether that's actually a true statement. =A0For some
> cases, of course it's true, but I have a nasty suspicion that we have
> corner cases where OF won't cope well with.
>
> As I see it, if we were to convert to OF, we're boxing ourselves in to
> a corner that would be extremely difficult to get out of. =A0We would
> never be able to step back from OF. =A0Lets take an example. =A0If we were
> to convert PXA to OF including all the PXA SoC drivers, and a board
> configuration came along which required hacks to a driver. =A0Later on
> we find that most platform authors are applying similar hacks because
> their hardware is subtly different but those differences can't be
> expressed via OF. =A0At this point, what do we do? =A0We can't say "well,
> OF doesn't work well on this platform, we want to get rid of it" that
> would be extremely difficult to impossible to do.
>
>
> For example, how would an IrDA transceiver be expressed in OF?
>
> Obviously it would have to start off with some sort of UART definition
> for SIR, with a separate (and sometimes unrelated in terms of register
> space and SoC pin configuration) FIR unit. =A0Whether FIR is used or not
> is platform specific. =A0So far so good, I don't see a problem yet.
>
> We then have one or two GPIOs doing some function - eg, one GPIO might
> be a simple power on/off while the other controls FIR or SIR mode in
> the transceiver itself. =A0Or the two lines might be a bit combination
> which selects 'off', 'on + sir', 'on + fir' modes depending on the
> transceiver used. =A0In the case of one GPIO it might be the mode select
> or it might be the power control.
>
> I suspect this can be expressed by having some sort of OF table specifying
> several gpios & their value for each combination of power & mode...
> except some platforms have special control registers in FPGAs which do
> not appear as GPIOs... so how are those expressed? =A0We have function
> pointers back into platform code to cope with this at present.
>
>
> Another example - LCD displays. =A0Some platforms need a certain sequence
> of GPIO activations with delays between when powering up and down the
> LCD display. =A0Currently we express this in the platform support file and
> pass a function pointer into the LCD Driver. =A0Can this be expressed with
> OF?
>
>
> Another example - backlights. =A0Some platforms need to twiddle a GPIO
> at a certain point in the brightness scale and reset the PWM, and they
> currently do this via an (optional) function pointer in the generic PWM
> backlight driver. =A0Can this be expressed with OF?
>
>
> That's just a few examples of areas where we haven't been able to describe
> platforms using pure data-based descriptions, and they're all things that
> we don't want to stuff into the individual drivers (doing so involves lots
> of ifdefs and namespace pollution - we saw that in 2.4 kernels.)
>
> In order for me to be convinced that OF is not going to cause us grief,
> I'd like to see a range of platforms converted to OF to check that we're
> not going to find any unexpected problems - eg, a load of PXA platforms,
> particularly those with the above kinds of problems.

I've also run into the problem of tying very machine specific code to
a device tree. This is coupled to the desire to have function pointer
callbacks.  I agree that this is a problem and the OF aware platforms
have the same problem. However, I don't think the problem has anything
to do with device trees, instead I believe the problem is internal to
Linux.

In general we're missing a design for a single file that holds all of
the machine specific code. There isn't any simple way right now to put
all of this code into a single file. In the current model this code
gets scattered all over the place.

If you look at arch/powerpc/platforms/... you'll find a few machine
specific files in there. That concept could be extended. After the
device tree loads, the machine specific file runs if there is one. At
that point, the machine specific code could insert function pointers
into the device tree. Later when the device drivers load they could
find these pointers and use them to implement machine specific
overrides. All of this machine specific override code would live in a
single file.

For ARM the model could be to use the machine number to load a device
tree built into the kernel (these trees would slowly migrate into the
firmware). After the device tree is selected the machine specific code
would add the override function pointers. Unified OF aware device
drivers would load using the device tree. These drivers would find the
function pointers and use them to implement machine specific features.

The function pointers also provides a way to migrate away from machine
specific code.  If we discover some machines specific code really
should be common code, the function pointer can be eliminated since
all of the support is in the kernel and not in the firmware.


>
> And no, Dave Miller saying "I've been using this for 15 years on Sparc"
> "Three architectures are using it" isn't going to convince me. =A0The pro=
of
> is in the code, not the waffle.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>



-- =

Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
