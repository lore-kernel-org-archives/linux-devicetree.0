Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBECC2D0D2
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 17:28:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28AFA206A5
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 17:28:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVvBW36r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbfLTR2e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 12:28:34 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40607 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLTR2e (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Dec 2019 12:28:34 -0500
Received: by mail-lf1-f68.google.com with SMTP id i23so7618976lfo.7
        for <devicetree@vger.kernel.org>; Fri, 20 Dec 2019 09:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=swSd6OdCvbkJ3gQV/drhsFd7dwDu9Du9+zA0jAR/0RU=;
        b=LVvBW36rLEq18tj/mNa0Vt4tb665eTmc3bPLv1dH/6Ez4qcfAnulqKBn4Oe9EUdFJc
         /zDbqUUaARRCuKbo1UXqhNUKuO1N/wod0rK6XkFH8FJZAs4yMN1T+ttxfEn0S4Phbk7K
         zUYu/k52pYQMnQtB6lLspLr/1OBs3FNWpJQBtnvb3XaQMOJTsUK0sqHOqZAD5fovPY+p
         ert8m0vghGK940LrWSaQ/K6HKhrmsUo+dPucNeLlzIP63CdlLKReULEKpyedrlGfOTMy
         Xzbek7w9KaCeSGeTW0VRje8whqxqOvu+nzy3UbWl4peaQrTmLx+S1S0ZdPJylahjH8YW
         wR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=swSd6OdCvbkJ3gQV/drhsFd7dwDu9Du9+zA0jAR/0RU=;
        b=Urp2YpFCOeQxP7U3il+i3GY6Iv0gqB0buyDJb0QPrQcZZvEf2wGPRwMqHmcmhtUN8y
         eKq9fUIzlqgCYEMbqssbJxL2uWiqFHO8FVtFE0hzjMeyq8JesywePIXP9OaBFT0Jn/HO
         CbFaCyIRs/+NZXmYuNvxSSd4NY4R9WKKObyyZX69lmshetN5UCc/8ONNKVWoe1jnf5Sr
         JTc8j35rOPOmFTFcS1PzyNWs8QfRNv5+9ynGko8UqP25wxUOOZ9DKkWBl4dqa1d6yQ/W
         E+uYXrGSq89y3K4uZ34CfcjtKYLfuWVX0S3BTRozvFot60LHgVVuvc3JNfctznZ4JQnn
         q7jg==
X-Gm-Message-State: APjAAAWXkMpiNg4Mph9TQovQJt6nbEmuDoP1AfeP5vaoiTXKq4ImuwFe
        ZrUhjlUSTVvH5pgoLS/mYabXMdzYO9A=
X-Google-Smtp-Source: APXvYqy26nrgp4Bs83mlcP2i0S0D+dq76q+2ENRTdkVFRKhRWv9SL+/eGTz+HY1PLuTqz8W3D0mX7A==
X-Received: by 2002:ac2:57cc:: with SMTP id k12mr10104720lfo.36.1576862911098;
        Fri, 20 Dec 2019 09:28:31 -0800 (PST)
Received: from [192.168.119.5] (office.dev.rtsoft.ru. [62.117.114.130])
        by smtp.gmail.com with ESMTPSA id y8sm4594358lji.56.2019.12.20.09.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 09:28:30 -0800 (PST)
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX219 sensor
To:     Ezequiel Garcia <ezequiel@collabora.com>, mchehab@kernel.org,
        robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dave.stevenson@raspberrypi.com, peter.griffin@linaro.org
References: <20191211115441.10637-1-andrey.konovalov@linaro.org>
 <20191211115441.10637-3-andrey.konovalov@linaro.org>
 <3edcc4d5fc694c497bd67e9c3b8294a681c47ac1.camel@collabora.com>
 <a9f585c8-7033-7eb9-6db5-cb2ea2aa63b1@linaro.org>
 <a3fac083ff8ee55368ed1cd2e57aae1277fb886a.camel@collabora.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <1396b9f6-0494-0ec4-5a27-f8c777622f1f@linaro.org>
Date:   Fri, 20 Dec 2019 20:28:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a3fac083ff8ee55368ed1cd2e57aae1277fb886a.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ezequiel,

On 19.12.2019 18:53, Ezequiel Garcia wrote:
> On Thu, 2019-12-19 at 01:29 +0300, Andrey Konovalov wrote:
>> Hi Ezequiel,
>>
>> Thank you for reviewing the patch!
>>
>>
> [..]
>>>> +/* Stop streaming */
>>>> +static int imx219_stop_streaming(struct imx219 *imx219)
>>>> +{
>>>> +	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>>>> +	int ret;
>>>> +
>>>> +	/* set stream off register */
>>>> +	ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
>>>> +			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
>>>> +	if (ret)
>>>> +		dev_err(&client->dev, "%s failed to set stream\n", __func__);
>>>> +
>>>> +	/*
>>>> +	 * Return success even if it was an error, as there is nothing the
>>>> +	 * caller can do about it.
>>>> +	 */
>>>
>>> Just change this function return to void, instead?
>>
>> Maybe something like that (functionally the same, but probably more self-explaining):
>>
>> -----8<-----
>> @@ -798,11 +796,7 @@ static int imx219_stop_streaming(struct imx219 *imx219)
> 
> I don't know if I'm missing something, but why can't we have:
> 
> static void imx219_stop_streaming(struct imx219 *imx219) ?
> 
> Since the return value is not used anywhere, it doesn't make sense
> to return it.

OK. Will fix it in v2.

>>           if (ret)
>>                   dev_err(&client->dev, "%s failed to set stream\n", __func__);
>>
>> -       /*
>> -        * Return success even if it was an error, as there is nothing the
>> -        * caller can do about it.
>> -        */
>> -       return 0;
>> +       return ret;
>>    }
>>
>>    static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>> @@ -832,7 +826,7 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>>                   if (ret)
>>                           goto err_rpm_put;
>>           } else {
>> -               imx219_stop_streaming(imx219);
>> +               (void)imx219_stop_streaming(imx219);
>>                   pm_runtime_put(&client->dev);
>>           }
>> -----8<-----
>>
>> ?
>>
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>>>> +{
>>>> +	struct imx219 *imx219 = to_imx219(sd);
>>>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>>>> +	int ret = 0;
>>>> +
>>>> +	mutex_lock(&imx219->mutex);
>>>> +	if (imx219->streaming == enable) {
>>>> +		mutex_unlock(&imx219->mutex);
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	if (enable) {
>>>> +		ret = pm_runtime_get_sync(&client->dev);
>>>> +		if (ret < 0) {
>>>> +			pm_runtime_put_noidle(&client->dev);
>>>> +			goto err_unlock;
>>>> +		}
>>>> +
>>>> +		/*
>>>> +		 * Apply default & customized values
>>>> +		 * and then start streaming.
>>>> +		 */
>>>> +		ret = imx219_start_streaming(imx219);
>>>> +		if (ret)
>>>> +			goto err_rpm_put;
>>>> +	} else {
>>>> +		imx219_stop_streaming(imx219);
>>>> +		pm_runtime_put(&client->dev);
>>>> +	}
>>>> +
>>>> +	imx219->streaming = enable;
>>>> +
>>>> +	/* vflip and hflip cannot change during streaming */
>>>> +	__v4l2_ctrl_grab(imx219->vflip, enable);
>>>> +	__v4l2_ctrl_grab(imx219->hflip, enable);
>>>> +
>>>> +	mutex_unlock(&imx219->mutex);
>>>> +
>>>> +	return ret;
>>>> +
>>>> +err_rpm_put:
>>>> +	pm_runtime_put(&client->dev);
>>>> +err_unlock:
>>>> +	mutex_unlock(&imx219->mutex);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +/* Power/clock management functions */
>>>> +static int imx219_power_on(struct device *dev)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>> +	struct imx219 *imx219 = to_imx219(sd);
>>>> +	int ret;
>>>> +
>>>> +	ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
>>>> +				    imx219->supplies);
>>>> +	if (ret) {
>>>> +		dev_err(&client->dev, "%s: failed to enable regulators\n",
>>>> +			__func__);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = clk_prepare_enable(imx219->xclk);
>>>> +	if (ret) {
>>>> +		dev_err(&client->dev, "%s: failed to enable clock\n",
>>>> +			__func__);
>>>> +		goto reg_off;
>>>> +	}
>>>> +
>>>> +	gpiod_set_value_cansleep(imx219->xclr_gpio, 1);
>>>> +	msleep(IMX219_XCLR_DELAY_MS);
>>>> +
>>>> +	return 0;
>>>> +reg_off:
>>>> +	regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int imx219_power_off(struct device *dev)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>> +	struct imx219 *imx219 = to_imx219(sd);
>>>> +
>>>> +	gpiod_set_value_cansleep(imx219->xclr_gpio, 0);
>>>> +	regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
>>>> +	clk_disable_unprepare(imx219->xclk);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int __maybe_unused imx219_suspend(struct device *dev)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>> +	struct imx219 *imx219 = to_imx219(sd);
>>>> +
>>>> +	if (imx219->streaming)
>>>> +		imx219_stop_streaming(imx219);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int __maybe_unused imx219_resume(struct device *dev)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>> +	struct imx219 *imx219 = to_imx219(sd);
>>>> +	int ret;
>>>> +
>>>> +	if (imx219->streaming) {
>>>> +		ret = imx219_start_streaming(imx219);
>>>> +		if (ret)
>>>> +			goto error;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +error:
>>>> +	imx219_stop_streaming(imx219);
>>>> +	imx219->streaming = 0;
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int imx219_get_regulators(struct imx219 *imx219)
>>>> +{
>>>> +	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>>>> +	int i;
>>>> +
>>>> +	for (i = 0; i < IMX219_NUM_SUPPLIES; i++)
>>>> +		imx219->supplies[i].supply = imx219_supply_name[i];
>>>> +
>>>> +	return devm_regulator_bulk_get(&client->dev,
>>>> +				       IMX219_NUM_SUPPLIES,
>>>> +				       imx219->supplies);
>>>> +}
>>>> +
>>>> +/* Verify chip ID */
>>>> +static int imx219_identify_module(struct imx219 *imx219)
>>>> +{
>>>> +	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>>>> +	int ret;
>>>> +	u32 val;
>>>> +
>>>> +	ret = imx219_power_on(imx219->dev);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = imx219_read_reg(imx219, IMX219_REG_CHIP_ID,
>>>> +			      IMX219_REG_VALUE_16BIT, &val);
>>>> +	if (ret) {
>>>> +		dev_err(&client->dev, "failed to read chip id %x\n",
>>>> +			IMX219_CHIP_ID);
>>>> +		goto power_off;
>>>> +	}
>>>> +
>>>> +	if (val != IMX219_CHIP_ID) {
>>>> +		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
>>>> +			IMX219_CHIP_ID, val);
>>>> +		ret = -EIO;
>>>> +	}
>>>> +
>>>
>>> I wonder if this is not a bit obscure: it's not obvious
>>> from a first read that the device is left powered on successful
>>> identification.
>>>
>>> Perhaps you can have:
>>>
>>>       return 0;
>>>
>>> And then goto err_power_off on the error paths.
>>> This way, it's clear that powering off is only
>>> to be done on error.
>>
>> OK. Makes sense. Will fix in v2.
>>
>>> OTOH, why do we need to leave the device powered on probe?
>>
>> Let me try what happens if I leave powering the sensor on and off
>> to dev_pm_ops. (Seems like it *should* work in theory, but maybe
>> there were some hidden problems.)
>> (Also I would only be able to check if the sensor works or not - can't
>> do the electrical signals or power consumption measurements etc.)
>>
>> Anyway, leaving the sensor powered on shouldn't hurt, as the sensor
>> is kept in lower power mode when it is not streaming (MIPI signals
>> are passive - the indication on that is the "clock-noncontinuous"
>> property in the DT bindings; also there is no code in the driver
>> to change that, then the imx219 sensor must always "turn off"
>> MIPI lines when it is not streaming - with the reg setting currently
>> used at least).
>>
> 
> Right, the sensor being in LP state is a good point. IMHO, it's
> totally fine is the sensor needs to be powered. It would be
> nice to have a nice comment, if only for resource tracking reasons.

I've tested this part of the driver, and the driver does power off the
sensor before leaving probe(). And afterwords it powers the sensor on during
streaming only. There is just the error path in probe() which needs to be fixed.
I'll also rearrange the code a little bit, and it should become more straightforward
and easier to follow.

> Thanks,
> Ezequiel

Thanks,
Andrey
