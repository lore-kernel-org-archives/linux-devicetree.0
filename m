From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: Boot interface for device trees on ARM
Date: Wed, 19 May 2010 13:52:32 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1005191055180.12758@xanadu.home>
References: <201005181054.32325.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1005172341200.12758@xanadu.home>
	<AANLkTilJl9_NHiT1LITG7UbA9S7OYsnGMcDAsFEEx5Ob@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_6alxMc4tXYB4UptE4SZaYw)"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <AANLkTilJl9_NHiT1LITG7UbA9S7OYsnGMcDAsFEEx5Ob-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-id: <alpine.LFD.2.00.1005191107560.12758-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: nicolas.pitre-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_6alxMc4tXYB4UptE4SZaYw)
Content-id: <alpine.LFD.2.00.1005191107561.12758-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
Content-type: TEXT/PLAIN; CHARSET=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

[ Complete boot description and proposal added at the end
  for those interested. ]

On Wed, 19 May 2010, Grant Likely wrote:

> On Mon, May 17, 2010 at 10:34 PM, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> wrot=
e:
> > On Tue, 18 May 2010, Jeremy Kerr wrote:
> >> Some notes about this scheme:
> >>
> >> =A0- This would break compatibility with the existing boot interface=
:
> >> bootloaders that expect a DT kernel will not be able to boot a non-D=
T kernel.
> >> However, does this matter? Once the machine support (ie, bootloader =
and
> >> kernel) is done, we don't expect to have to enable both methods.
> >
> > I think that, for the moment, it is best if the bootloader on already
> > existing subarchitectures where DT is introduced still preserve the
> > already existing ability to boot using ATAGs. =A0This allows for the
> > testing and validation of the DT concept against the legacy ATAG meth=
od
> > more easily.
>=20
> I think we've got an agreement!  :-)

Good.

> > On new subarchitectures, it might make sense to go with DT from the
> > start instead of creating setup code for every single machine. =A0In =
that
> > case the bootloader for those machines would only need to care about =
DT
> > and forget about ATAGs.
> >
> >> =A0+ A simpler boot interface, so less to do (and get wrong) in the =
bootloader
> >>
> >> =A0+ We don't have two potential sources of boot information
> >
> > Those last two are IMHO the biggest reasons for not having both ATAGs
> > and DT at the same time. =A0Otherwise the confusion about which one i=
s
> > authoritative, which one has precedence over the other, and/or whethe=
r
> > the information should be obtained from one structure if it is missin=
g
> > from the other will simply bite us eventually for sure, as bootloader
> > writers will get sloppy/lazy and have it wrong. =A0I strongly suggest=
 that
> > we should specify that the kernel must consider either ATAGs _or_ a
> > device tree, and that the bootloader must pass only one of them.
>=20
> I still disagree on this point.  I think it will cause less confusion
> to only have a single method for passing the dtb, but that is a debate
> that we don't need to solve immediately since we've got a way forward
> on passing the dtb now.

I don't understand you here.  We still are not in agreement on the=20
method to pass the DTB yet, but I for sure don't want more than one=20
method to pass it to the kernel.

There is a proposal to use the ATAG facility to encapsulate a pointer to=20
the DT data.  I think this is unnecessary.

I'd much prefer if r2 contained either a pointer to the ATAG list, or a=20
pointer to the DTB.  That's much cleaner and simpler.  As Jeremy pointed=20
out, both structures include a magic number allowing to distinguish one=20
from the other, so there is no backward compatibility issues.

> >> This proposal still does not require ATAG_DEVTREE?
> >
> > No.
>
> Hmmm...  I misunderstood then.  I don't agree that this is the best
> way forward
>
> Doing it this way means a non-compatible break in the interface.  It
> means that the bootloader needs to know what interface the kernel is
> expecting for boot; information that is not readily available from the
> image type.

I don't follow your point here.

It is not up to the bootloader to "adjust" to the kernel.  But rather=20
for the kernel to cope with the bootloader's provided information.  If=20
the bootloader passes a specific machine ID with the ATAG list then the=20
kernel will use that, and if the bootloader passes a DT machine ID with=20
a DT blob then the kernel will use that.  You just have to configure=20
your kernel with both "machine types" at the same time.

