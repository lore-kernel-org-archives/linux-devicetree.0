From: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 18:20:00 +0200
Message-ID: <20090527162000.GM6805@pengutronix.de>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<fa686aa40905270839m375bbdacqb1acb1be0a2d2da0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa40905270839m375bbdacqb1acb1be0a2d2da0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

Hi Grant,

On Wed, May 27, 2009 at 09:39:21AM -0600, Grant Likely wrote:
> This is a MPC5200 is the posterchild for device tree wreckage; mostly
> because of my own inexperience at the time.  A lot of mistakes were
> made and I freely admit that.
>
> However, my counter example is Xilinx Virtex support. The Virtex is an
> FPGA with all the devices instantiated in the FPGA fabric. It would
> be a nightmare to try and describe each different FPGA bitstream using
> hand coded platform devices, and the xparameters.h file exported by
> the Xilinx toolchain wasn't much better. Encoding the machine layout
> in a data structure (the device tree) has decoupled FPGA changes from
> the kernel image. Now FPGA engineers can make major changes to FPGA
> layouts without having to lockstep with changes in the kernel. I
> regularly boot a single kernel image on multiple bitstream images.
>
> That being said, the problems we have had are the reason why it is
> *not* recommended to hard link the device tree image into firmware.
> We do commit to not breaking old trees, but the ability to update is
> important; particularly for enabling new features/drivers.

Point taken.

We often have the situation that we have

- a SoC cpu from vendor A
- a module with the cpu+ram+peripherals from vendor B
- a baseboard from vendor C
- sometimes an extension board from vendor D

All that with non-introspectable busses, like chip select busses, SPI,
i2c, FPGA-internal busses etc. We recently tried to put oftree sniplets
into the devices (one into the module, one in the baseboard etc), let
u-boot collect these sniplets and build an oftree out of it. It doesn't
work. If you try this, you'll quickly find out that you would have to
put the schematics into the oftree. A peripheral pin can be routed to a
ball, goes from a connector of the module to a baseboard, to the
extension board, come back and go to another unit on the SoC. This
cannot be described in the oftree. At one place, you need to *know*
about the whole hardware that you have and have a single "we have X" to
"X's oftree" mapping.

In the end, having a single "X needs these platform data" kernel source
file is much, much cleaner and less error prone than what we currently
have with the oftree.

> > - The oftree layering is fundamentally broken. We already have a sane
> > =A0abstraction for arbitrary hardware in the kernel: platform devices.
> > =A0Why not instanciate platform devices from a generic oftree core?
>
> No; the oftree is a data structure. That is it, nothing more.

Unfortunately, it is an incomplete data structure regarding to what the
kernel needs.

> > - Platform data makes it possible to store function pointers. There
> > =A0is no equivalent to this concept in oftree-land.
>
> But there is concept of platform specific code. In the majority of
> cases platform specific function pointers aren't needed at all. In
> the cases where they are; platform devices can still be used.

In this case, they need an equivalent to a "machine number" information.

> > oftree could be a great tool if these things would be resolved.
> > Currently they are not, and in result, ARM just works and is easy,
> > whereas on PowerPC systems people often spend more time working on
> > binding stuff than on the actual functionality.
>
> That's a rather polarizing statement and I don't think its fair. The
> FDT is not a magic bullet. It makes aspects of platform independence,
> code sharing, and board porting simpler, but it is also requires
> forethought and has overhead associated with it. I don't think anyone
> is proposing to require all ARM platforms to use the FDT approach.

Sorry, it was not meant to be offending, it just reflects a certain
level of frustration.

Don't take me wrong: I consider the *idea* behind oftree a good one. It
just has unsolved problems. If we manage to turn this discussion into
something that accelerates things into a good direction, I'm all with
you.

rsc
-- =

Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
