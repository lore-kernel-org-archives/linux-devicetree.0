From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC 4/4] irqchip, gicv3-its: Add HiSilicon acpi based erratum
 data.
Date: Tue, 24 Jan 2017 14:00:20 +0000
Message-ID: <20170124140019.GC7572@leverpostej>
References: <588626A5.7090603@huawei.com>
 <58875C45.50108@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <58875C45.50108@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: marc.zyngier@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, john.garry@huawei.com, guohanjun@huawei.com
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 01:53:09PM +0000, Shameerali Kolothum Thodi wrote:
> This enables the acpi based workaround for HiSilicon erratum 161010801.
> 
> Signed-off-by: shameer <shameerali.kolothum.thodi@huawei.com>
> ---
>  drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 9fa12b7..d0f5099 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -1868,7 +1868,10 @@ struct acpi_madt_its_quirks {
> 
>  /*Upadate as per the board OEM ID and TABLE ID*/
>  struct acpi_madt_its_quirks acpi_its_quirks[] __initdata = {
> -
> +#ifdef CONFIG_HISILICON_ERRATUM_161010801
> +	{"HISI  ", "HIP06   ", 0, 0, "hisilicon,erratum-161010801"},
> +	{"HISI  ", "HIP07   ", 0, 0, "hisilicon,erratum-161010801"},
> +#endif
>  };

Similarly to the arch timer patch, NAK to bodging ACPI match data to DT
property names.

Thanks,
Mark.
