From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 08:27:10 -0600
Message-ID: <fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
References: <1243408083.13460.14.camel@debian-nb>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1243408083.13460.14.camel@debian-nb>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 1:08 AM, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org> wrote:
> Hi, All
>
> Currently, ARM linux uses mach-type to figure out platform. But mach-type=
 could not handle variants well and it doesn't tell the kernel about info a=
bout attached peripherals.
>
> The device-tree used by powerpc and sparc could simplifiy board ports, le=
ss platform specific code and simplify device driver code.
>
> Please reference to Grant Likely and Josh Boyer's paper, A Symphony of Fl=
avours: Using the device tree to describe embedded hardware , for the detai=
l of device tree.
>
> www.kernel.org/doc/ols/2008/ols2008v2-pages-27-38.pdf
>
> Signed-off-by: janboe <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>

Heeheehe, This is Fantastic.  I'm actually working on this too.  Would
you like to join our efforts?

> =A0arch/arm/include/asm/of_device.h =A0 | =A0 32 +++
> =A0arch/arm/include/asm/of_platform.h | =A0 39 ++++
> =A0arch/arm/include/asm/prom.h =A0 =A0 =A0 =A0| =A0367 ++++++++++++++++++=
++++++++++++++
> =A0arch/arm/include/asm/setup.h =A0 =A0 =A0 | =A0 =A08 +
>  arch/arm/kernel/Makefile           |    1 +
>  arch/arm/kernel/prom.c             |  414 ++++++++++++++++++++++++++++++=
++++++
>  arch/arm/kernel/setup.c            |    2 +

Right now we've got 3 platforms in mainline using the OF
infrastructure (sparc, powerpc & microblaze), and 2 using the
Flattened Device Tree (powerpc & microblaze).  Unfortunately, all of
the FDT stuff is duplicated between the 2 ports, along with some OF
support functions which could be common.  I don't want to see it
duplicated yet again.  First thing to do is to factor out the common
code and then make that buildable on ARM.

Another thing that needs to be done is to make the OF code endian
safe.  The FDT format is all in network-byte-order, but since the
current users are all big endian, not enough care has been taken to
use the appropriate nto*() functions when reading data out of the
tree.

> +/* process flat device tree for hardware configuration */
> +static int __init parse_tag_flat_dev_tree_address(const struct tag *tag)
> +{
> + =A0 =A0phys_flat_dev_tree_address =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tag->u.flat_dev_tree_addres=
s.flat_dev_tree_address;
> + =A0 =A0phys_flat_dev_tree_size =3D tag->u.flat_dev_tree_address.flat_de=
v_tree_size;
> +
> + =A0 =A0have_of =3D 1;
> + =A0 =A0if (phys_flat_dev_tree_size)
> + =A0 =A0 =A0 initial_boot_params =3D phys_to_virt(phys_flat_dev_tree_add=
ress);
> +
> + =A0 =A0printk(KERN_INFO
> + =A0 =A0 =A0 "%s: flat_dev_tree_address=3D0x%08x, flat_dev_tree_size =3D=
=3D 0x%08X\n",
> + =A0 =A0 =A0 __func__,
> + =A0 =A0 =A0 phys_flat_dev_tree_address,
> + =A0 =A0 =A0 phys_flat_dev_tree_size);
> +
> + =A0 =A0return 0;
> +}
> +
> +__tagtable(ATAG_FLAT_DEV_TREE_ADDRESS, parse_tag_flat_dev_tree_address);

I like this approach.  By using an ATAG, it doesn't force the ARM
kernel to use the FDT.  Of a platform provides one, then great, the
board port can use it.  If not, then it doesn't break existing board
ports.

An unanswered question is how platforms will make use of the FDT data.
 One idea is to define a new machine number for "FDT described
platform", and then probe what board-specific setup code to use from
data in the tree.  Another is if an FDT blob is provided on an
existing board which already has a machine number, then the board code
can be modified to extract device descriptions out of the tree.

I've found that even when firmware does not provide FDT support, it is
still useful to use the FDT data structure and to link it into the
kernel image itself.  There isn't the advantage of building a
multiplatform image in this case, but I find that it tends to result
in more common code between board ports using the same SoC or even
same core.  ie.  Most of the PowerPC eval boards using one of the 440
core variants can be supported by the file
arch/powerpc/platforms/440/ppc44x_simple.c, which is less than 100
lines long.

One thing I'd like to stress is that in powerpc land we make a lot of
mistakes on device tree usage conventions and bindings.  There is a
broad history of experience in the old OpenFirmware documents.  I
often found problems I was trying to solve with FDT already had been
solved by the OpenFirmware folks years ago.  General agreement now is
that all new bindings *must* be documented and reviewed before a
driver using them are merged (the documentation and driver can be
reviewed at the same time).  Right now the documentation is held in
Documentation/powerpc/fdt-bindings/, but that can be moved to a more
common location.  The mailing list for device tree review is
devicetree-discuss-mnsaURCQ41u4UlQgPVntAg@public.gmane.org  It's also a good place to go for
questions.

I've been toying with the idea for a while now of splitting the device
tree bindings documentation out of the kernel entirely so that it is
useful for other projects too.  For example, I believe that the
FreeBSD ARM community has expressed some interest in the FDT approach.

g.

> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 68d6494..8b219ec 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -35,6 +35,7 @@
> =A0#include <asm/cacheflush.h>
> =A0#include <asm/cachetype.h>
> =A0#include <asm/tlbflush.h>
> +#include <asm/prom.h>
>
> =A0#include <asm/mach/arch.h>
> =A0#include <asm/mach/irq.h>
> @@ -726,6 +727,7 @@ void __init setup_arch(char **cmdline_p)
> =A0 =A0 =A0 =A0parse_cmdline(cmdline_p, from);
> =A0 =A0 =A0 =A0paging_init(mdesc);
> =A0 =A0 =A0 =A0request_standard_resources(&meminfo, mdesc);
> + =A0 =A0 =A0 unflatten_device_tree();
>
> =A0#ifdef CONFIG_SMP
> =A0 =A0 =A0 =A0smp_init_cpus();
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index f821dbc..c23a6ea 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -1,6 +1,6 @@
> =A0config OF_DEVICE
> =A0 =A0 =A0 =A0def_bool y
> - =A0 =A0 =A0 depends on OF && (SPARC || PPC_OF)
> + =A0 =A0 =A0 depends on OF && (SPARC || PPC_OF || ARM)
>
> =A0config OF_GPIO
> =A0 =A0 =A0 =A0def_bool y
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
