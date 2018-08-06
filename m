Return-Path: <SRS0=6rqM=KV=linaro.org=bjorn.andersson@kernel.org>
Date: Mon, 6 Aug 2018 11:45:55 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/2] i2c: Add Qualcomm CCI I2C driver
Message-ID: <20180806184555.GC21235@tuxbook-pro>
References: <20180806110416.4288-1-vkoul@kernel.org>
 <20180806110416.4288-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180806110416.4288-3-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Mon 06 Aug 04:04 PDT 2018, Vinod Koul wrote:
[..]
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
[..]
> +struct hw_params {
> +	u16 thigh;
> +	u16 tlow;
> +	u16 tsu_sto;
> +	u16 tsu_sta;
> +	u16 thd_dat;
> +	u16 thd_sta;
> +	u16 tbuf;
> +	u8 scl_stretch_en;
> +	u16 trdhld;
> +	u16 tsp;
> +};
> +
> +struct cci_clock {

This is now unused.

> +	struct clk *clk;
> +	const char *name;
> +	u32 freq;
> +};
> +
> +struct cci;
> +
> +struct cci_master {
> +	struct i2c_adapter adap;
> +	u16 master;
> +	u8 mode;
> +	int status;
> +	bool complete_pending;
> +	struct completion irq_complete;
> +	struct cci *cci;
> +

Empty line.

> +};
> +
> +struct cci_data {
> +	unsigned int num_masters;
> +	struct i2c_adapter_quirks quirks;
> +	u16 queue_size[NUM_QUEUES];
> +	struct cci_res res;
> +	struct hw_params params[3];
> +};
> +
> +struct cci {
> +	struct device *dev;
> +	void __iomem *base;
> +	u32 irq;

Use unsigned int rather than a type of specific size

> +	const struct cci_data *data;
> +	struct clk_bulk_data *clock;
> +	u32 *clock_freq;
> +	int nclocks;
> +	struct cci_master master[NUM_MASTERS];
> +};
> +
> +/**
> + * cci_clock_set_rate() - Set clock frequency rates
> + * @nclocks: Number of clocks
> + * @clock: Clock array
> + * @clock_freq: Clock frequency rate array
> + * @dev: Device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int cci_clock_set_rate(int nclocks, struct clk_bulk_data *clock,
> +			      u32 *clock_freq, struct device *dev)
> +{
> +	int i, ret;
> +	long rate;
> +
> +	for (i = 0; i < nclocks; i++)

Multiline loop deserves {}

> +		if (clock_freq[i]) {
> +			rate = clk_round_rate(clock[i].clk, clock_freq[i]);
> +			if (rate < 0) {
> +				dev_err(dev, "clk round rate failed: %ld\n",
> +					rate);
> +				return rate;
> +			}
> +
> +			ret = clk_set_rate(clock[i].clk, clock_freq[i]);
> +			if (ret < 0) {
> +				dev_err(dev, "clk set rate failed: %d\n", ret);
> +				return ret;
> +			}
> +		}
> +
> +	return 0;
> +}
> +
[..]
[..]
> +static int cci_reset(struct cci *cci)
> +{
> +	unsigned long time;
> +
> +	cci->master[0].complete_pending = true;
> +	writel(CCI_RESET_CMD_MASK, cci->base + CCI_RESET_CMD);
> +
> +	time = wait_for_completion_timeout
> +		(&cci->master[0].irq_complete,
> +		 msecs_to_jiffies(CCI_TIMEOUT_MS));

Please rework the indentation of this.


Also CCI_TIMEOUT_MS is converted to jiffies in all the places, define it
in jiffies instead.

> +	if (!time) {
> +		dev_err(cci->dev, "CCI reset timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
[..]
> +static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
> +{
> +	int ret = 0;
> +	u32 val;
> +
> +	val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
> +
> +	if (val == cci->data->queue_size[queue])
> +		return -EINVAL;
> +
> +	if (val) {
> +		val = CCI_I2C_REPORT | BIT(8);

Can we get a define (or a comment) for BIT(8) as well?

> +		writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +		ret = cci_run_queue(cci, master, queue);
> +	}
> +
> +	return ret;

Rather than wrapping the second half of the function in a check for val,
return early on !val and then you can end with return cci_run_queue()
and drop the "ret".

> +}
> +
> +static int cci_i2c_read(struct cci *cci, u16 master,
> +			u16 addr, u8 *buf, u16 len)
> +{
> +	u32 val, words_read, words_exp;
> +	u8 queue = QUEUE_1;
> +	int i, index = 0, ret;
> +	bool first = 0;

s/0/false/

> +
> +	/*
> +	 * Call validate queue to make sure queue is empty before starting.
> +	 * This is to avoid overflow / underflow of queue.
> +	 */
> +	ret = cci_validate_queue(cci, master, queue);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +	val = CCI_I2C_READ | len << 4;
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +	ret = cci_run_queue(cci, master, queue);
> +	if (ret < 0)
> +		return ret;
> +
> +	words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
> +	words_exp = len / 4 + 1;
> +	if (words_read != words_exp) {
> +		dev_err(cci->dev, "words read = %d, words expected = %d\n",
> +			words_read, words_exp);
> +		return -EIO;
> +	}

