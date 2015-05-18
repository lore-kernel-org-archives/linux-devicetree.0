From: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/7] arm-cci: Sanitise CCI400 PMU driver specific code
Date: Mon, 18 May 2015 14:22:12 +0100
Message-ID: <9hhtwvavx4r.fsf@e105922-lin.cambridge.arm.com>
References: <1430826548-29960-1-git-send-email-suzuki.poulose@arm.com>
	<1430826548-29960-6-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430826548-29960-6-git-send-email-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
	(Suzuki K. Poulose's message of "Tue, 5 May 2015 12:49:06 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

"Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org> writes:

> From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
>
> Rename CCI400 specific defintions from CCI_xxx to CCI400_xxx.
>
> Introduce generic ARM_CCI_PMU to cover common code for handling
> the CCI PMU.
>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> Cc: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Suzuki K. Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>

Acked-by: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>

> ---
>  drivers/bus/Kconfig   |    5 ++
>  drivers/bus/arm-cci.c |  157 +++++++++++++++++++++++++++++--------------------
>  2 files changed, 97 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index a1d4af6..be66b7c 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -7,6 +7,10 @@ menu "Bus devices"
>  config ARM_CCI
>  	bool
>  
> +config ARM_CCI_PMU
> +	bool
> +	select ARM_CCI
> +
>  config ARM_CCI400_COMMON
>  	bool
>  	select ARM_CCI
> @@ -17,6 +21,7 @@ config ARM_CCI400_PMU
>  	depends on ARM || ARM64
>  	depends on HW_PERF_EVENTS
>  	select ARM_CCI400_COMMON
> +	select ARM_CCI_PMU
>  	help
>  	  Support for PMU events monitoring on the ARM CCI cache coherent
>  	  interconnect.
> diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
> index 4b9a8d3..2b43cea 100644
> --- a/drivers/bus/arm-cci.c
> +++ b/drivers/bus/arm-cci.c
> @@ -55,9 +55,9 @@ static const struct of_device_id arm_cci_matches[] = {
>  	{},
>  };
>  
> -#ifdef CONFIG_ARM_CCI400_PMU
> +#ifdef CONFIG_ARM_CCI_PMU
>  
> -#define DRIVER_NAME		"CCI-400"
> +#define DRIVER_NAME		"ARM-CCI"
>  #define DRIVER_NAME_PMU		DRIVER_NAME " PMU"
>  
>  #define CCI_PMCR		0x0100
> @@ -82,10 +82,6 @@ static const struct of_device_id arm_cci_matches[] = {
>  #define CCI_PMU_CNTR_MASK		((1ULL << 32) -1)
>  #define CCI_PMU_CNTR_LAST(cci_pmu)	(cci_pmu->num_cntrs - 1)
>  
> -#define CCI_PMU_EVENT_MASK		0xffUL
> -#define CCI_PMU_EVENT_SOURCE(event)	((event >> 5) & 0x7)
> -#define CCI_PMU_EVENT_CODE(event)	(event & 0x1f)
> -
>  #define CCI_PMU_MAX_HW_CNTRS(model) \
>  	((model)->num_hw_cntrs + (model)->fixed_hw_cntrs)
>  
> @@ -144,19 +140,29 @@ struct cci_pmu {
>  
>  #define to_cci_pmu(c)	(container_of(c, struct cci_pmu, pmu))
>  
> +enum cci_models {
> +#ifdef CONFIG_ARM_CCI400_PMU
> +	CCI400_R0,
> +	CCI400_R1,
> +#endif
> +	CCI_MODEL_MAX
> +};
> +
> +/* CCI400 PMU Specific definitions */
> +
> +#ifdef CONFIG_ARM_CCI400_PMU
> +
>  /* Port ids */
> -#define CCI_PORT_S0	0
> -#define CCI_PORT_S1	1
> -#define CCI_PORT_S2	2
> -#define CCI_PORT_S3	3
> -#define CCI_PORT_S4	4
> -#define CCI_PORT_M0	5
> -#define CCI_PORT_M1	6
> -#define CCI_PORT_M2	7
> -
> -#define CCI_REV_R0		0
> -#define CCI_REV_R1		1
> -#define CCI_REV_R1_PX		5
> +#define CCI400_PORT_S0		0
> +#define CCI400_PORT_S1		1
> +#define CCI400_PORT_S2		2
> +#define CCI400_PORT_S3		3
> +#define CCI400_PORT_S4		4
> +#define CCI400_PORT_M0		5
> +#define CCI400_PORT_M1		6
> +#define CCI400_PORT_M2		7
> +
> +#define CCI400_R1_PX		5
>  
>  /*
>   * Instead of an event id to monitor CCI cycles, a dedicated counter is
> @@ -164,11 +170,11 @@ struct cci_pmu {
>   * make use of this event in hardware.
>   */
>  enum cci400_perf_events {
> -	CCI_PMU_CYCLES = 0xff
> +	CCI400_PMU_CYCLES = 0xff
>  };
>  
> -#define CCI_PMU_CYCLE_CNTR_IDX		0
> -#define CCI_PMU_CNTR0_IDX		1
> +#define CCI400_PMU_CYCLE_CNTR_IDX	0
> +#define CCI400_PMU_CNTR0_IDX		1
>  
>  /*
>   * CCI PMU event id is an 8-bit value made of two parts - bits 7:5 for one of 8
> @@ -182,15 +188,26 @@ enum cci400_perf_events {
>   * the different revisions and are used to validate the event to be monitored.
>   */
>  
> -#define CCI_REV_R0_SLAVE_PORT_MIN_EV	0x00
> -#define CCI_REV_R0_SLAVE_PORT_MAX_EV	0x13
> -#define CCI_REV_R0_MASTER_PORT_MIN_EV	0x14
> -#define CCI_REV_R0_MASTER_PORT_MAX_EV	0x1a
> -
> -#define CCI_REV_R1_SLAVE_PORT_MIN_EV	0x00
> -#define CCI_REV_R1_SLAVE_PORT_MAX_EV	0x14
> -#define CCI_REV_R1_MASTER_PORT_MIN_EV	0x00
> -#define CCI_REV_R1_MASTER_PORT_MAX_EV	0x11
> +#define CCI400_PMU_EVENT_MASK		0xffUL
> +#define CCI400_PMU_EVENT_SOURCE_SHIFT	5
> +#define CCI400_PMU_EVENT_SOURCE_MASK	0x7
> +#define CCI400_PMU_EVENT_CODE_SHIFT	0
> +#define CCI400_PMU_EVENT_CODE_MASK	0x1f
> +#define CCI400_PMU_EVENT_SOURCE(event) \
> +	((event >> CCI400_PMU_EVENT_SOURCE_SHIFT) & \
> +			CCI400_PMU_EVENT_SOURCE_MASK)
> +#define CCI400_PMU_EVENT_CODE(event) \
> +	((event >> CCI400_PMU_EVENT_CODE_SHIFT) & CCI400_PMU_EVENT_CODE_MASK)
> +
> +#define CCI400_R0_SLAVE_PORT_MIN_EV	0x00
> +#define CCI400_R0_SLAVE_PORT_MAX_EV	0x13
> +#define CCI400_R0_MASTER_PORT_MIN_EV	0x14
> +#define CCI400_R0_MASTER_PORT_MAX_EV	0x1a
> +
> +#define CCI400_R1_SLAVE_PORT_MIN_EV	0x00
> +#define CCI400_R1_SLAVE_PORT_MAX_EV	0x14
> +#define CCI400_R1_MASTER_PORT_MIN_EV	0x00
> +#define CCI400_R1_MASTER_PORT_MAX_EV	0x11
>  
>  static int cci400_get_event_idx(struct cci_pmu *cci_pmu,
>  				struct cci_pmu_hw_events *hw,
> @@ -199,14 +216,14 @@ static int cci400_get_event_idx(struct cci_pmu *cci_pmu,
>  	int idx;
>  
>  	/* cycles event idx is fixed */
> -	if (cci_event == CCI_PMU_CYCLES) {
> -		if (test_and_set_bit(CCI_PMU_CYCLE_CNTR_IDX, hw->used_mask))
> +	if (cci_event == CCI400_PMU_CYCLES) {
> +		if (test_and_set_bit(CCI400_PMU_CYCLE_CNTR_IDX, hw->used_mask))
>  			return -EAGAIN;
>  
> -		return CCI_PMU_CYCLE_CNTR_IDX;
> +		return CCI400_PMU_CYCLE_CNTR_IDX;
>  	}
>  
> -	for (idx = CCI_PMU_CNTR0_IDX; idx <= CCI_PMU_CNTR_LAST(cci_pmu); ++idx)
> +	for (idx = CCI400_PMU_CNTR0_IDX; idx <= CCI_PMU_CNTR_LAST(cci_pmu); ++idx)
>  		if (!test_and_set_bit(idx, hw->used_mask))
>  			return idx;
>  
> @@ -216,28 +233,28 @@ static int cci400_get_event_idx(struct cci_pmu *cci_pmu,
>  
>  static int cci400_validate_hw_event(struct cci_pmu *cci_pmu, unsigned long hw_event)
>  {
> -	u8 ev_source = CCI_PMU_EVENT_SOURCE(hw_event);
> -	u8 ev_code = CCI_PMU_EVENT_CODE(hw_event);
> +	u8 ev_source = CCI400_PMU_EVENT_SOURCE(hw_event);
> +	u8 ev_code = CCI400_PMU_EVENT_CODE(hw_event);
>  	int if_type;
>  
> -	if (hw_event & ~CCI_PMU_EVENT_MASK)
> +	if (hw_event & ~CCI400_PMU_EVENT_MASK)
>  		return -ENOENT;
>  
> -	if (hw_event == CCI_PMU_CYCLES)
> +	if (hw_event == CCI400_PMU_CYCLES)
>  		return hw_event;
>  
>  	switch (ev_source) {
> -	case CCI_PORT_S0:
> -	case CCI_PORT_S1:
> -	case CCI_PORT_S2:
> -	case CCI_PORT_S3:
> -	case CCI_PORT_S4:
> +	case CCI400_PORT_S0:
> +	case CCI400_PORT_S1:
> +	case CCI400_PORT_S2:
> +	case CCI400_PORT_S3:
> +	case CCI400_PORT_S4:
>  		/* Slave Interface */
>  		if_type = CCI_IF_SLAVE;
>  		break;
> -	case CCI_PORT_M0:
> -	case CCI_PORT_M1:
> -	case CCI_PORT_M2:
> +	case CCI400_PORT_M0:
> +	case CCI400_PORT_M1:
> +	case CCI400_PORT_M2:
>  		/* Master Interface */
>  		if_type = CCI_IF_MASTER;
>  		break;
> @@ -252,24 +269,30 @@ static int cci400_validate_hw_event(struct cci_pmu *cci_pmu, unsigned long hw_ev
>  	return -ENOENT;
>  }
>  
> -static int probe_cci_revision(void)
> +static int probe_cci400_revision(void)
>  {
>  	int rev;
>  	rev = readl_relaxed(cci_ctrl_base + CCI_PID2) & CCI_PID2_REV_MASK;
>  	rev >>= CCI_PID2_REV_SHIFT;
>  
> -	if (rev < CCI_REV_R1_PX)
> -		return CCI_REV_R0;
> +	if (rev < CCI400_R1_PX)
> +		return CCI400_R0;
>  	else
> -		return CCI_REV_R1;
> +		return CCI400_R1;
>  }
>  
>  static const struct cci_pmu_model *probe_cci_model(struct platform_device *pdev)
>  {
>  	if (platform_has_secure_cci_access())
> -		return &cci_pmu_models[probe_cci_revision()];
> +		return &cci_pmu_models[probe_cci400_revision()];
> +	return NULL;
> +}
> +#else	/* !CONFIG_ARM_CCI400_PMU */
> +static inline struct cci_pmu_model *probe_cci_model(struct platform_device *pdev)
> +{
>  	return NULL;
>  }
> +#endif	/* CONFIG_ARM_CCI400_PMU */
>  
>  static int pmu_is_valid_counter(struct cci_pmu *cci_pmu, int idx)
>  {
> @@ -920,57 +943,61 @@ static int cci_pmu_cpu_notifier(struct notifier_block *self,
>  }
>  
>  static struct cci_pmu_model cci_pmu_models[] = {
> -	[CCI_REV_R0] = {
> +#ifdef CONFIG_ARM_CCI400_PMU
> +	[CCI400_R0] = {
>  		.name = "CCI_400",
>  		.fixed_hw_cntrs = 1,	/* Cycle counter */
>  		.num_hw_cntrs = 4,
>  		.cntr_size = SZ_4K,
>  		.event_ranges = {
>  			[CCI_IF_SLAVE] = {
> -				CCI_REV_R0_SLAVE_PORT_MIN_EV,
> -				CCI_REV_R0_SLAVE_PORT_MAX_EV,
> +				CCI400_R0_SLAVE_PORT_MIN_EV,
> +				CCI400_R0_SLAVE_PORT_MAX_EV,
>  			},
>  			[CCI_IF_MASTER] = {
> -				CCI_REV_R0_MASTER_PORT_MIN_EV,
> -				CCI_REV_R0_MASTER_PORT_MAX_EV,
> +				CCI400_R0_MASTER_PORT_MIN_EV,
> +				CCI400_R0_MASTER_PORT_MAX_EV,
>  			},
>  		},
>  		.validate_hw_event = cci400_validate_hw_event,
>  		.get_event_idx = cci400_get_event_idx,
>  	},
> -	[CCI_REV_R1] = {
> +	[CCI400_R1] = {
>  		.name = "CCI_400_r1",
>  		.fixed_hw_cntrs = 1,	/* Cycle counter */
>  		.num_hw_cntrs = 4,
>  		.cntr_size = SZ_4K,
>  		.event_ranges = {
>  			[CCI_IF_SLAVE] = {
> -				CCI_REV_R1_SLAVE_PORT_MIN_EV,
> -				CCI_REV_R1_SLAVE_PORT_MAX_EV,
> +				CCI400_R1_SLAVE_PORT_MIN_EV,
> +				CCI400_R1_SLAVE_PORT_MAX_EV,
>  			},
>  			[CCI_IF_MASTER] = {
> -				CCI_REV_R1_MASTER_PORT_MIN_EV,
> -				CCI_REV_R1_MASTER_PORT_MAX_EV,
> +				CCI400_R1_MASTER_PORT_MIN_EV,
> +				CCI400_R1_MASTER_PORT_MAX_EV,
>  			},
>  		},
>  		.validate_hw_event = cci400_validate_hw_event,
>  		.get_event_idx = cci400_get_event_idx,
>  	},
> +#endif
>  };
>  
>  static const struct of_device_id arm_cci_pmu_matches[] = {
> +#ifdef CONFIG_ARM_CCI400_PMU
>  	{
>  		.compatible = "arm,cci-400-pmu",
>  		.data	= NULL,
>  	},
>  	{
>  		.compatible = "arm,cci-400-pmu,r0",
> -		.data	= &cci_pmu_models[CCI_REV_R0],
> +		.data	= &cci_pmu_models[CCI400_R0],
>  	},
>  	{
>  		.compatible = "arm,cci-400-pmu,r1",
> -		.data	= &cci_pmu_models[CCI_REV_R1],
> +		.data	= &cci_pmu_models[CCI400_R1],
>  	},
> +#endif
>  	{},
>  };
>  
> @@ -1145,14 +1172,14 @@ static int __init cci_platform_init(void)
>  	return platform_driver_register(&cci_platform_driver);
>  }
>  
> -#else /* !CONFIG_ARM_CCI400_PMU */
> +#else /* !CONFIG_ARM_CCI_PMU */
>  
>  static int __init cci_platform_init(void)
>  {
>  	return 0;
>  }
>  
> -#endif /* CONFIG_ARM_CCI400_PMU */
> +#endif /* CONFIG_ARM_CCI_PMU */
>  
>  #ifdef CONFIG_ARM_CCI400_PORT_CTRL
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
