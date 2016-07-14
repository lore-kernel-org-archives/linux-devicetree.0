From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v9 3/4] perf: xgene: Add APM X-Gene SoC Performance
 Monitoring Unit driver
Date: Thu, 14 Jul 2016 10:47:08 -0700
Message-ID: <1468518428.8745.43.camel@perches.com>
References: <1468517266-1642-1-git-send-email-ttnguyen@apm.com>
	 <1468517266-1642-4-git-send-email-ttnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468517266-1642-4-git-send-email-ttnguyen@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tai Nguyen <ttnguyen@apm.com>, mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com, paul.gortmaker@windriver.com
Cc: dhdang@apm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Thu, 2016-07-14 at 10:27 -0700, Tai Nguyen wrote:
> This patch adds a driver for the SoC-wide (AKA uncore) PMU hardware
> found in APM X-Gene SoCs.

trivia:

> diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
[]
> +struct xgene_pmu_dev_ctx {
> +	char *name;
> +	struct list_head next;
> +	struct xgene_pmu_dev *pmu_dev;
> +	struct hw_pmu_info inf;
> +};

Probably better to use something like
	char	name[20];
as the kasprintf can fail and this doesn't
seem to be freed anywhere.
> +static char *xgene_pmu_dev_name(u32 type, int id)
> +{
> +	switch (type) {
> +	case PMU_TYPE_L3C:
> +		return kasprintf(GFP_KERNEL, "l3c%d", id);
> +	case PMU_TYPE_IOB:
> +		return kasprintf(GFP_KERNEL, "iob%d", id);
> +	case PMU_TYPE_MCB:
> +		return kasprintf(GFP_KERNEL, "mcb%d", id);
> +	case PMU_TYPE_MC:
> +		return kasprintf(GFP_KERNEL, "mc%d", id);
> +	default:
> +		return kasprintf(GFP_KERNEL, "unknown");
> +	}
> +}

[]
=09
> +static struct
> +xgene_pmu_dev_ctx *acpi_get_pmu_hw_inf(struct xgene_pmu *xgene_pmu,
> +				=A0=A0=A0=A0=A0=A0=A0struct acpi_device *adev, u32 type)
> +{
[]
> +	ctx->name =3D xgene_pmu_dev_name(type, enable_bit);
>=20