> The user then needs to tell the boot loader which
> interface to use rather than a backwards compatible addition of a blob
> of data.

This is certainly not a show stopper, right?  If you planned for your=20
bootloader to _already_ support both the ATAGs and the DT at the same=20
time, it is not a big deal to have a config option that the user can=20
change to select between "legacy" and "DT" boot methods.  Since we still=20
want to preserve the ability to have a DT enabled kernel to boot using=20
the legacy method, you will need a way to tell the bootloader which=20
machine ID to use in that case anyway.

> You mention below "shifting the World Order on ARM" and it creating
> resistance for merging DT support.  Isn't this much the same thing as
> it creates a non backwards compatible change in the way bootloaders
> pass data to the kernel.  The cutover in powerpc from the old
> interface to the new caused no end of confusion and people who could
> no longer get their systems to boot.  On PowerPC is was necessary
> because the old method was completely broken, but ATAGs are clean,
> simple and well implemented.

I don't dispute the ATAG implementation.  I don't believe it is a good=20
thing to carry the ATAG and DT as a combined boot requirement going=20
forward.

On one hand, some people are claiming that the machine ID should be=20
stuffed in the device tree and whatever is passed into r1 should be=20
ignored.  On the other hand, you are saying that ATAGs should be kept=20
forever as legacy cruft just to provide a reference to the DT data.  To=20
me those are incompatible design objectives.

> It also means teaching every boot loader two separate methods for
> booting and exposing those differences to the user.

That's overstating the problem.  First, any bootloader wanting to use DT=20
_will_ have to implement such a method.  With your proposal, all those=20
bootloaders will _also_ have to know about ATAGs anyway.  So I don't see=20
what your point is.

Let me start it all over again.

Here's how I think this should be handled on ARM.  Sorry PPC folks, but=20
there is 15 years of ARM legacy to consider here, and what has been done=20
on PPC might or might not be practical here -- please keep that in mind. =
=20
I'm also going to use the present tense so to make this proposal as=20
unambiguous as possible.

Booting Linux on ARM
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Two methods for passing boot information to the Linux kernel on ARM are=20
possible:

1) the legacy method

2) the DT (device tree) method

The legacy method
-----------------

The legacy method for booting Linux on ARM requires that a unique=20
machine ID be registered with RMK's machine ID database.  It can be=20
viewed online at http://www.arm.linux.org.uk/developer/machines/. =20
Before branching into the kernel image, the CPU register r1 must be=20
initialized by the bootloader with the appropriate machine ID value for=20
the exact hardware the kernel is booted on.  That is a hard requirement.

