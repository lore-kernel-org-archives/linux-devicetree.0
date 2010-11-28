From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 02/11] x86: Add device tree support
Date: Sun, 28 Nov 2010 14:49:07 +0100
Message-ID: <20101128134907.GA30784@www.tglx.de>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-3-git-send-email-bigeasy@linutronix.de>
	<1290807736.32570.143.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1290807736.32570.143.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Benjamin Herrenschmidt | 2010-11-27 08:42:16 [+1100]:

>On Thu, 2010-11-25 at 18:39 +0100, Sebastian Andrzej Siewior wrote:
>> This patch adds minimal support for device tree support on x86. It will
>> be passed to the kernel via setup_data which requires atleast boot
>> protocol 2.09.
>> Memory size, restricted memory regions, boot arguments are gathered the
>> traditional way so things like cmd_line are just here to let the code
>> compile.
>> The current plan is use the device tree as an extension and to gather
>> informations from it which can not be enumerated and have to be
>> hardcoded otherwise. This includes things like
>> - which devices are on this I2C/ SPI bus?
>> - how are the interrupts wired to IO APIC?
>> - where could my hpet be?
>
>How do that work with platforms like OLPC that have a real OF ?
OLPC's openfirmware is embedded into the bootpage where ofw_magic is set
to OLPC_OFW_SIG (0x2057464F). I don't touch this, the device tree is
passed via setup_data. So you could use both at the same time.

>One thing we did on powerpc which among other things allow kexec to work
>on such platforms when we kill OF at boot (it might stay alive on OLPC),
>is to basically detect very early in asm that we are coming from OF,
>have a trampoline that extract the DT and turns it into a flat dtb, then
>continue to the main kernel entry using the dtb method.
>
>That way, one can kexec using the dtb method over and there's one single
>entry point for device-tree use.
>
>Are you doing something similar for x86 ?
Similar. We get most critical parameters from the so called bootpage
(the traditional x86 way) which also contains a pointer to the device
tree (we don't have open firmware or something else where we call back).
We plan to relocate the device tree (before it is unflattered) so the
bootloader does not need to know about the memory layout the kernel is
having. 
On kexec, the bootpage is built from scratch AFAIK. So the kexec loader
needs to suck the dtb from /proc and can add it to the bootpage.

>> Dirk is working on some patches which provide generic infrastructure for
>> linking the dtb into the kernel. Once this is it its final shape, we
>> will relocate the device tree unconditionally. This will remove the
>> requirement for the boot loader to locate the device tree within lowmem.
>
>Linking the dtb into the kernel is something we prefer not doing on
>powerpc and I'm curious why you think that applies better on x86...
This is only for the case where we do not get a dtb from the bootloader
Microblaze also links dtb into the kernel in that case.

>We -do- have ways to include it in the zImage wrapper. However, this is
>different in subtle ways because of the way our zImage wrapper building
>works. Basically, we always build all the per-platform .o's of the
>wrapper that apply to supported platforms by the kernel. The
>binding/linking together of the final wrapper with a kernel image, an
>optional dtb and optional initrd is performed by a shell script that can
>be used outside of the normal build context.

The reason why you have multiple .o wrapper files is because the specific
platform code is not simply passing the device tree but also adding /
updating nodes like MAC address, bus clocks, ... which are coming from
the (different) bd_t struct or something else. The simpleboot target is
covering the case where you just pass the embedded dtb to kernel without
changing it.

On x86 we want to have the bootloader passing us the final dtb. The
in-kernel dtb is more like a generic simpleboot target.

>That means that it's possible for a distro for example to install a
>kernel image, all the wrapper .o files and that script, and at runtime
>rebuild zImage wrappers with the appropriate dtb without having the
>whole built kernel tree at hand.
For the distro reason the in-kernel dtb supports multiple dtbs. So a
distro kernel can include all of them into .init.data section and the
user can specify on the command line which device tree he wants. x86 gets
its command line via the bootpage so it is available before we have a
device tree. Microblaze should also be able to use this mechanism.

>The direction taken by ARM (and possibly newer powerpc platforms as
>well) is to have the dtb be passed by the bootloader. Typically
>bootloaders like uboot provide a way to flash the dtb separately so it
>can be udpated (*).

Yes, we want this as well. But what about the old ARMs where the
bootloader did not have dtb support? What about minimal bootloader which
just initialize the CPU and memory and jump then into the kernel? So the
in-kernel dtb is a simple way to solve this. However I don't know what
to do about updating the MAC address where it is not yet set.

>(*) That brings a separate topic we shall discuss: A consistent way for
>versionning the device-tree would be really useful.
This isn't a problem unless you move nodes or deprecate them, right? Or
do you think about another reason to versionning the device-tree?.

>
>Cheers,
>Ben.

Sebastian
