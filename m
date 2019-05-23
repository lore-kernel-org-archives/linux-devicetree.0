From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Thu, 23 May 2019 10:35:46 +0200
Message-ID: <a89763cb-5d50-0927-7912-6ccf38ae1d66@linaro.org>
References: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
 <20190502023316.GS14916@sirena.org.uk>
 <dd15d784-f2a1-78c6-3543-69bbcc1143c4@linaro.org>
 <20190503062626.GE14916@sirena.org.uk>
 <229823c4-f5d4-4821-ded1-cc046dd0bd20@linaro.org>
 <20190506043809.GL14916@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190506043809.GL14916@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/6/19 06:38, Mark Brown wrote:
> On Fri, May 03, 2019 at 10:29:42AM +0200, Jorge Ramirez wrote:
>> On 5/3/19 08:26, Mark Brown wrote:
>>> On Thu, May 02, 2019 at 01:30:48PM +0200, Jorge Ramirez wrote:
> 
>>> It seems a bit of a jump to add a new driver - it's just another
>>> descriptor and ops structure isn't it?  Though as ever with the Qualcomm
>>> stuff this driver is pretty baroque which doesn't entirely help though I
>>> think it's just another regulator type which there's already some
>>> handling for.
> 
>> So how do we move this forward?
> 
>> To sum up his regulator needs to be able to bypass accesses to
>> SPMI_COMMON_REG_VOLTAGE_RANGE and provide the range in some other way
>> hence the change below
> 
>> I can't find a simpler solution than this since the function does now
>> what is supposed to do for all the regulator types supported in the driver
> 
> The assumption that you need to have this regulator use functions that
> use and provide ranges is the very thing I'm trying to get you to
> change.  It looks like these regulators just need their own
> set_voltage_sel() and get_voltage_sel() then they can use the standard
> linear range mapping functions (and pobably the set_voltage_time_sel()
> needs fixing anyway for all the other regulators).

Right, and I understand what you are asking, is just that I completely
disagree with you. But moving on.

Would you accept if I wrote a separate driver specific to pms405 or do
you want me to integrate in qcom-spmi_regulator.c?

I am asking because none of the ops will use the common functions (I
wont be reusing much code from this qcom-spmi_regulator.c file)

> 
> There's already some conditional code in the probe function for handling
> different operations for the over current protection and SAW stuff, this
> looks like it should fit in reasonably well.  Usually this would be even
> easier as probe functions are just data driven but for some reason more
> than usual of this driver's data initializaiton is done dynamically.
> 