The kernel must also contain code specific to that machine ID in order=20
to perform early setup of appropriate resources, create mappings for=20
basic peripherals such as hardware timers, register relevant platform=20
devices, etc.  That code can be found in those files containing the=20
MACHINE_START and MACHINE_END macros, typically in arch/arm/mach-*/*.c. =20
This is also a hard requirement.

Optionally (but strongly recommended), a tagged list (aka ATAGs) may be=20
created in memory to pass extra information such as the size and=20
location for RAM banks, size and location for a ramdisk, the kernel=20
cmdline string, etc.  When not provided, the kernel will rely on default=20
values which may or may not be sufficient to boot the kernel, or fall=20
back to the information provided by a built-in kernel cmdline string=20
determined by CONFIG_CMDLINE.

The location of the ATAG list is somewhat problematic.  Traditionally it=20
has been stored at an offset of 0x100 from start of memory.  But some=20
proposals were pushed forward to use r2 to indicate the location of the=20
ATAG list.  Because it is impossible to determine with certainty whether=20
or not the bootloader does actually initialize r2 with that information,=20
this requirement was never enforced, which would otherwise cause=20
backward compatibility issues.  The ATAG location is therefore stored=20
into the machine record structure and therefore hardcoded at compile=20
time.

When the kernel boots, it looks up into a table of all the machine=20
records that have been compiled into the kernel for the one that=20
corresponds with the machine ID passed into r1.  This lookup is=20
performed in the very early boot stage from assembly code (with no stack=20
available) to set up basic MMU stuff that is necessary for the kernel to=20
be debuggable until the full fledged MMU support code takes over later=20
during the boot.  Later on, the machine record is used to call init=20
functions to initialize IO mappings, IRQs, timers, and so on as=20
described above.  While the init_machine field in the machine record is=20
obviously machine specific, all the other fields in the machine record=20
end up being pretty much the same across all machines within the same=20
SOC family.

The DT method
-------------

The DT method requires that a unique ID be registered for each SOC=20
family for the DT purpose within the same ID space.  But instead of=20
having one ID for each possible machine, only one ID per SOC family is=20
required.  So the bootloader simply has to pass into r1 the ID=20
corresponding to DT instead of the specific machine ID.  This is a hard=20
requirement.

With this, the kernel can remain largely backward compatible with the=20
legacy boot method, requiring _no_ change to the existing code, as the=20
ID is sufficient to distinguish between both boot types.  The machine=20
record remains largely relevant even for a DT boot as the majority of=20
its content is SOC specific anyway, and given a per SOC ID for DT usage=20
means that the early boot facilities are still usable as is even in the=20
DT context.  And then the init_machine method in the machine record is=20
naturally used to parse the device tree and do its work on multiple=20
machines' behalf instead of relying on compiled-in static data for a=20
specific machine.

The bootloader must also store in memory the DT data and pass its=20
location via r2.  The r2 initialization therefore becomes a hard=20
requirement when a DT is used. The boot_params field in the DT machine=20
record could be set to -1 to disable ATAG parsing when a DT machine ID=20
is used, and look into the DT data instead.

Backward Compatibility Considerations
-------------------------------------

Now let's have a look at what happens when we mix this with bootloaders.

If a kernel is too old, or was not configured with the "machine support"=20
for DT, then only one thing may happen when a bootloader passes a DT=20
machine ID to the kernel.  The early boot code will fail to find the=20
machine record for the provided ID and refuse to boot.  If you have=20
CONFIG_DEBUG_LL and are attempting to boot on the right SOC, then you'll=20
probably get the error message on a serial port, along with a list of=20
the actual machines and their IDs supported by that kernel.  In other=20
words, this is not a new failure mode. Two solutions: either reconfigure=20
your kernel to add DT support for your SOC, or configure your bootloader=20
to use the legacy boot method.  And having a bootloader that can do DT=20
only for a machine that has only legacy support in the kernel is=20
senseless, so that case needs no be considered any longer.

The opposite is the kernel being configured for DT _only_, and the=20
bootloader being too old, or misconfigured, so it passes a non-DT=20
machine ID to the kernel.  In this case the same failure mode as above=20
will be observed: kernel failing to find the matching machine record and=20
halting (after attempting to display the error and the available machine=20
supported). Solution: reconfigure your kernel with legacy support for=20
that machine.

If the goal is to experiment with DT support in the kernel, and the=20
bootloader does not support DT, then some shim can be prepended to the=20
kernel image to fix things up.  Most bootloaders already have the=20
ability to load arbitrary binary data in memory, and branch to arbitrary=20
location too.  So it should be pretty easy to tftp the kernel, then tftp=20
the DT data, to finally branch into the kernel with appropriate values=20
in r1 and r2.

Conclusion
----------

I hope I've illustrated clearly why 1) keeping the requirement for=20
passing a machine ID into r1, even for DT, is useful, and 2) why=20
dropping ATAGs when using DT is simpler, cleaner, and has no relevant=20
backward compatibility issues.  With #1 the ability to seamlessly use=20
the existing early debugging code is preserved, and the introduction of=20
DT fits perfectly well in the existing machine support model on ARM. Yet=20
the new boot requirements introduced with DT are only for "machine" IDS=20
that are still not in use, meaning there is no backward compatibilities=20
introduced at all.  With #2 it will be possible to simplify bootloader=20
support for new platforms being DT enabled without any legacy needs, and=20
when the kernel is configured only for DT support then it will be=20
possible to configure out the ATAG support code entirely.


Nicolas

--Boundary_(ID_6alxMc4tXYB4UptE4SZaYw)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--Boundary_(ID_6alxMc4tXYB4UptE4SZaYw)--
