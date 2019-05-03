From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Fri, 3 May 2019 10:29:42 +0200
Message-ID: <229823c4-f5d4-4821-ded1-cc046dd0bd20@linaro.org>
References: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
 <20190502023316.GS14916@sirena.org.uk>
 <dd15d784-f2a1-78c6-3543-69bbcc1143c4@linaro.org>
 <20190503062626.GE14916@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503062626.GE14916@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/3/19 08:26, Mark Brown wrote:
> On Thu, May 02, 2019 at 01:30:48PM +0200, Jorge Ramirez wrote:
>> On 5/2/19 04:33, Mark Brown wrote:
> 
>>> I'm not sure I follow here, sorry - I can see that the driver needs a
>>> custom get/set selector operation but shouldn't it be able to use the
>>> standard list and map operations for linear ranges?
> 
>> I agree it should, but unfortunately that is not the case; when I first
>> posted the patch I was concerned that for a regulator to be supported by
>> this driver it should obey to the driver's internals (ie: comply with
>> all of the spmi_common_regulator_registers definitions).
> 
> That's not a requirement that I'd particularly expect - it's not unusual
> for devices to have multiple different styles of regulators in a single
> chip (eg, DCDCs often have quite different register maps to LDOs).
> 
>> However, since there was just a single range to support, the
>> modifications I had to do to support this SPMI regulator were minimal -
>> hence why I opted for the changes under discussion instead of writing a
>> new driver (which IMO it is an overkill).
> 
>> what do you think?
> 
> It seems a bit of a jump to add a new driver - it's just another
> descriptor and ops structure isn't it?  Though as ever with the Qualcomm
> stuff this driver is pretty baroque which doesn't entirely help though I
> think it's just another regulator type which there's already some
> handling for.
> 

So how do we move this forward?

To sum up his regulator needs to be able to bypass accesses to
SPMI_COMMON_REG_VOLTAGE_RANGE and provide the range in some other way
hence the change below

I can't find a simpler solution than this since the function does now
what is supposed to do for all the regulator types supported in the driver

 @@ -653,6 +708,10 @@ spmi_regulator_find_range(struct spmi_regulator *vreg)
  	range = vreg->set_points->range;
  	end = range + vreg->set_points->count;

 +	/* we know we only have one range for this type */
 +	if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430)
 +		return range;
 +
  	spmi_vreg_read(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, &range_sel, 1);

  	for (; range < end; range++)
