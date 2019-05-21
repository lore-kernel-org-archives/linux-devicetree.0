From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC/PATCH 0/4] Initial support for modular IOMMU drivers
Date: Tue, 21 May 2019 17:08:31 +0100
Message-ID: <375bd035-23a5-15d0-0629-b11b32a5adfd@arm.com>
References: <1558118857-16912-1-git-send-email-isaacm@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <1558118857-16912-1-git-send-email-isaacm-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: "Isaac J. Manjarres" <isaacm-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, lmark-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/05/2019 19:47, Isaac J. Manjarres wrote:
> This series adds initial support for being able to use the ARM
> SMMU driver as a loadable kernel module. The series also adds
> to the IOMMU framework, so that it can defer probing for devices
> that depend on an IOMMU driver that may be a loadable module.
> 
> The primary reason behind these changes is that having the ARM
> SMMU driver as a module allows for the same kernel image to be
> used across different platforms. For example, if one platform
> contains an IOMMU that implements one version of the ARM SMMU
> specification, and another platform simply does not have an
> IOMMU, the only way that these platforms can share the same
> kernel image is if the ARM SMMU driver is compiled into the
> kernel image.
> 
> This solution is not scalable, as it will lead to bloating the
> kernel image with support for several future versions of the
> SMMU specification to maintain a common kernel image that works
> across all platforms.

There are currently two versions of the SMMU spec: v2 (which forms a 
superset of v1), and v3 which is the current architecture. Given how 
closely I work with the SMMU architecture team, I'm particularly 
interested to hear more about these "future versions"... :)

> Having the ARM SMMU driver as a module allows
> for a common kernel image to be supported across all platforms,
> while yielding a smaller kernel image size, since the correct
> SMMU driver can be loaded at runtime, if necessary.

arm-smmu and arm-smmu-v3 aren't *all* that much bigger than any of the 
other IOMMU drivers that are also present in a multiplatform build, and 
already share quite a bit of common code, so while I can guess at what 
you might really mean, it's a pretty weak argument as stated.

> Patchset Summary:
> 
> 1. Since the ARM SMMU driver depends on symbols being exported from
> several subsystems, the first three patches are dedicated to exporting
> the necessary symbols.
> 
> 2. Similar to how the pinctrl framework handles deferring probes,
> the subsequent patch makes it so that the IOMMU framework will defer
> probes indefinitely if there is a chance that the IOMMU driver that a
> device is waiting for is a module. Otherwise, it upholds the current
> behavior of stopping probe deferrals once all of the builtin drivers
> have finished probing.
> 
> The ARM SMMU driver currently has support for the deprecated
> "mmu-masters" binding, which relies on the notion of initcall
> ordering for setting the bus ops to ensure that all SMMU devices
> have been bound to the driver. This poses a problem with
> making the driver a module, as there is no such notion with
> loadable modules. Will support for this be completely deprecated?
> If not, might it be useful to leverage the device tree ordering,
> and assign a property to the last SMMU device, and set the bus ops
> at that point? Or perhaps have some deferred timer based approach
> to know when to set the bus ops?

Unfortunately, I believe the old binding is still deployed in production 
firmwares which may well never get updated, and thus needs to remain 
functional (I've already had one report of the default bypass behaviour 
breaking it in 5.2 which I need to fix somehow...)

Rather than just the trivial "export a bunch of symbols which won't 
actually be needed yet", from the title I was hoping to see some patches 
really making drivers modular and proposing solutions to those difficult 
problems of making it work robustly. It's very easy to make it 'work' as 
a proof-of-concept (locally I still have a patch dated 2016 based on the 
original probe-deferral work), but those questions really want answering 
to some degree before it's worth doing any of this in mainline.

Robin.

(now starting to wonder whether this might be my own fault for 
mentioning it at LPC... :P)

> 
> Thanks,
> Isaac
> 
> Isaac J. Manjarres (4):
>    of: Export of_phandle_iterator_args() to modules
>    PCI: Export PCI ACS and DMA searching functions to modules
>    iommu: Export core IOMMU functions to kernel modules
>    iommu: Add probe deferral support for IOMMU kernel modules
> 
>   drivers/iommu/iommu-sysfs.c | 3 +++
>   drivers/iommu/iommu.c       | 6 ++++++
>   drivers/iommu/of_iommu.c    | 8 ++++++--
>   drivers/of/base.c           | 1 +
>   drivers/pci/pci.c           | 1 +
>   drivers/pci/search.c        | 1 +
>   6 files changed, 18 insertions(+), 2 deletions(-)
> 
