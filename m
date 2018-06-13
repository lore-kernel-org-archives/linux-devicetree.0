From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v3 6/7] soc: qcom: Add RPMh Power domain driver
Date: Wed, 13 Jun 2018 09:00:11 +0530
Message-ID: <726e5536-3be2-4217-bacd-437e7ec7864a@codeaurora.org>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
 <20180612044052.4402-7-rnayak@codeaurora.org>
 <20180612194226.GI88063@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612194226.GI88063@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 06/13/2018 01:12 AM, Matthias Kaehlcke wrote:
> Hi,
> 
> On Tue, Jun 12, 2018 at 10:10:51AM +0530, Rajendra Nayak wrote:
>> The RPMh Power domain driver aggregates the corner votes from various
>> consumers for the ARC resources and communicates it to RPMh.
>>
>> We also add data for all power domains on sdm845 SoC as part of the patch.
>> The driver can be extended to support other SoCs which support RPMh
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>  drivers/soc/qcom/Kconfig                |   9 +
>>  drivers/soc/qcom/Makefile               |   1 +
>>  drivers/soc/qcom/rpmhpd.c               | 427 ++++++++++++++++++++++++
>>  include/dt-bindings/power/qcom-rpmhpd.h |  31 ++
>>  4 files changed, 468 insertions(+)
>>  create mode 100644 drivers/soc/qcom/rpmhpd.c
>>  create mode 100644 include/dt-bindings/power/qcom-rpmhpd.h
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 5c54931a7b99..7cb7eba2b997 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -74,6 +74,15 @@ config QCOM_RMTFS_MEM
>>  
>>  	  Say y here if you intend to boot the modem remoteproc.
>>  
>> +config QCOM_RPMHPD
>> +	tristate "Qualcomm RPMh Power domain driver"
>> +	depends on QCOM_RPMH && QCOM_COMMAND_DB
>> +	help
>> +	  QCOM RPMh Power domain driver to support power-domains with
>> +	  performance states. The driver communicates a performance state
>> +	  value to RPMh which then translates it into corresponding voltage
>> +	  for the voltage rail.
>> +
>>  config QCOM_RPMPD
>>  	tristate "Qualcomm RPM Power domain driver"
>>  	depends on MFD_QCOM_RPM && QCOM_SMD_RPM
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index 9550c170de93..499513f63bef 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -16,3 +16,4 @@ obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>>  obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
>>  obj-$(CONFIG_QCOM_APR) += apr.o
>>  obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
>> +obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
>> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
>> new file mode 100644
>> index 000000000000..7083ec1590ff
>> --- /dev/null
>> +++ b/drivers/soc/qcom/rpmhpd.c
>> @@ -0,0 +1,427 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/* Copyright (c) 2018, The Linux Foundation. All rights reserved.*/
>> +
>> +#include <linux/err.h>
>> +#include <linux/export.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/slab.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_opp.h>
>> +#include <soc/qcom/cmd-db.h>
>> +#include <soc/qcom/rpmh.h>
>> +#include <dt-bindings/power/qcom-rpmhpd.h>
>> +
>> +#define domain_to_rpmhpd(domain) container_of(domain, struct rpmhpd, pd)
>> +
>> +#define DEFINE_RPMHPD_AO(_platform, _name, _active)			\
>> +	static struct rpmhpd _platform##_##_active;			\
>> +	static struct rpmhpd _platform##_##_name = {			\
>> +		.pd = {	.name = #_name,	},				\
>> +		.peer = &_platform##_##_active,				\
>> +		.res_name = #_name".lvl",				\
>> +		.valid_state_mask = (BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>> +					BIT(RPMH_WAKE_ONLY_STATE) |	\
>> +					BIT(RPMH_SLEEP_STATE)),		\
>> +	};								\
>> +	static struct rpmhpd _platform##_##_active = {			\
>> +		.pd = { .name = #_active, },				\
>> +		.peer = &_platform##_##_name,				\
>> +		.active_only = true,					\
>> +		.res_name = #_name".lvl",				\
>> +		.valid_state_mask = (BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>> +					BIT(RPMH_WAKE_ONLY_STATE) |	\
>> +					BIT(RPMH_SLEEP_STATE)),		\
>> +	}
>> +
>> +#define DEFINE_RPMHPD(_platform, _name)					\
>> +	static struct rpmhpd _platform##_##_name = {			\
>> +		.pd = { .name = #_name, },				\
>> +		.res_name = #_name".lvl",				\
>> +		.valid_state_mask = BIT(RPMH_ACTIVE_ONLY_STATE),	\
>> +	}
> 
> Perhaps describe briefly the concept of an AO (active-only) and a peer
> domain. It is not necessarily evident why an AO domain would have
> WAKE_ONLY and SLEEP_ONLY as valid states, while the non-AO domain has
> ACTIVE_ONLY as it's only state.

Sure, I'll add in more comments to describe this.

> 
>> +/*
>> + * This function is used to aggregate the votes across the active only
>> + * resources and its peers. The aggregated votes are send to RPMh as
> 
> s/send/sent/
> 
>> + * ACTIVE_ONLY votes (which take effect immediately), as WAKE_ONLY votes
>> + * (applied by RPMh on system wakeup) and as SLEEP votes (applied by RPMh
>> + * on system sleep).
>> + * We send ACTIVE_ONLY votes for resources without any peers. For others,
>> + * which have an active only peer, all 3 Votes are sent.
> 
> s/Votes/votes/
> 
>> +static int rpmhpd_probe(struct platform_device *pdev)
>> +{
>> +	int i, ret;
>> +	size_t num;
> 
> nit: naming this num_pds would slightly improve readability (e.g. make
> it evident that the for loop iterates over the PDs).

sure, will change

> 
>> +	struct genpd_onecell_data *data;
>> +	struct rpmhpd **rpmhpds;
>> +	const struct rpmhpd_desc *desc;
>> +
>> +	desc = of_device_get_match_data(&pdev->dev);
>> +	if (!desc)
>> +		return -EINVAL;
>> +
>> +	rpmhpds = desc->rpmhpds;
>> +	num = desc->num_pds;
>> +
>> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->domains = devm_kcalloc(&pdev->dev, num, sizeof(*data->domains),
>> +				     GFP_KERNEL);
> 
> Check for NULL?

yes, indeed, thanks for the review. I will fix all these up with a v4.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
