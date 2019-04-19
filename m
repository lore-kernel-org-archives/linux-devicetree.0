From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Fri, 19 Apr 2019 19:29:48 +0200
Message-ID: <95276ca0-6896-a595-867a-184a518fa31f@linaro.org>
References: <1548675904-18324-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548675904-18324-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190204090301.GC23441@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190204090301.GC23441@sirena.org.uk>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vinod.koul@linaro.org, linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org, lgirdwood@gmail.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, niklas.cassel@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2/4/19 10:03, Mark Brown wrote:
> On Mon, Jan 28, 2019 at 12:45:03PM +0100, Jorge Ramirez-Ortiz wrote:
> 
>> @@ -653,6 +708,10 @@ spmi_regulator_find_range(struct spmi_regulator *vreg)
>>  	range = vreg->set_points->range;
>>  	end = range + vreg->set_points->count;
>>  
>> +	/* we know we only have one range for this type */
>> +	if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430)
>> +		return range;
>> +
>>  	spmi_vreg_read(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, &range_sel, 1);
>>  
>>  	for (; range < end; range++)
> 
> Rather than have special casing for the logical type in here it seems
> better to just provide a specific op for this logical type, you could
> always make _find_range() call into that one if you really want code
> reuse here.  You already have separate ops for this regulator type
> anyway.

sorry I dont quite understand your point.

static struct regulator_ops spmi_hfs430_ops = {
	/* always on regulators */
	.set_voltage_sel	= spmi_regulator_hfs430_set_voltage, *
	.set_voltage_time_sel	= spmi_regulator_set_voltage_time_sel, *
	.get_voltage		= spmi_regulator_hfs430_get_voltage,
	.map_voltage		= spmi_regulator_common_map_voltage, *
	.list_voltage		= spmi_regulator_common_list_voltage,
	.get_mode		= spmi_regulator_hfs430_get_mode,
	.set_mode		= spmi_regulator_hfs430_set_mode,
};

find_range affects the functions above with *

You are right and I can easily adjust the private
spmi_regulator_hfs430_set_voltage. And since it is quite small I can
also _duplicate_ the common function spmi_regulator_set_voltage_time_sel
with a small change for hfs430.

But spmi_regulator_common_map_voltage ends up being a large function and
I dont see the point in replicating it to save the "if" statement above.

why cant different logical_types extend spmi_regulator_find_range(..)?

Or maybe are you saying that I should add a new interface to struct
spmi_regulator that implements priv_find_range(..) for the logical types
that dont want to use the common implementation?

But also I am not sure I see the benefits with respect to the proposed
change...


> 
>> +static unsigned int spmi_regulator_hfs430_get_mode(struct regulator_dev *rdev)
>> +{
>> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
>> +	u8 reg;
>> +	int ret;
>> +
>> +	ret = spmi_vreg_read(vreg, SPMI_HFS430_REG_MODE, &reg, 1);
>> +	if (ret) {
>> +		dev_err(&rdev->dev, "failed to get mode");
>> +		return ret;
>> +	}
>> +
>> +	if (reg == SPMI_HFS430_MODE_PWM)
>> +		return REGULATOR_MODE_NORMAL;
>> +
>> +	return REGULATOR_MODE_IDLE;
>> +}
> 
> I'd have expected a switch statement here, ideally flagging a warning or
> error if we get a surprising value in there.

this implementation follows what the common function
spmi_regulator_common_get_mode implements (ie, checks for a case and
defaults if that is not the one; and when defaulting,  there is no
reporting that it is actually defaulting: ie, defaulting is not being
interpreted as an error..should it?)

> 
>> +static int spmi_regulator_hfs430_set_mode(struct regulator_dev *rdev,
>> +					  unsigned int mode)
>> +{
>> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
>> +	u8 reg = mode == REGULATOR_MODE_NORMAL ? SPMI_HFS430_MODE_PWM :
>> +						 SPMI_HFS430_MODE_AUTO;
> 
> Please write a normal if statement (or switch statement) to help
> legibility.
> 

ok.
