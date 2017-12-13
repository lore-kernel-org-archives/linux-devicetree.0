From: Maciej Purski <m.purski@samsung.com>
Subject: Re: [PATCH v3 4/4] regulator: core: Balance coupled regulators
 voltages
Date: Wed, 13 Dec 2017 10:25:00 +0100
Message-ID: <0bca0d20-1ca8-be4c-a60e-bbc0c640ae41@samsung.com>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
        <CGME20171207094754eucas1p1528c6c30135124430a5c703eb81de8d2@eucas1p1.samsung.com>
        <1512639975-22241-5-git-send-email-m.purski@samsung.com>
        <20171212115427.GG16323@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20171212115427.GG16323@sirena.org.uk>
Content-language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org



On 12/12/2017 12:54 PM, Mark Brown wrote:
> On Thu, Dec 07, 2017 at 10:46:15AM +0100, Maciej Purski wrote:
> 
>> @@ -2447,10 +2482,9 @@ static int _regulator_is_enabled(struct regulator_dev *rdev)
>>   	return rdev->desc->ops->is_enabled(rdev);
>>   }
>>   
>> -static int _regulator_list_voltage(struct regulator *regulator,
>> -				    unsigned selector, int lock)
>> +static int _regulator_list_voltage(struct regulator_dev *rdev,
>> +				   unsigned selector, int lock)
>>   {
> 
> Please split this refactoring of _list_voltage() into a separate patch
> for ease of review.  It can go in separately which will make this change
> smaller and easier to review.
> 
>> @@ -2928,6 +2961,35 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
>>   	if (ret < 0)
>>   		goto out2;
>>   
>> +	/*
>> +	 * If the regulator is not coupled just set voltage normally, else
>> +	 * return after changing consumer demands without changing voltage.
>> +	 * This will be handled outside the function
>> +	 * by regulator_balance_coupled()
>> +	 */
>> +	if (!rdev->coupling_desc) {
>> +		ret = regulator_set_voltage_rdev(regulator->rdev,
>> +						 min_uV, max_uV);
>> +		if (ret < 0)
>> +			goto out2;
>> +	}
> 
> As I think I said on the previous version I'm not enthusiastic about
> having two separate code paths for setting the voltage, it makes it much
> more likely that things will break especially given how rare coupled
> regulators are.  It would be cleaner to make uncoupled regulators just
> be a special case of coupled regulators, that way more of the code is
> shared.  To that end I'd adjust the code so that we always have a
> coupling descriptor and then handle the case where there's only one
> regulator described in there.
> 

Do you have any suggestion, how should I implement that path? The thing which
makes it more complicated is locking, because set_voltage_unlocked is done under 
one regulator's mutex and its suppliers, while balance procedure locks every 
coupled regulator without its suppliers. The suppliers for a single regulator 
are locked when setting a single regulator's voltage takes place.
