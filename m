Return-Path: <SRS0=PCtB=IU=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: Add driver for MAX9485
References: <20180525182058.25969-1-daniel@zonque.org>
 <20180525182058.25969-3-daniel@zonque.org>
 <152792003850.225090.13213694533140196613@swboyd.mtv.corp.google.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <6bcfa930-f317-dd20-b2d7-c708a7be5d6b@zonque.org>
Date: Sat, 2 Jun 2018 13:14:25 +0200
MIME-Version: 1.0
In-Reply-To: <152792003850.225090.13213694533140196613@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Daniel Mack <zonque@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hi Stephen,

Thanks for the review!

On Saturday, June 02, 2018 08:13 AM, Stephen Boyd wrote:
> Quoting Daniel Mack (2018-05-25 11:20:58)

>> +enum {
>> +       MAX9485_FS_12KHZ        = 0 << 0,
>> +       MAX9485_FS_32KHZ        = 1 << 0,
>> +       MAX9485_FS_44_1KHZ      = 2 << 0,
>> +       MAX9485_FS_48KHZ        = 3 << 0,
>> +};
>> +
>> +enum {
>> +       MAX9485_SCALE_256       = 0 << 2,
>> +       MAX9485_SCALE_384       = 1 << 2,
>> +       MAX9485_SCALE_768       = 2 << 2,
>> +};
> 
> Any reason to be an enum? Maybe they can just be #defines.

No particular reason, but an enum shows these values are grouped 
together. But I can also turn them into defines, it's just a matter of 
taste I guess.

>> +struct max9485_driver_data {
>> +       struct clk *xclk;
>> +       struct i2c_client *client;
>> +       u8 reg_value;
>> +       unsigned long clkout_rate;
>> +       struct regulator *supply;
>> +       struct gpio_desc *reset_gpio;
>> +       struct max9485_clk_hw hw[MAX9485_NUM_CLKS];
>> +
>> +       struct {
>> +               struct clk_hw_onecell_data data;
>> +               struct clk_hw *hw[MAX9485_NUM_CLKS];
> 
> I don't quite understand this one. There's already an array of clk_hw
> pointers inside of clk_hw_onecell_data so just use that? But then
> there's also an array of max9485_clk_hw structures, so maybe roll your
> own clk_hw getter function?

Ah, yes. The latter makes most sense. I was somehow stuck with the idea 
that the onecell helper makes sense here. Thanks for the heads-up.

>> +static int max9485_update_bits(struct max9485_driver_data *drvdata,
>> +                              u8 mask, u8 value)
>> +{
>> +       int ret;
>> +
>> +       drvdata->reg_value &= ~mask;
>> +       drvdata->reg_value |= value;
>> +
>> +       dev_dbg(&drvdata->client->dev,
>> +               "updating mask %02x value %02x -> %02x\n",
>> +               mask, value, drvdata->reg_value);
>> +
>> +       ret = i2c_master_send(drvdata->client,
>> +                             &drvdata->reg_value,
>> +                             sizeof(drvdata->reg_value));
> 
> Maybe use a regmap instead? Then you could use regmap_update_bits() in
> the places you need it.

I wish, but nope, regmap doesn't work for devices that don't actually 
have registers, like this one. There's no extra byte for a register 
address or such, just one plain byte of payload.

[...]

>> +               return -ENOMEM;
>> +
>> +       drvdata->xclk = devm_clk_get(dev, "xclk");
>> +       if (IS_ERR(drvdata->xclk))
>> +               return PTR_ERR(drvdata->xclk);
>> +
>> +       freq = clk_get_rate(drvdata->xclk);
>> +       if (freq != MAX9485_INPUT_FREQ) {
>> +               dev_err(dev, "Illegal xclk frequency of %ld\n", freq);
>> +               return -EINVAL;
>> +       }
> 
> Is this necessary? Seems pretty useless to do everywhere to make sure
> that someone didn't design the hardware incorrectly. It would be better
> to return the rate of the parent "xclk" by not having a recalc_rate hook
> and relying on the parent's rate.

Hmm, but the hardware doesn't work if the clock is anything else than 
27.0MHz. But I'll remove the check no problem. After all, we don't check 
the regulator voltages either.

I've addressed all other comments. Will resend v3.


Thanks again!
Daniel
