From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] perf: hisi: fix uncore PMU index ID
Date: Mon, 21 May 2018 18:05:55 +0100
Message-ID: <20180521170554.GE21034@arm.com>
References: <1526901317-52248-1-git-send-email-zhangshaokun@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1526901317-52248-1-git-send-email-zhangshaokun@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Huiqiang Wang <wanghuiqiang@huawei.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Shaokun,

[+DT list]

On Mon, May 21, 2018 at 07:15:17PM +0800, Shaokun Zhang wrote:
> According to ACPI SPEC about _UID (Unique ID), The _UID must be unique
> across all devices with either a common _HID or _CID. For HiSilion
> uncore PMU, SCCL_ID and INDEX_ID are used to identify the uncore PMU
> for the same _HID. Therefore, _UID is not equal to INDEX_ID in
> multi-sccl scene for the same uncore PMU device.
> 
> CCL_ID can be used as the INDEX_ID for the L3C PMU and IDX-ID is added
> in DSDT table for the HHA PMU.
> 
> Fixes: 2940bc4("perf: hisi: Add support for HiSilicon SoC L3C PMU driver")
> Fixes: 2bab3cf("perf: hisi: Add support for HiSilicon SoC HHA PMU driver")
> Reported-by: Huiqiang Wang <wanghuiqiang@huawei.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Huiqiang Wang <wanghuiqiang@huawei.com>
> ---
>  drivers/perf/hisilicon/hisi_uncore_hha_pmu.c | 18 ++++++++----------
>  drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 11 ++---------
>  2 files changed, 10 insertions(+), 19 deletions(-)

Whilst I'd normally just accept PMU driver submissions for vendor PMUs,
this part rang my alarm bells:

> diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
> index 443906e..dcd8e77 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
> @@ -238,19 +238,10 @@ MODULE_DEVICE_TABLE(acpi, hisi_hha_pmu_acpi_match);
>  static int hisi_hha_pmu_init_data(struct platform_device *pdev,
>  				  struct hisi_pmu *hha_pmu)
>  {
> -	unsigned long long id;
>  	struct resource *res;
> -	acpi_status status;
> -
> -	status = acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev),
> -				       "_UID", NULL, &id);
> -	if (ACPI_FAILURE(status))
> -		return -EINVAL;
> -
> -	hha_pmu->index_id = id;
>  
>  	/*
> -	 * Use SCCL_ID and UID to identify the HHA PMU, while
> +	 * Use SCCL_ID and HHA index ID to identify the HHA PMU, while
>  	 * SCCL_ID is in MPIDR[aff2].
>  	 */
>  	if (device_property_read_u32(&pdev->dev, "hisilicon,scl-id",
> @@ -258,6 +249,13 @@ static int hisi_hha_pmu_init_data(struct platform_device *pdev,
>  		dev_err(&pdev->dev, "Can not read hha sccl-id!\n");
>  		return -EINVAL;
>  	}
> +
> +	if (device_property_read_u32(&pdev->dev, "hisilicon,idx-id",
> +				     &hha_pmu->index_id)) {
> +		dev_err(&pdev->dev, "Can not read hha index-id!\n");
> +		return -EINVAL;
> +	}

Is this a new DT property? If so, please can you update the binding
documentation and get an Ack from a DT maintainer? It's not clear to me
what a "hisilicon,idx-id" is, nor how I would generate on from firmware.

Thanks,

Will
