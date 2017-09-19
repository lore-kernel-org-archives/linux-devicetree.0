From: Maciej Purski <m.purski@samsung.com>
Subject: Re: [PATCH 1/2] regulator: core: Add coupled regulators mechanism
Date: Tue, 19 Sep 2017 16:35:54 +0200
Message-ID: <8ac4fa17-43ed-7a4d-d086-6ad81d97900e@samsung.com>
References: <1505723992-11772-1-git-send-email-m.purski@samsung.com>
        <CGME20170918084022eucas1p1398f18c5c90535ce484e3952fae80882@eucas1p1.samsung.com>
        <1505723992-11772-2-git-send-email-m.purski@samsung.com>
        <20170919130944.ldoskrm54tx2oemd@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170919130944.ldoskrm54tx2oemd@sirena.co.uk>
Content-language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org

On 09/19/2017 03:09 PM, Mark Brown wrote:

> On Mon, Sep 18, 2017 at 10:39:51AM +0200, Maciej Purski wrote:
>> On Odroid XU3/4 and other Exynos5422 based boards there is a case, that
>> different devices on the board are supplied by different regulators
>> with non-fixed voltages. If one of these devices temporarily requires
>> higher voltage, there might occur a situation that the spread between
>> two devices' voltages is so high, that there is a risk of changing
>> 'high' and 'low' states on the interconnection between devices powered
>> by those two regulators.
>>
>> Keeping spread between those voltages below defined max_spread should
>> be handled by the framework. Information required to do so is obtained
>> from the device tree. On each voltage change the core should find the
>> best voltages which suit all consumers' demands and max_spread.
>> Then set them for a coupled regulator also.
> This leads me none the wiser as to how this will be implemented which
> makes this rather hard to review, especially since this appears to have
> a lot of random refactoring mixed in with it.

Sorry. I'll document it better in the next version.

>
>> +static int regulator_set_voltage_safe(struct regulator_dev *rdev,
>> +				      int min_uV, int max_uV);
> Why would we want a way to set voltages that isn't safe?

This function is extracted from original regulator_set_voltage_unlocked(). It contains
code responsible for calling do_set_voltage on the given regulator and its ancestors (if needed).
This function is called both from regulator_set_voltage_unlocked(), from where it was extracted
and from my new function regulator_set_coupled_voltage(). I added this in order to avoid
code duplication. I agree that the name might not be adequate. What name would you find more suitable?

>
>> @@ -2181,6 +2183,8 @@ static int _regulator_enable(struct regulator_dev *rdev)
>>   		/* Fallthrough on positive return values - already enabled */
>>   	}
>>   
>> +	if (rdev->coupled_desc)
>> +		rdev->coupled_desc->enable_count++;
>>   	rdev->use_count++;
>>   
>>   	return 0;
> There's no locking here, and we appear to take no action when these
> counts change - do we need to bother with this at all?

Variable enable_count is used for checking if both regulators are enabled and there's a need for
using the coupling mechanism. It is checked in regulator_set_coupled_voltage_unlocked(), where the
mutex is already locked. I think that locking it here would be useful. Thanks.

>
>> +	/* check if changing voltage won't interfere with other
>> +	 * consumers' demands
>> +	 */
>>   	ret = regulator_check_consumers(rdev, &min_uV, &max_uV);
>>   	if (ret < 0)
>>   		goto out2;
> These extra comments that are being added are pretty much all readouts
> of the name of the function that's being called (and many of them are
> misformatted)...
>
>> +static int regulator_set_voltage_safe(struct regulator_dev *rdev, int min_uV,
>> +					   int max_uV)
>> +{
> ...which is a bit ironic given that this isn't documented at all :/

Everything will be documented better in the next version.

>
>> +static int regulator_set_coupled_voltage(struct coupled_reg_desc *c_desc)
>> +{
>> +	struct regulator_dev **c_rdevs = c_desc->coupled_rdevs;
>> +	int max_spread = c_desc->max_spread;
>> +	int best_volt[2] = { };
>> +	int actual_volt[2];
>> +	int min_volt, max_volt;
>> +	int ret = 0, i, max;
>> +	int ready = 0;
>> +
>> +	/* Get voltages desired by all consumers of the coupled regulator */
>> +	for (i = 0; i < 2; i++) {
> It appears we can't couple more than two regulators?

We can couple just two regulators. We have never found any case for coupling
more than two regulators. Limiting the mechanism to just two regulators simplifies
algorithm a little bit. Would you prefer it working for more than two
regulators also even if there isn't any use case?

>
>> +	max_volt = max(best_volt[0], best_volt[1]);
>> +	min_volt = min(best_volt[0], best_volt[1]);
> So the maximum and minimum are the *least* constrained?
>
>> +			max_possible = actual_volt[(i + 1) % 2] + max_spread;
>> +			min_possible = actual_volt[(i + 1) % 2] - max_spread;
> I'm lost, this magic array indexing is just illegible.
