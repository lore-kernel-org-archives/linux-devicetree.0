From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH 1/2] mfd: pm8x41: add support for Qualcomm 8x41 PMICs
Date: Fri, 25 Apr 2014 18:38:39 -0700
Message-ID: <535B0E1F.8000405@codeaurora.org>
References: <1398213110-28135-1-git-send-email-courtney.cavin@sonymobile.com> <20140423214626.GA3215@joshc.qualcomm.com> <20140423233621.GM17066@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140423233621.GM17066@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Courtney Cavin <courtney.cavin@sonymobile.com>
Cc: Josh Cartwright <joshc@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 04/23/2014 04:36 PM, Courtney Cavin wrote:
> On Wed, Apr 23, 2014 at 11:46:26PM +0200, Josh Cartwright wrote:
>> On Tue, Apr 22, 2014 at 05:31:49PM -0700, Courtney Cavin wrote:
[..]
>>> +++ b/drivers/mfd/pm8x41.c
>>> @@ -0,0 +1,63 @@
>>> +/* Copyright (c) 2013, The Linux Foundation. All rights reserved.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 and
>>> + * only version 2 as published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/spmi.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/of_platform.h>
>>> +
>>> +static const struct regmap_config pm8x41_regmap_config = {
>>> +	.reg_bits	= 16,
>>> +	.val_bits	= 8,
>>> +	.max_register	= 0xFFFF,
>>> +};
>>
>> This reminds me.  David Collins (CC'd) noticed that there are usecases
>> where peripheral drivers will need to be accessing registers from atomic
>> context, so we should probably be setting .fast_io in the SPMI
>> regmap_bus structures, but we can tackle that when we get there.
> 
> Hrm.  Please comment on this David.  I would like to see a solid
> use-case before even considering that.

Several drivers in the downstream msm-3.10 tree [1] are currently making
SPMI read and write calls from atomic context.  For the most part this
corresponds to non-threaded interrupt handlers.  Some examples of that are
qpnp-charger [2] and qpnp-adc-tm [3].

Another case in which atomic SPMI read and write calls are needed is when
very tight timing constraints must be ensured between successive SPMI
transactions.  An example of this can be found in the qpnp-bsi MIPI-BIF
smart battery driver [4].  It disables interrupts when performing BIF
burst reads because the data register must be read within 10's of
microseconds after the status register indicates that data is ready.  If
the data read is too slow, then next word in the burst read overrides the
current one.

- David

[1]: git://codeaurora.org/quic/la/kernel/msm-3.10#msm-3.10

[2]:
https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/power/qpnp-charger.c?h=msm-3.10&id=77ea4f2d70056169a80519fc9c7dd7156469ef11#n4173

[3]:
https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/thermal/qpnp-adc-tm.c?h=msm-3.10&id=77ea4f2d70056169a80519fc9c7dd7156469ef11#n2076

[4]:
https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/bif/qpnp-bsi.c?h=msm-3.10&id=77ea4f2d70056169a80519fc9c7dd7156469ef11#n943
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
