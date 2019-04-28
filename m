Return-Path: <SRS0=bNAo=S6=gmail.com=dmitry.torokhov@kernel.org>
Date: Sun, 28 Apr 2019 10:31:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v8 2/2] input: touchscreen: Add support for Azoteq
 IQS550/572/525
Message-ID: <20190428173136.GA44908@dtor-ws>
References: <1554613272-10757-1-git-send-email-jeff@labundy.com>
 <1554613272-10757-2-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554613272-10757-2-git-send-email-jeff@labundy.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: devicetree@vger.kernel.org, linux-input@vger.kernel.org, rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

Hi Jeff,

On Sun, Apr 07, 2019 at 12:01:12AM -0500, Jeff LaBundy wrote:
> +static void iqs5xx_reset(struct i2c_client *client)
> +{
> +	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
> +
> +	gpiod_set_value_cansleep(iqs5xx->reset_gpio, 0);
> +	usleep_range(200, 300);
> +
> +	gpiod_set_value_cansleep(iqs5xx->reset_gpio, 1);

I believe we need to switch these statements around:

	gpiod_set_value_cansleep(iqs5xx->reset_gpio, 1);
	usleep_range(200, 300);
	gpiod_set_value_cansleep(iqs5xx->reset_gpio, 0);

so that you activate reset line, wait, and then release it. GPIOD deals
with logical signals, with 1 being active and 0 beig inactive. If reset
line is active low (it typically us) then it shoudl be described as such
in DTS and then gpiod API will take care of converting "1" logical
active to "0" actual value being output.

> +
> +static irqreturn_t iqs5xx_irq(int irq, void *data)
> +{
> +	struct iqs5xx_private *iqs5xx = (struct iqs5xx_private *)data;
> +	struct iqs5xx_touch_data *touch_data;
> +	struct i2c_client *client = iqs5xx->client;
> +	struct input_dev *input = iqs5xx->input;
> +	int error, i;
> +	u8 buf[sizeof(*touch_data) * IQS5XX_NUM_CONTACTS];

Given that iqs5xx_touch_data is packed, can't we do

	struct iqs5xx_touch_data touch_data[IQS5XX_NUM_CONTACTS];

instead?

No need to resubmit if you agree, I can make changes on my side before
applying.

I also noticed that you are overusing ARRAY_SIZE(): in several cases you
used it instead of sizeof() for supplying size of a buffer to transfer
functions. While the result will not change, from logical POW you are
not interested in number of elements in an array there, you want the
total size of data structure that just happens to be an array.

Thanks.

-- 
Dmitry
