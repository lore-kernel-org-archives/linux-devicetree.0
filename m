From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Boot interface for device trees on ARM
Date: Fri, 4 Jun 2010 14:01:08 -0600
Message-ID: <AANLkTilhqg270l-_m9raalqAPPRhvLJD9omHe8ysgLjg@mail.gmail.com>
References: <201005181054.32325.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1005172341200.12758@xanadu.home>
	<AANLkTilJl9_NHiT1LITG7UbA9S7OYsnGMcDAsFEEx5Ob@mail.gmail.com>
	<alpine.LFD.2.00.1005191055180.12758@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1005191055180.12758-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: nicolas.pitre-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 19, 2010 at 11:52 AM, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> wrote:
> [ Complete boot description and proposal added at the end
> =A0for those interested. ]

Alright, after much thinking, I'm okay with this approach.  None of my
remaining objections are showstoppers.

I've still got a few comments/questions.  I'll restrict them to the
full proposal to avoid confusion.

> Booting Linux on ARM
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Two methods for passing boot information to the Linux kernel on ARM are
> possible:
>
> 1) the legacy method
>
> 2) the DT (device tree) method
>
> The legacy method
> -----------------
[...]
> The DT method
> -------------
>
> The DT method requires that a unique ID be registered for each SOC
> family for the DT purpose within the same ID space. =A0But instead of
> having one ID for each possible machine, only one ID per SOC family is
> required. =A0So the bootloader simply has to pass into r1 the ID
> corresponding to DT instead of the specific machine ID. =A0This is a hard
> requirement.
>
> With this, the kernel can remain largely backward compatible with the
> legacy boot method, requiring _no_ change to the existing code, as the
> ID is sufficient to distinguish between both boot types. =A0The machine
> record remains largely relevant even for a DT boot as the majority of
> its content is SOC specific anyway, and given a per SOC ID for DT usage
> means that the early boot facilities are still usable as is even in the
> DT context. =A0And then the init_machine method in the machine record is
> naturally used to parse the device tree and do its work on multiple
> machines' behalf instead of relying on compiled-in static data for a
> specific machine.

There will still be instances of machine-specific setup code that
needs to be chosen at boot (based on the top level 'compatible'
property), but init_machine() appears to be early enough to handle
this.

hmmm... however, things the device tree blob and the initrd both need
to be marked as bootmem at paging_init() time, but init_machine()
doesn't run until later.  There will still need to be some hooks for
doing early DT processing, but none of that should be either board or
SoC specific.

> The bootloader must also store in memory the DT data and pass its
> location via r2. =A0The r2 initialization therefore becomes a hard
> requirement when a DT is used. The boot_params field in the DT machine
> record could be set to -1 to disable ATAG parsing when a DT machine ID
> is used, and look into the DT data instead.
>
> Backward Compatibility Considerations
> -------------------------------------
>
> Now let's have a look at what happens when we mix this with bootloaders.
>
> If a kernel is too old, or was not configured with the "machine support"
> for DT, then only one thing may happen when a bootloader passes a DT
> machine ID to the kernel. =A0The early boot code will fail to find the
> machine record for the provided ID and refuse to boot. =A0If you have
> CONFIG_DEBUG_LL and are attempting to boot on the right SOC, then you'll
> probably get the error message on a serial port, along with a list of
> the actual machines and their IDs supported by that kernel. =A0In other
> words, this is not a new failure mode. Two solutions: either reconfigure
> your kernel to add DT support for your SOC, or configure your bootloader
> to use the legacy boot method. =A0And having a bootloader that can do DT
> only for a machine that has only legacy support in the kernel is
> senseless, so that case needs no be considered any longer.
>
> The opposite is the kernel being configured for DT _only_, and the
> bootloader being too old, or misconfigured, so it passes a non-DT
> machine ID to the kernel. =A0In this case the same failure mode as above
> will be observed: kernel failing to find the matching machine record and
> halting (after attempting to display the error and the available machine
> supported). Solution: reconfigure your kernel with legacy support for
> that machine.
>
> If the goal is to experiment with DT support in the kernel, and the
> bootloader does not support DT, then some shim can be prepended to the
> kernel image to fix things up. =A0Most bootloaders already have the
> ability to load arbitrary binary data in memory, and branch to arbitrary
> location too. =A0So it should be pretty easy to tftp the kernel, then tftp
> the DT data, to finally branch into the kernel with appropriate values
> in r1 and r2.

A couple of other options here for experimenting is to carry a dtb as
a payload in the zImage wrapper, or to link dtbs directly into the
kernel proper and point to it from the machine structure.  Doing so
would allow even existing machines to use the same DT setup code.

My remaining objection is that the DT-only approach demands firmware
not just pass a dtb blob, but to also modify it.  The ATAG+DT approach
allows current firmware projects to continue passing data in the same
way it does now (less impact on firmware developers to add DT
support).

However, I'm not going to dwell on this point any longer because we
already have at least one firmware project (U-Boot) that understands
the device tree, and other firmware projects can use the shim approach
as a stop gap until native support is added.

It may make for a more painful transition, but you're probably right
in that it is better in the long run.

Go ahead and consider me "agreed".  :-)

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
