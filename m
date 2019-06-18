From: Nisha Kumari <nishakumari@codeaurora.org>
Subject: Re: [PATCH 3/4] regulator: Add labibb driver
Date: Tue, 18 Jun 2019 11:51:18 +0530
Message-ID: <577d6e90-0bed-ff2e-32dc-e64c3118458f@codeaurora.org>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-4-git-send-email-nishakumari@codeaurora.org>
 <20190613172518.GN5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613172518.GN5316@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org, linux-kernel@vger.kernel.org, kgunda@codeaurora.org, rnayak@codeaurora.org
List-Id: devicetree@vger.kernel.org


On 6/13/2019 10:55 PM, Mark Brown wrote:
> On Wed, Jun 12, 2019 at 04:30:51PM +0530, Nisha Kumari wrote:
>
>> +static int qcom_labibb_read(struct qcom_labibb *labibb, u16 address,
>> +			    u8 *val, int count)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_bulk_read(labibb->regmap, address, val, count);
>> +	if (ret < 0)
>> +		dev_err(labibb->dev, "spmi read failed ret=%d\n", ret);
>> +
>> +	return ret;
>> +}
> This (and the write function) are utterly trivial wrappers around the
> corresponding regmap functions...
Yeah, i will use the regmap functions directly wherever required
>
>> +static int qcom_labibb_masked_write(struct qcom_labibb *labibb, u16 address,
>> +				    u8 mask, u8 val)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_update_bits(labibb->regmap, address, mask, val);
>> +	if (ret < 0)
>> +		dev_err(labibb->dev, "spmi write failed: ret=%d\n", ret);
>> +
>> +	return ret;
>> +}
> ...as is this but it changes the name for some reason.
Yeah, i will use the regmap functions directly wherever required
>
>> +static int qcom_enable_ibb(struct qcom_labibb *labibb, bool enable)
>> +{
>> +	int ret;
>> +	u8 val = enable ? IBB_CONTROL_ENABLE : 0;
> Please write normal conditional statements, it makes things easier to
> read.  Though this function is so trivial it seems better to just inline
> it into the callers.
Sure, I will do that
>
>> +static int qcom_lab_regulator_enable(struct regulator_dev *rdev)
>> +{
>> +	int ret;
>> +	u8 val;
>> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
>> +
>> +	val = LAB_ENABLE_CTL_EN;
>> +	ret = qcom_labibb_write(labibb,
>> +				labibb->lab_base + REG_LAB_ENABLE_CTL,
>> +				&val, 1);
> Why not just use regmap_write()?  It'd be clearer.
Sure, I will do that
>
>> +	labibb->lab_vreg.vreg_enabled = 1;
> What function does this serve?  It never seems to be read.
Its used in next patch for handling interrupts
>
>> +	ret = qcom_labibb_write(labibb,
>> +				labibb->lab_base + REG_LAB_ENABLE_CTL,
>> +				&val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Write register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +	/* after this delay, lab should get disabled */
>> +	usleep_range(POWER_DELAY, POWER_DELAY + 100);
>> +
>> +	ret = qcom_labibb_read(labibb, labibb->lab_base +
>> +			       REG_LAB_STATUS1, &val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
> I'm not clear that these status checks are actually a good idea, and if
> they are it feels like they should be factored out into the framework -
> these are just regular enable or disable followed by the usual dead
> reckoning delay for completion and then a get_status() call to confirm
> if the operation worked.  That's not at all driver specific so if it's
> useful the core should do it for all regulators with status readback and
> if you didn't do it you could use the standard regmap helpers for these
> operations.
Sure, I will do that
>
>> +static int qcom_lab_regulator_is_enabled(struct regulator_dev *rdev)
>> +{
>> +	int ret;
>> +	u8 val;
>> +	struct qcom_labibb *labibb  = rdev_get_drvdata(rdev);
>> +
>> +	ret = qcom_labibb_read(labibb, labibb->lab_base +
>> +			       REG_LAB_STATUS1, &val, 1);
>> +	if (ret < 0) {
>> +		dev_err(labibb->dev, "Read register failed ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return val & LAB_STATUS1_VREG_OK_BIT;
>> +}
> Please use the standard helper for this, and this is a get_status()
> operation not an is_enabled() - it checks if the regulator is working,
> not what status was requested.
ok
>
>> +	while (retries--) {
>> +		/* Wait for a small period before reading IBB_STATUS1 */
>> +		usleep_range(POWER_DELAY, POWER_DELAY + 100);
>> +
>> +		ret = qcom_labibb_read(labibb, labibb->ibb_base +
>> +				       REG_IBB_STATUS1, &val, 1);
>> +		if (ret < 0) {
>> +			dev_err(labibb->dev,
>> +				"Read register failed ret = %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		if (val & IBB_STATUS1_VREG_OK_BIT) {
>> +			labibb->ibb_vreg.vreg_enabled = 1;
>> +			return 0;
>> +		}
>> +	}
> This is doing more than the other regulator was but it's not clear why -
> is it just that the delays are different for the two regulators?
LAB regulator comes up in first try, so we did not added much delay in 
that like IBB. Planning to make equal no of retries for both in next 
patch so that code can be reused.
>
>> +static int register_lab_regulator(struct qcom_labibb *labibb,
>> +				  struct device_node *of_node)
>> +{
>> +	int ret = 0;
>> +	struct regulator_init_data *init_data;
>> +	struct regulator_config cfg = {};
>> +
>> +	cfg.dev = labibb->dev;
>> +	cfg.driver_data = labibb;
>> +	cfg.of_node = of_node;
>> +	init_data =
>> +		of_get_regulator_init_data(labibb->dev,
>> +					   of_node, &lab_desc);
>> +	if (!init_data) {
>> +		dev_err(labibb->dev,
>> +			"unable to get init data for LAB\n");
>> +		return -ENOMEM;
>> +	}
> The core will parse the DT for you.
ok
