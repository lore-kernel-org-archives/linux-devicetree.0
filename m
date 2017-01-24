From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC 1/4] irqchip, gicv3-its: Add device tree binding for
 hisilicon 161010801 erratum
Date: Tue, 24 Jan 2017 13:52:24 +0000
Message-ID: <20170124135224.GB7572@leverpostej>
References: <588625E3.9040703@huawei.com>
 <588759E0.1010804@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <588759E0.1010804@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: marc.zyngier@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, linuxarm@huawei.com, devicetree@vger.kernel.org, john.garry@huawei.com, guohanjun@huawei.com
List-Id: devicetree@vger.kernel.org

Hi,

I see this wasn't Cc'd to LAKML, unlike the cover letter, and patch 3
(which isn't threaded against the cover letter).

Please use a consistent Cc list, with patches in-reply to the cover
letter.

On Tue, Jan 24, 2017 at 01:42:56PM +0000, Shameerali Kolothum Thodi wrote:
> This erratum describes the limitation of certain HiSilicon platforms
> to support the SMMU mappings for MSI transactions and on those platforms
> the MSI transactions has to be bypassed by SMMU. The IIDR register of the
> GICv3 ITS on these platforms are not properly populated to differentiate
> the hardware, hence describe it in device tree.
> 
> Signed-off-by: shameer <shameerali.kolothum.thodi@huawei.com>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> index 4c29cda..84af301 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> @@ -75,6 +75,12 @@ These nodes must have the following properties:
>  - reg: Specifies the base physical address and size of the ITS
>    registers.
> 
> +Optional
> +- hisilicon,erratum-161010801 : A boolean property. Indicates the presence of
> +  erratum 161010801, which says that these platforms doesn't support  SMMU
> +  mapping for MSI transactions and those transactions has to be bypassed
> +  by SMMU.

What exactly is meant by "doesn't support SMMU mapping" here? What
precisely is the problem in HW?

Thanks,
Mark.