I thought that an i2c read could return less data than was requested...

> +
> +	do {
> +		val = readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
> +
> +		for (i = 0; i < 4 && index < len; i++) {
> +			if (first) {
> +				first = false;
> +				continue;
> +			}
> +			buf[index++] = (val >> (i * 8)) & 0xff;
> +		}
> +	} while (--words_read);
> +
> +	return 0;
> +}
[..]
> +static int cci_probe(struct platform_device *pdev)
> +{
[..]
> +	/* Clocks */
> +
> +	cci->nclocks = 0;
> +	while (cci->data->res.clock[cci->nclocks])
> +		cci->nclocks++;
> +
> +	cci->clock = devm_kcalloc(dev, cci->nclocks,
> +				  sizeof(*cci->clock), GFP_KERNEL);
> +	if (!cci->clock)
> +		return -ENOMEM;
> +
> +	cci->clock_freq = devm_kcalloc(dev, cci->nclocks,

You're just using this temporarily to create a copy of the
res.clock_rate array, how about just passing the res.clock_rate into
cci_clock_set_rate() ?

> +				       sizeof(*cci->clock_freq), GFP_KERNEL);
> +	if (!cci->clock_freq)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < cci->nclocks; i++) {
> +		struct clk_bulk_data *clock = &cci->clock[i];
> +
> +		clock->clk = devm_clk_get(dev, cci->data->res.clock[i]);
> +		if (IS_ERR(clock->clk))
> +			return PTR_ERR(clock->clk);
> +
> +		clock->id = cci->data->res.clock[i];
> +		cci->clock_freq[i] = cci->data->res.clock_rate[i];
> +	}

Fill out cci->clock[*].id and call clk_bulk_get()

> +
> +	ret = cci_clock_set_rate(cci->nclocks, cci->clock,
> +				 cci->clock_freq, dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = clk_bulk_prepare_enable(cci->nclocks, cci->clock);

It seems a little bit excessive to keep the clocks on while the driver
is probed, but this could be improved in a follow up patch...

> +	if (ret < 0)
> +		return ret;
> +
> +	val = readl_relaxed(cci->base + CCI_HW_VERSION);
> +	dev_dbg(dev, "%s: CCI HW version = 0x%08x", __func__, val);
> +
> +	enable_irq(cci->irq);
> +
> +	ret = cci_reset(cci);
> +	if (ret < 0)
> +		goto error;
> +
> +	for (i = 0; i < cci->data->num_masters; i++) {
> +		ret = cci_init(cci, &cci->data->params[cci->master[i].mode]);
> +		if (ret < 0)
> +			goto error;
> +
> +		ret = i2c_add_adapter(&cci->master[i].adap);
> +		if (ret < 0)
> +			goto error_i2c;
> +	}
> +
> +	return 0;
> +
> +error_i2c:
> +	for (; i >= 0; i--)
> +		i2c_del_adapter(&cci->master[i].adap);
> +error:
> +	disable_irq(cci->irq);
> +	clk_bulk_disable_unprepare(cci->nclocks, cci->clock);
> +
> +	return ret;
> +}
> +
> +static int cci_remove(struct platform_device *pdev)
> +{
> +	struct cci *cci = platform_get_drvdata(pdev);
> +	int i;
> +
> +	disable_irq(cci->irq);
> +	clk_bulk_disable_unprepare(cci->nclocks, cci->clock);

i2c clients might be communicating with their clients until you call
i2c_del_adapter(), so better pull the resources after you have removed
the adaptor.

Maybe even a cci_halt() call before we cut the clocks?

> +
> +	for (i = 0; i < cci->data->num_masters; i++)
> +		i2c_del_adapter(&cci->master[i].adap);
> +
> +	return 0;
> +}
[..]
> +static const struct cci_data cci_v1_4_0_data = {
[..]
> +		{
> +			/* I2C_MODE_FAST_PLUS */
> +			.thigh = 16,
> +			.tlow = 22,
> +			.tsu_sto = 17,
> +			.tsu_sta = 18,
> +			.thd_dat = 16,
> +			.thd_sta = 15,
> +			.tbuf = 24,
> +			.scl_stretch_en = 0,
> +			.trdhld = 3,
> +			.tsp = 3
> +		}
> +

Empty line.

> +	},
> +
> +};

The dt binding mentions that a power domain is required for v1.4, but
there's no support for this in the driver.

Regards,
Bjorn
