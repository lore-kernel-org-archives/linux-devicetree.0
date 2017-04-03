From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2] i2c/muxes/i2c-mux-ltc4306: LTC4306 and LTC4305 I2C
 multiplexer/switch
Date: Mon, 3 Apr 2017 14:03:35 +0200
Message-ID: <3c61461e-493c-4562-90c9-f30766591de2@axentia.se>
References: <1490782541-7832-1-git-send-email-michael.hennerich@analog.com>
 <0d4c068f-d909-64be-421d-4500da7ebd4c@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <0d4c068f-d909-64be-421d-4500da7ebd4c@axentia.se>
Sender: linux-i2c-owner@vger.kernel.org
To: michael.hennerich@analog.com, wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2017-03-31 17:29, Peter Rosin wrote:
> Hi!
> 
> Sorry for my incremental reviewing...
> 

Another incremental...

> On 2017-03-29 12:15, michael.hennerich@analog.com wrote:
>> +
>> +	/* Now create an adapter for each channel */
>> +	for (num = 0; num < data->chip->nchans; num++) {
>> +		ret = i2c_mux_add_adapter(muxc, 0, num, 0);
>> +		if (ret) {
>> +			dev_err(&client->dev,
>> +				"failed to register multiplexed adapter %d\n",
>> +				num);

Just a heads up, I submitted a series to remove a bunch of dev_err calls
when i2c_mux_add_adapter fails. See https://lkml.org/lkml/2017/4/3/115

You can remove this one as well.

And please use a subject of the form:
i2c: mux: ltc4306: <message>

Cheers,
peda

>> +			goto add_adapter_failed;
>> +		}
