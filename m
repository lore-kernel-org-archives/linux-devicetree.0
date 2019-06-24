From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
	wait-for-safe logic
Date: Mon, 24 Jun 2019 15:58:32 +0530
Message-ID: <CAFp+6iEynLa=Jt_-oAwt4zmzxzhEXtWNCmghz6rFzcpQVGwrMg@mail.gmail.com>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
	<20190612071554.13573-4-vivek.gautam@codeaurora.org>
	<20190614040520.GK22737@tuxbook-pro>
	<3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org>
	<20190618175218.GH4270@fuggles.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20190618175218.GH4270-UDVVEH7NWB15pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
	Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Will,

On Tue, Jun 18, 2019 at 11:22 PM Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
>
> Hi Vivek,
>
> On Fri, Jun 14, 2019 at 02:48:07PM +0530, Vivek Gautam wrote:
> > On 6/14/2019 9:35 AM, Bjorn Andersson wrote:
> > > On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:
> > >
> > > > Qcom's implementation of arm,mmu-500 adds a WAIT-FOR-SAFE logic
> > > > to address under-performance issues in real-time clients, such as
> > > > Display, and Camera.
> > > > On receiving an invalidation requests, the SMMU forwards SAFE request
> > > > to these clients and waits for SAFE ack signal from real-time clients.
> > > > The SAFE signal from such clients is used to qualify the start of
> > > > invalidation.
> > > > This logic is controlled by chicken bits, one for each - MDP (display),
> > > > IFE0, and IFE1 (camera), that can be accessed only from secure software
> > > > on sdm845.
> > > >
> > > > This configuration, however, degrades the performance of non-real time
> > > > clients, such as USB, and UFS etc. This happens because, with wait-for-safe
> > > > logic enabled the hardware tries to throttle non-real time clients while
> > > > waiting for SAFE ack signals from real-time clients.
> > > >
> > > > On MTP sdm845 devices, with wait-for-safe logic enabled at the boot time
> > > > by the bootloaders we see degraded performance of USB and UFS when kernel
> > > > enables the smmu stage-1 translations for these clients.
> > > > Turn off this wait-for-safe logic from the kernel gets us back the perf
> > > > of USB and UFS devices until we re-visit this when we start seeing perf
> > > > issues on display/camera on upstream supported SDM845 platforms.
>
> Re-visit what exactly, and how?
>
> > > > Now, different bootloaders with their access control policies allow this
> > > > register access differently through secure monitor calls -
> > > > 1) With one we can issue io-read/write secure monitor call (qcom-scm)
> > > >     to update the register, while,
> > > > 2) With other, such as one on MTP sdm845 we should use the specific
> > > >     qcom-scm command to send request to do the complete register
> > > >     configuration.
> > > > Adding a separate device tree flag for arm-smmu to identify which
> > > > firmware configuration of the two mentioned above we use.
> > > > Not adding code change to allow type-(1) bootloaders to toggle the
> > > > safe using io-read/write qcom-scm call.
> > > >
> > > > This change is inspired by the downstream change from Patrick Daly
> > > > to address performance issues with display and camera by handling
> > > > this wait-for-safe within separte io-pagetable ops to do TLB
> > > > maintenance. So a big thanks to him for the change.
> > > >
> > > > Without this change the UFS reads are pretty slow:
> > > > $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=10 conv=sync
> > > > 10+0 records in
> > > > 10+0 records out
> > > > 10485760 bytes (10.0MB) copied, 22.394903 seconds, 457.2KB/s
> > > > real    0m 22.39s
> > > > user    0m 0.00s
> > > > sys     0m 0.01s
> > > >
> > > > With this change they are back to rock!
> > > > $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=300 conv=sync
> > > > 300+0 records in
> > > > 300+0 records out
> > > > 314572800 bytes (300.0MB) copied, 1.030541 seconds, 291.1MB/s
> > > > real    0m 1.03s
> > > > user    0m 0.00s
> > > > sys     0m 0.54s
> > > >
> > > > Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > > > ---
> > > >   drivers/iommu/arm-smmu.c | 16 ++++++++++++++++
> > > >   1 file changed, 16 insertions(+)
> > > >
> > > > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > > > index 0ad086da399c..3c3ad43eda97 100644
> > > > --- a/drivers/iommu/arm-smmu.c
> > > > +++ b/drivers/iommu/arm-smmu.c
> > > > @@ -39,6 +39,7 @@
> > > >   #include <linux/pci.h>
> > > >   #include <linux/platform_device.h>
> > > >   #include <linux/pm_runtime.h>
> > > > +#include <linux/qcom_scm.h>
> > > >   #include <linux/slab.h>
> > > >   #include <linux/spinlock.h>
> > > > @@ -177,6 +178,7 @@ struct arm_smmu_device {
> > > >           u32                             features;
> > > >   #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
> > > > +#define ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA (1 << 1)
> > > >           u32                             options;
> > > >           enum arm_smmu_arch_version      version;
> > > >           enum arm_smmu_implementation    model;
> > > > @@ -262,6 +264,7 @@ static bool using_legacy_binding, using_generic_binding;
> > > >   static struct arm_smmu_option_prop arm_smmu_options[] = {
> > > >           { ARM_SMMU_OPT_SECURE_CFG_ACCESS, "calxeda,smmu-secure-config-access" },
> > > > + { ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA, "qcom,smmu-500-fw-impl-safe-errata" },
> > > This should be added to the DT binding as well.
> >
> > Ah right. I missed that. Will add this and respin unless Robin and Will have
> > concerns with this change.
>
> My only concern really is whether it's safe for us to turn this off. It's
> clear that somebody went to a lot of effort to add this extra goodness to
> the IP, but your benchmarks suggest they never actually tried it out after
> they finished building it.
>
> Is there some downside I'm not seeing from disabling this stuff?

This wait-for-safe is a TLB invalidation enhancement to help display
and camera devices.
The SMMU hardware throttles the invalidations so that clients such as
display and camera can indicate when to start the invalidation.
So the SMMU essentially reduces the rate at which invalidations are
serviced from its queue. This also throttles the invalidations from
other masters too.

On sdm845, the software is expected to serialize the invalidation
command loading into SMMU invalidation FIFO using hardware locks
(downstream code [2]), and is also expected to throttle non-real time
clients while waiting for SAFE==1 (downstream code[2]). We don't do
any of these yet, and as per my understanding as this wait-for-safe is
enabled by the bootloader in a one time config, this logic reduces
performance of devices such as usb and ufs.

There's isn't any downside from disabling this logic until we have all
the pieces together from downstream in upstream kernels, and until we
have sdm845 devices that are running with full display/gfx stack
running. That's when we plan to revisit this and enable all the pieces
to get display and USB/UFS working with their optimum performance.

[1] https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/iommu/arm-smmu.c?h=msm-4.9#n5172
[2] https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/iommu/arm-smmu.c?h=msm-4.9#n5135

Thanks
Vivek

>
> We probably also need some co-ordination with Andy if we're going to
> merge this, since he maintains the firmware calling code.
>
> Will
> _______________________________________________
> iommu mailing list
> iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
