From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Thu, 25 Apr 2019 21:44:00 +0200
Message-ID: <022b3c6a-e356-3c5a-3c46-c6edcf4f8cd5@linaro.org>
References: <1548675904-18324-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548675904-18324-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190204090301.GC23441@sirena.org.uk>
 <95276ca0-6896-a595-867a-184a518fa31f@linaro.org>
 <20190425183736.GF23183@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425183736.GF23183@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/25/19 20:37, Mark Brown wrote:
> On Fri, Apr 19, 2019 at 07:29:48PM +0200, Jorge Ramirez wrote:
>> On 2/4/19 10:03, Mark Brown wrote:
> 
>>>> +	/* we know we only have one range for this type */
>>>> +	if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430)
>>>> +		return range;
> 
>>> Rather than have special casing for the logical type in here it seems
>>> better to just provide a specific op for this logical type, you could
>>> always make _find_range() call into that one if you really want code
>>> reuse here.  You already have separate ops for this regulator type
>>> anyway.
> 
>> sorry I dont quite understand your point.
> 
> If you need to skip the majority of the contents of the function for
> some regulators just define a separate function for those regulators and
> give them different ops structures rather than using the same ops
> structure and handling it in the functions.

sure this is 101 as a general rule: but this is not applicable to the
situation that I described in my original note, so I dont think you read
my points.

> 
>> But also I am not sure I see the benefits with respect to the proposed
>> change...
> 
> The benefit is that the selection of which operations to use is done in
> only one place (the selection of the ops structure) rather than in
> multiple places (the selection of the ops structure and the contents of
> the operations).

all right, how do you propose that we handle
spmi_regulator_select_voltage_same_range() then?

the way I see it, if I follow your suggestion and since we are not
allowed to extend spmi_regulator_find_range(), the only options are:

1) duplicate verbatim this whole function
(spmi_regulator_select_voltage_same_range) with a minor change (this
amount of code duplication in the kernel seems rather unnecessary to me)

2) modify the struct spmi_regulator definition with a new operation that
calls a different implementation of find range (seems a massive overkill)

because both seem wrong to me, can you confirm that you are ok with one
of those two options? or if not give an alternative?

But I still would like to understand why you think it is wrong extending
spmi_regulator_find_range() to support HFS430.

Are you saying that this function should not exist for this regulator?

Sure the HFS430 doesnt use the register SPMI_COMMON_REG_VOLTAGE_RANGE
and therefore doesnt need to use it to find its range....but that doesnt
mean that the semantics of spmi_regulator_find_range are invalid.

The way I understand your concern, you seem to be assuming that
spmi_regulator_find_range means something like
spmi_regulator_find_range_from_reg_voltage but that is not the case or
if it is maybe it should be renamed.....
