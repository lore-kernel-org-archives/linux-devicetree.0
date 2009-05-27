From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 14:35:11 -0600
Message-ID: <fa686aa40905271335o1165419hda2334bef42aa3f@mail.gmail.com>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<fa686aa40905270839m375bbdacqb1acb1be0a2d2da0@mail.gmail.com>
	<20090527162000.GM6805@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527162000.GM6805-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 10:20 AM, Robert Schwebel
<r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> That being said, the problems we have had are the reason why it is
>> *not* recommended to hard link the device tree image into firmware.
>> We do commit to not breaking old trees, but the ability to update is
>> important; particularly for enabling new features/drivers.
>
> Point taken.
>
> We often have the situation that we have
>
> - a SoC cpu from vendor A
> - a module with the cpu+ram+peripherals from vendor B
> - a baseboard from vendor C
> - sometimes an extension board from vendor D
>
> All that with non-introspectable busses, like chip select busses, SPI,
> i2c, FPGA-internal busses etc. We recently tried to put oftree sniplets
> into the devices (one into the module, one in the baseboard etc), let
> u-boot collect these sniplets and build an oftree out of it. It doesn't
> work. If you try this, you'll quickly find out that you would have to
> put the schematics into the oftree. A peripheral pin can be routed to a
> ball, goes from a connector of the module to a baseboard, to the
> extension board, come back and go to another unit on the SoC. This
> cannot be described in the oftree. At one place, you need to *know*
> about the whole hardware that you have and have a single "we have X" to
> "X's oftree" mapping.

Indeed, and it relies on encoding too much knowledge into the
firmware... code which may change.

> In the end, having a single "X needs these platform data" kernel source
> file is much, much cleaner and less error prone than what we currently
> have with the oftree.

What about a single device tree blob for each particular
configuration?  The .dtb isn't intended to solve the probing problem.
It's intended to solve the problem of describing your board design (or
board stack in your case).

>> > - The oftree layering is fundamentally broken. We already have a sane
>> > =A0abstraction for arbitrary hardware in the kernel: platform devices.
>> > =A0Why not instanciate platform devices from a generic oftree core?
>>
>> No; the oftree is a data structure. That is it, nothing more.
>
> Unfortunately, it is an incomplete data structure regarding to what the
> kernel needs.

I don't follow your argument.  It's a data structure that uniquely
describes your hardware in a way which encourages the most code reuse
possible; but is still independent of kernel internal implementation.
ie. a FDT blob should be usable not just by Linux, but also by BSD or
any of the other OS options.  It is not an attempt to eliminate
platform specific code; just to reduce it as much as possible.  Weird,
harry, non-standard stuff probably still needs board specific code to
handle.

>> > - Platform data makes it possible to store function pointers. There
>> > =A0is no equivalent to this concept in oftree-land.
>>
>> But there is concept of platform specific code. In the majority of
>> cases platform specific function pointers aren't needed at all. In
>> the cases where they are; platform devices can still be used.
>
> In this case, they need an equivalent to a "machine number" information.

Yes.  In the device tree we've been using the root node's compatible
or model property.

>> > oftree could be a great tool if these things would be resolved.
>> > Currently they are not, and in result, ARM just works and is easy,
>> > whereas on PowerPC systems people often spend more time working on
>> > binding stuff than on the actual functionality.
>>
>> That's a rather polarizing statement and I don't think its fair. The
>> FDT is not a magic bullet. It makes aspects of platform independence,
>> code sharing, and board porting simpler, but it is also requires
>> forethought and has overhead associated with it. I don't think anyone
>> is proposing to require all ARM platforms to use the FDT approach.
>
> Sorry, it was not meant to be offending, it just reflects a certain
> level of frustration.
>
> Don't take me wrong: I consider the *idea* behind oftree a good one. It
> just has unsolved problems. If we manage to turn this discussion into
> something that accelerates things into a good direction, I'm all with
> you.

:-)

Understood.  So far I think things are going well, at least nobody has
yet suggested doing something biologically improbable.  :-P

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
