From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Mon, 29 Apr 2019 14:31:55 +0200
Message-ID: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
References: <1548675904-18324-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548675904-18324-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190204090301.GC23441@sirena.org.uk>
 <95276ca0-6896-a595-867a-184a518fa31f@linaro.org>
 <20190425183736.GF23183@sirena.org.uk>
 <022b3c6a-e356-3c5a-3c46-c6edcf4f8cd5@linaro.org>
 <20190427182113.GL14916@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190427182113.GL14916@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/27/19 20:21, Mark Brown wrote:
> On Thu, Apr 25, 2019 at 09:44:00PM +0200, Jorge Ramirez wrote:
> 
>> the way I see it, if I follow your suggestion and since we are not
>> allowed to extend spmi_regulator_find_range(), the only options are:
> 
>> 1) duplicate verbatim this whole function
>> (spmi_regulator_select_voltage_same_range) with a minor change (this
>> amount of code duplication in the kernel seems rather unnecessary to me)
> 
>> 2) modify the struct spmi_regulator definition with a new operation that
>> calls a different implementation of find range (seems a massive overkill)
> 
> Since the point of this change is AFAICT that this regulator only has a
> single linear range it seems like it should just be able to use the
> existing generic functions shouldn't it?  

yes that would have been ideal but it does not seem to be the case for
this hardware.

The register that stores the voltage range for all other SPMI regulators
(SPMI_COMMON_REG_VOLTAGE_RANGE 0x40) is used by something else in the
HFS430: SPMI_HFS430_REG_VOLTAGE_LB 0x40 stores the voltage level in two
bytes 0x40 and 0x41;

This overlap really what is creating the pain: HFS430 cant use 0x40 to
store the range (even if it is only one)

so yeah, most of the changes in the patch are working around this fact.

enum spmi_common_regulator_registers {
	SPMI_COMMON_REG_DIG_MAJOR_REV		= 0x01,
	SPMI_COMMON_REG_TYPE			= 0x04,
	SPMI_COMMON_REG_SUBTYPE			= 0x05,
	SPMI_COMMON_REG_VOLTAGE_RANGE		= 0x40, ******
	SPMI_COMMON_REG_VOLTAGE_SET		= 0x41,
	SPMI_COMMON_REG_MODE			= 0x45,
	SPMI_COMMON_REG_ENABLE			= 0x46,
	SPMI_COMMON_REG_PULL_DOWN		= 0x48,
	SPMI_COMMON_REG_SOFT_START		= 0x4c,
	SPMI_COMMON_REG_STEP_CTRL		= 0x61,
};

enum spmi_hfs430_registers {
	SPMI_HFS430_REG_VOLTAGE_LB		= 0x40, *******
	SPMI_HFS430_REG_VOLTAGE_VALID_LB	= 0x42,
	SPMI_HFS430_REG_MODE			= 0x45,
};

It just needs it's own
> set/get_voltage_sel() operations.  As far as I can see the main thing
> the driver is doing with the custom stuff is handling the fact that
> there's multiple ranges but that's not an issue for this regulator.
> It's possible I'm missing something there but that was the main thing
> (and we do have some generic support for multiple linear ranges in the
> helper code already, can't remember why this driver isn't using that -
> the ranges overlap IIRC?).
> 
> TBH looking at the uses of find_range() I'm not sure they're 100%
> sensible as they are - the existing _time_sel() is assuming we only need
> to work out the ramp time between voltages in the same range which is
> going to have trouble.
> 
