From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Thu, 2 May 2019 13:30:48 +0200
Message-ID: <dd15d784-f2a1-78c6-3543-69bbcc1143c4@linaro.org>
References: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
 <20190502023316.GS14916@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502023316.GS14916@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/2/19 04:33, Mark Brown wrote:
> On Mon, Apr 29, 2019 at 02:31:55PM +0200, Jorge Ramirez wrote:
>> On 4/27/19 20:21, Mark Brown wrote:
> 
>>> Since the point of this change is AFAICT that this regulator only has a
>>> single linear range it seems like it should just be able to use the
>>> existing generic functions shouldn't it?  
> 
>> yes that would have been ideal but it does not seem to be the case for
>> this hardware.
> 
>> The register that stores the voltage range for all other SPMI regulators
>> (SPMI_COMMON_REG_VOLTAGE_RANGE 0x40) is used by something else in the
>> HFS430: SPMI_HFS430_REG_VOLTAGE_LB 0x40 stores the voltage level in two
>> bytes 0x40 and 0x41;
> 
>> This overlap really what is creating the pain: HFS430 cant use 0x40 to
>> store the range (even if it is only one)
> 
>> so yeah, most of the changes in the patch are working around this fact.
> 
> I'm not sure I follow here, sorry - I can see that the driver needs a
> custom get/set selector operation but shouldn't it be able to use the
> standard list and map operations for linear ranges?

I agree it should, but unfortunately that is not the case; when I first
posted the patch I was concerned that for a regulator to be supported by
this driver it should obey to the driver's internals (ie: comply with
all of the spmi_common_regulator_registers definitions).

However, since there was just a single range to support, the
modifications I had to do to support this SPMI regulator were minimal -
hence why I opted for the changes under discussion instead of writing a
new driver (which IMO it is an overkill).

what do you think?

> 
>>
>> enum spmi_common_regulator_registers {
>> 	SPMI_COMMON_REG_DIG_MAJOR_REV		= 0x01,
>> 	SPMI_COMMON_REG_TYPE			= 0x04,
>> 	SPMI_COMMON_REG_SUBTYPE			= 0x05,
>> 	SPMI_COMMON_REG_VOLTAGE_RANGE		= 0x40, ******
>> 	SPMI_COMMON_REG_VOLTAGE_SET		= 0x41,
>> 	SPMI_COMMON_REG_MODE			= 0x45,
>> 	SPMI_COMMON_REG_ENABLE			= 0x46,
>> 	SPMI_COMMON_REG_PULL_DOWN		= 0x48,
>> 	SPMI_COMMON_REG_SOFT_START		= 0x4c,
>> 	SPMI_COMMON_REG_STEP_CTRL		= 0x61,
>> };
>>
>> enum spmi_hfs430_registers {
>> 	SPMI_HFS430_REG_VOLTAGE_LB		= 0x40, *******
>> 	SPMI_HFS430_REG_VOLTAGE_VALID_LB	= 0x42,

ah, this definition I can remove and use the common one above. I'll do that.
>> 	SPMI_HFS430_REG_MODE			= 0x45,


>> };
>>
>> It just needs it's own
>>> set/get_voltage_sel() operations.  As far as I can see the main thing
>>> the driver is doing with the custom stuff is handling the fact that
>>> there's multiple ranges but that's not an issue for this regulator.
>>> It's possible I'm missing something there but that was the main thing
>>> (and we do have some generic support for multiple linear ranges in the
>>> helper code already, can't remember why this driver isn't using that -
>>> the ranges overlap IIRC?).
>>>
>>> TBH looking at the uses of find_range() I'm not sure they're 100%
>>> sensible as they are - the existing _time_sel() is assuming we only need
>>> to work out the ramp time between voltages in the same range which is
>>> going to have trouble.
>>>
>>
