From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
 wait-for-safe logic
Date: Tue, 25 Jun 2019 12:34:56 +0530
Message-ID: <CAFp+6iF0TQtAy2JFXk6zjX5GpjeLFesqPZV6ezbDXmc85yvMEA@mail.gmail.com>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-4-vivek.gautam@codeaurora.org> <20190614040520.GK22737@tuxbook-pro>
 <3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org> <20190618175218.GH4270@fuggles.cambridge.arm.com>
 <CAFp+6iEynLa=Jt_-oAwt4zmzxzhEXtWNCmghz6rFzcpQVGwrMg@mail.gmail.com> <20190624170348.7dncuc5qezqeyvq2@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624170348.7dncuc5qezqeyvq2@willie-the-truck>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>, robh+dt <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Will,


On Mon, Jun 24, 2019 at 10:33 PM Will Deacon <will@kernel.org> wrote:
>
> [+Krishna]
>
> Hi Vivek,
>
> On Mon, Jun 24, 2019 at 03:58:32PM +0530, Vivek Gautam wrote:
> > On Tue, Jun 18, 2019 at 11:22 PM Will Deacon <will.deacon@arm.com> wrote:
> > > On Fri, Jun 14, 2019 at 02:48:07PM +0530, Vivek Gautam wrote:
> > > > On 6/14/2019 9:35 AM, Bjorn Andersson wrote:
> > > > > On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:
> > > > > > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > > > > > index 0ad086da399c..3c3ad43eda97 100644
> > > > > > --- a/drivers/iommu/arm-smmu.c
> > > > > > +++ b/drivers/iommu/arm-smmu.c
> > > > > > @@ -39,6 +39,7 @@
> > > > > >   #include <linux/pci.h>
> > > > > >   #include <linux/platform_device.h>
> > > > > >   #include <linux/pm_runtime.h>
> > > > > > +#include <linux/qcom_scm.h>
> > > > > >   #include <linux/slab.h>
> > > > > >   #include <linux/spinlock.h>
> > > > > > @@ -177,6 +178,7 @@ struct arm_smmu_device {
> > > > > >           u32                             features;
> > > > > >   #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
> > > > > > +#define ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA (1 << 1)
> > > > > >           u32                             options;
> > > > > >           enum arm_smmu_arch_version      version;
> > > > > >           enum arm_smmu_implementation    model;
> > > > > > @@ -262,6 +264,7 @@ static bool using_legacy_binding, using_generic_binding;
> > > > > >   static struct arm_smmu_option_prop arm_smmu_options[] = {
> > > > > >           { ARM_SMMU_OPT_SECURE_CFG_ACCESS, "calxeda,smmu-secure-config-access" },
> > > > > > + { ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA, "qcom,smmu-500-fw-impl-safe-errata" },
> > > > > This should be added to the DT binding as well.
> > > >
> > > > Ah right. I missed that. Will add this and respin unless Robin and Will have
> > > > concerns with this change.
> > >
> > > My only concern really is whether it's safe for us to turn this off. It's
> > > clear that somebody went to a lot of effort to add this extra goodness to
> > > the IP, but your benchmarks suggest they never actually tried it out after
> > > they finished building it.
> > >
> > > Is there some downside I'm not seeing from disabling this stuff?
> >
> > This wait-for-safe is a TLB invalidation enhancement to help display
> > and camera devices.
> > The SMMU hardware throttles the invalidations so that clients such as
> > display and camera can indicate when to start the invalidation.
> > So the SMMU essentially reduces the rate at which invalidations are
> > serviced from its queue. This also throttles the invalidations from
> > other masters too.
> >
> > On sdm845, the software is expected to serialize the invalidation
> > command loading into SMMU invalidation FIFO using hardware locks
> > (downstream code [2]), and is also expected to throttle non-real time
> > clients while waiting for SAFE==1 (downstream code[2]). We don't do
> > any of these yet, and as per my understanding as this wait-for-safe is
> > enabled by the bootloader in a one time config, this logic reduces
> > performance of devices such as usb and ufs.
> >
> > There's isn't any downside from disabling this logic until we have all
> > the pieces together from downstream in upstream kernels, and until we
> > have sdm845 devices that are running with full display/gfx stack
> > running. That's when we plan to revisit this and enable all the pieces
> > to get display and USB/UFS working with their optimum performance.
>
> Generally, I'd agree that approaching this incrementally makes sense, but
> in this case you're adding new device-tree properties
> ("qcom,smmu-500-fw-impl-safe-errata") in order to do so, which seems
> questionable if they're only going to be used in the short-term and will
> be obsolete once Linux knows how to drive the device properly.

This device tree property will still be valid when we handle the wait-for-safe
properly for sdm845.
("qcom,smmu-500-fw-impl-safe-errata") property represents just that the
firmware has handles to do the entire sequence -
* read the secure register
* set/reset the bits in the register to enable/disable wait-for-safe for certain
  devices.
And this is valid when firmware masks access to this register from any other
EE.
So we don't have to do anything that, for example, we were doing for sdm845
based cheza's firmware [1] that implements simple scm handlers to read/write
secure registers.

And fyi, some of the newer SoCs too have this logic, and kernel can have that
extra bit of page-table-ops to handle wait-safe toggling.

[1] https://lore.kernel.org/patchwork/patch/983917/
>
> Instead, I think this needs to be part of a separate file that is maintained
> by you, which follows on from the work that Krishna is doing for nvidia
> built on top of Robin's prototype patches:
>
> http://linux-arm.org/git?p=linux-rm.git;a=shortlog;h=refs/heads/iommu/smmu-impl

Looking at this branch quickly, it seem there can be separate implementation
level configuration file that can be added.
But will this also handle separate page table ops when required in future.

Best regards
Vivek

>
> Once we have that, you can key this behaviour off the compatible string
> rather than having to add quirk properties to reflect the transient needs of
> Linux.
>
> Krishna -- how have you been getting on with the branch above?
>
> Will
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
