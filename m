From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Sun, 12 Jun 2011 17:01:22 +0200
Message-ID: <201106121701.22418.arnd@arndb.de>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<201106121615.24059.arnd@arndb.de>
	<20110612143428.GI10283@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110612143428.GI10283-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Petr =?utf-8?q?=C5=A0tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 12 June 2011 16:34:28 Russell King - ARM Linux wrote:
> I don't think you're considering real-world usage scenarios, but instead
> concentrating on the use issues.  If you only do that you're boxing
> yourself into a corner and will cause a world of pain for folk who would
> just like the kernel to be usable.
> 
> The information in ATAGs which will either never be in DT or which should
> override what is in DT is:
> 
> - memory parameters
> - command line
> - initrd location
> - system serial number
> - system revision number

With a device-tree aware boot loader, this is exactly the kind of
information that should be put in the device tree by the boot loader,
along with other parts like local-mac-address and actual presence
of optional devices where the kernel might not have a generic way
of probing whether they are there.

> This is the kind of information which should override whatever is in
> DT because the DT contained information could well be wrong or outdated,
> and its not the kind of information that anything other than core code
> should be dealing with in any case.

Of course it should override the device tree, I'm not arguing that.
All I'm saying is that we don't need to special-case this or support
both formats once the kernel is there as long as we move the information
into appropriate DT-representation of the same data.

The attributes you are looking for are for the information you listed:

/memory/*
/chosen/bootargs
/chosen/linux,initrd-{start,end}
/serial-number
/compatible

PowerPC was facing the exact same problem, see arch/powerpc/boot/main.c
for the solution used there. The way that the boot entry point on powerpc
works is to have a boot-protocol specific entry from which all the
necessary information is taken and then put into a flattened device tree
either built from scratch (in case of real OF) or patched into a prebuilt
device tree. From there we pass the flattened device tree with all the
correct information into the actual boot stage. In some cases, the entry
points are identical and we just jump back to the start with the updated
information.

Having a complete and correct device tree is essential for instance to make
kexec work, because the new kernel will only have the information from
the device tree available but not have access to atags, uefi of open
firmware.

It may be a good idea to preserve the atags in a new property in the
device tree, so we are able to inspect them later.

	Arnd
