From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: Re: [PATCH 1/3] mfd: twl4030-power: Split from twl-core into a dedicated
 module
Date: Tue, 18 Jun 2013 10:53:50 +0200
Message-ID: <51C0201E.2040909@epfl.ch>
References: <1369921916-7435-1-git-send-email-florian.vaussard@epfl.ch> <1369921916-7435-2-git-send-email-florian.vaussard@epfl.ch> <20130617235644.GB7998@zurbaran>
Reply-To: florian.vaussard@epfl.ch
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130617235644.GB7998@zurbaran>
Sender: linux-doc-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Tero Kristo <t-kristo@ti.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

Thank you for the review.

On 06/18/2013 01:56 AM, Samuel Ortiz wrote:
> Hi Florian,
>
> On Thu, May 30, 2013 at 03:51:54PM +0200, Florian Vaussard wrote:
>> For now, the call to twl4030-power is hard-wired inside twl-core.
>> To ease the future transition to DT, make twl4030-power as a
>> separate module, like what is already done for twl4030-audio
>> and others.
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard@epfl.ch>
>> ---
>>   drivers/mfd/twl-core.c      |   12 ++++++---
>>   drivers/mfd/twl4030-power.c |   54 +++++++++++++++++++++++++++++++++++--------
>>   include/linux/i2c/twl.h     |    1 -
>>   3 files changed, 52 insertions(+), 15 deletions(-)
> Looks good, I only have one comment:
>
>> +static struct platform_driver twl4030_power_driver = {
>> +	.driver = {
>> +		.name	= "twl4030_power",
>> +		.owner	= THIS_MODULE,
>> +	},
>> +	.probe		= twl4030_power_probe,
>> +	.remove		= twl4030_power_remove,
>> +};
>> +
>> +static int __init twl4030_power_init(void)
>> +{
>> +	return platform_driver_register(&twl4030_power_driver);
>>   }
>> +subsys_initcall(twl4030_power_init);
>> +
>> +static void __exit twl4030_power_exit(void)
>> +{
>> +	platform_driver_unregister(&twl4030_power_driver);
>> +}
>> +module_exit(twl4030_power_exit);
> Please use module_platform_driver() here.
>

Sure!

Regards,

Florian
