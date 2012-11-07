From: Qing Xu <qingx@marvell.com>
Subject: Re: [PATCH 5/7] mfd: max8925: support dt for regulator
Date: Wed, 07 Nov 2012 16:53:25 +0800
Message-ID: <509A2185.4030706@marvell.com>
References: <1352187892-9940-1-git-send-email-qingx@marvell.com> <20121106090137.GH5044@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121106090137.GH5044@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "lrg@ti.com" <lrg@ti.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, Chao Xie <cxie4@marvell.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 11/06/2012 05:01 PM, Mark Brown wrote:
> On Tue, Nov 06, 2012 at 03:44:52PM +0800, Qing Xu wrote:
>> From: Qing Xu <qingx@marvell.com>
>>
>> Signed-off-by: Qing Xu <qingx@marvell.com>
>> ---
>>   drivers/regulator/max8925-regulator.c |   35 ++++++++++++++++++++++++++++++++-
>>   1 files changed, 34 insertions(+), 1 deletions(-)
> There is no binding document here, documentation is required for all new
> bindings.
>
>> +	nproot = of_find_node_by_name(nproot, "regulators");
>> +	if (!nproot) {
>> +		dev_err(&pdev->dev, "failed to find regulators node\n");
>> +		return -ENODEV;
>> +	}
>> +	for_each_child_of_node(nproot, np) {
>> +		if (!of_node_cmp(np->name, info->desc.name)) {
>> +			config->init_data =
>> +				of_get_regulator_init_data(&pdev->dev, np);
>> +			config->of_node = np;
>> +			break;
>> +		}
>> +	}
> You appear to be open coding something like the standard helpers in
> of_regulator.h, you should use those helpers.
Mark, thanks for your so quick response! I updated the patch in v2, 
please help me review it again.
