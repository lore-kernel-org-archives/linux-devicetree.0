From: Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH 05/15] media: staging/imx7: add MIPI CSI-2 receiver subdev
 for i.MX7
Date: Thu, 19 Apr 2018 15:09:19 +0100
Message-ID: <m3h8o79tkg.fsf@gmail.com>
References: <20180419101812.30688-1-rui.silva@linaro.org>
 <20180419101812.30688-6-rui.silva@linaro.org>
 <20180419124515.r4336zu4ecsu3k6k@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <20180419124515.r4336zu4ecsu3k6k@mwanda>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Dan,
On Thu 19 Apr 2018 at 12:45, Dan Carpenter wrote:
>> +static int mipi_csis_clk_get(struct csi_state *state)
>> +{
>> +	struct device *dev = &state->pdev->dev;
>> +	int ret = true;
>
> Better to leave ret unitialized.

ack.

>
>> +
>> +	state->mipi_clk = devm_clk_get(dev, "mipi");
>> +	if (IS_ERR(state->mipi_clk)) {
>> +		dev_err(dev, "Could not get mipi csi clock\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	state->phy_clk = devm_clk_get(dev, "phy");
>> +	if (IS_ERR(state->phy_clk)) {
>> +		dev_err(dev, "Could not get mipi phy clock\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* Set clock rate */
>> +	if (state->clk_frequency)
>> +		ret = clk_set_rate(state->mipi_clk, 
>> state->clk_frequency);
>> +	else
>> +		dev_warn(dev, "No clock frequency specified!\n");
>> +	if (ret < 0) {
>> +		dev_err(dev, "set rate=%d failed: %d\n", 
>> state->clk_frequency,
>> +			ret);
>> +		return -EINVAL;
>
> Preserve the error code.

agree.

>
>> +	}
>> +
>> +	return ret;
>
> This could be "return 0;" (let's not return true).  It might be 
> nicer
> like:
>
> 	if (!state->clk_frequency) {

looking back again to my code ;), this can never happen, because 
if
clock-frequency is not given by dts I give it a default value. So, 
this
error path will never happen. I will take this in account in v2.

> 		dev_warn(dev, "No clock frequency specified!\n");
> 		return 0;
> 	}
>
> 	ret = clk_set_rate(state->mipi_clk, state->clk_frequency);
> 	if (ret < 0)
> 		dev_err(dev, "set rate=%d failed: %d\n", 
> state->clk_frequency,
> 			ret);
>
> 	return ret;
>
>
>> +}
>> +
>
> [ snip ]
>
>> +static irqreturn_t mipi_csis_irq_handler(int irq, void 
>> *dev_id)
>> +{
>> +	struct csi_state *state = dev_id;
>> +	unsigned long flags;
>> +	u32 status;
>> +	int i;
>> +
>> +	status = mipi_csis_read(state, MIPI_CSIS_INTSRC);
>> +
>> +	spin_lock_irqsave(&state->slock, flags);
>> +
>> +	/* Update the event/error counters */
>> +	if ((status & MIPI_CSIS_INTSRC_ERRORS) || 1) {
>                                                  ^^^
> Was this supposed to make it into the published code?

No... ;). Only for my debug purpose... Good catch.

---
Cheers,
	Rui
