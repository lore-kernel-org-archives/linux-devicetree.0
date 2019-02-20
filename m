From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 5/9] iio: accel: bma180: convert to devm
Date: Wed, 20 Feb 2019 17:23:18 +0100
Message-ID: <EF8A39BC-4BA9-4BBE-9AE7-8B0FE4440B13@goldelico.com>
References: <cover.1550671256.git.hns@goldelico.com> <900f59b94ef2e1b5559b363c0d1af4fefccd0366.1550671256.git.hns@goldelico.com> <20190220161828.0c6fcd8e@archlinux>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220161828.0c6fcd8e@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

> Am 20.02.2019 um 17:18 schrieb Jonathan Cameron <jic23@kernel.org>:
> 
> On Wed, 20 Feb 2019 15:00:52 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> 
>> This simplifies the code a little.
> It does, but at the cost of introducing potential race conditions.
> Please don't do this.  See below for why and a suggestion on how
> to resolve things if you want to make this change safely.

Ok, I see. I just was working on that driver and thought that introducing
devm is a good idea here.

But since it does not improve any function (contrary to the mount-matrix
patches), let's drop it for the moment.

BR and thanks,
Nikolaus

> 
> Jonathan
>> 
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/iio/accel/bma180.c | 56 ++++++++++++++------------------------
>> 1 file changed, 21 insertions(+), 35 deletions(-)
>> 
>> diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
>> index 248be67e4f41..3f5ee2d495d3 100644
>> --- a/drivers/iio/accel/bma180.c
>> +++ b/drivers/iio/accel/bma180.c
>> @@ -738,7 +738,7 @@ static int bma180_probe(struct i2c_client *client,
>> 
>> 	ret = data->part_info->chip_config(data);
>> 	if (ret < 0)
>> -		goto err_chip_disable;
>> +		goto err;
>> 
>> 	mutex_init(&data->mutex);
>> 	indio_dev->dev.parent = &client->dev;
>> @@ -748,12 +748,25 @@ static int bma180_probe(struct i2c_client *client,
>> 	indio_dev->modes = INDIO_DIRECT_MODE;
>> 	indio_dev->info = &bma180_info;
>> 
>> +	ret = devm_iio_triggered_buffer_setup(&client->dev, indio_dev, NULL,
>> +			bma180_trigger_handler, NULL);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "unable to setup iio triggered buffer\n");
>> +		goto err;
>> +	}
>> +
>> +	ret = devm_iio_device_register(&client->dev, indio_dev);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "unable to register iio device\n");
>> +		goto err;
>> +	}
>> +
>> 	if (client->irq > 0) {
>> -		data->trig = iio_trigger_alloc("%s-dev%d", indio_dev->name,
>> -			indio_dev->id);
>> +		data->trig = devm_iio_trigger_alloc(&client->dev, "%s-dev%d",
>> +			indio_dev->name, indio_dev->id);
>> 		if (!data->trig) {
>> 			ret = -ENOMEM;
>> -			goto err_chip_disable;
>> +			goto err;
>> 		}
>> 
>> 		ret = devm_request_irq(&client->dev, client->irq,
>> @@ -761,7 +774,7 @@ static int bma180_probe(struct i2c_client *client,
>> 			"bma180_event", data->trig);
>> 		if (ret) {
>> 			dev_err(&client->dev, "unable to request IRQ\n");
>> -			goto err_trigger_free;
>> +			goto err;
>> 		}
>> 
>> 		data->trig->dev.parent = &client->dev;
>> @@ -769,34 +782,14 @@ static int bma180_probe(struct i2c_client *client,
>> 		iio_trigger_set_drvdata(data->trig, indio_dev);
>> 		indio_dev->trig = iio_trigger_get(data->trig);
>> 
>> -		ret = iio_trigger_register(data->trig);
>> +		ret = devm_iio_trigger_register(&client->dev, data->trig);
>> 		if (ret)
>> -			goto err_trigger_free;
>> -	}
>> -
>> -	ret = iio_triggered_buffer_setup(indio_dev, NULL,
>> -			bma180_trigger_handler, NULL);
>> -	if (ret < 0) {
>> -		dev_err(&client->dev, "unable to setup iio triggered buffer\n");
>> -		goto err_trigger_unregister;
>> -	}
>> -
>> -	ret = iio_device_register(indio_dev);
>> -	if (ret < 0) {
>> -		dev_err(&client->dev, "unable to register iio device\n");
>> -		goto err_buffer_cleanup;
>> +			goto err;
>> 	}
>> 
>> 	return 0;
>> 
>> -err_buffer_cleanup:
>> -	iio_triggered_buffer_cleanup(indio_dev);
>> -err_trigger_unregister:
>> -	if (data->trig)
>> -		iio_trigger_unregister(data->trig);
>> -err_trigger_free:
>> -	iio_trigger_free(data->trig);
>> -err_chip_disable:
>> +err:
>> 	data->part_info->chip_disable(data);
>> 
>> 	return ret;
>> @@ -807,13 +800,6 @@ static int bma180_remove(struct i2c_client *client)
>> 	struct iio_dev *indio_dev = i2c_get_clientdata(client);
>> 	struct bma180_data *data = iio_priv(indio_dev);
>> 
>> -	iio_device_unregister(indio_dev);
>> -	iio_triggered_buffer_cleanup(indio_dev);
>> -	if (data->trig) {
>> -		iio_trigger_unregister(data->trig);
>> -		iio_trigger_free(data->trig);
>> -	}
>> -
> Now we disable the device before removing it's userspace interface.
> Not a good idea.
> 
> Generally I will insist on the remove order always being the precise
> opposite of probe simply because it is obviously correct.
> That includes cases which can be simply argued to be fine (not
> this one which isn't). The reason is readability trumps saving
> a few lines of code and it's a lot easier to check a probe and
> remove function against each other if the order is maintained.
> 
> Of course, there are ways to do this by making all the unwind
> managed, but you haven't done this here.
> devm_add_action_or_reset is handy for this if you want to do it.
> 
>> 	mutex_lock(&data->mutex);
>> 	data->part_info->chip_disable(data);
>> 	mutex_unlock(&data->mutex);
> 
