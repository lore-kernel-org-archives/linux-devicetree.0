From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V3] extcon: palmas: Option to disable ID/VBUS detection
 based on platform
Date: Thu, 11 Jul 2013 08:38:11 +0530
Message-ID: <51DE219B.7000109@nvidia.com>
References: <1373448546-7531-1-git-send-email-ldewangan@nvidia.com> <51DE1B99.6090403@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51DE1B99.6090403@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob@landley.net" <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kishon@ti.com" <kishon@ti.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

On Thursday 11 July 2013 08:12 AM, Chanwoo Choi wrote:
> Hi Laxman,
>
>>   static int palmas_usb_probe(struct platform_device *pdev)
>> @@ -137,20 +140,26 @@ static int palmas_usb_probe(struct platform_device *pdev)
>>   	struct palmas_usb *palmas_usb;
>>   	int status;
>>   
>> -	if (node && !pdata) {
>> -		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>> -
>> -		if (!pdata)
>> -			return -ENOMEM;
>> +	palmas_usb = devm_kzalloc(&pdev->dev, sizeof(*palmas_usb), GFP_KERNEL);
>> +	if (!palmas_usb)
>> +		return -ENOMEM;
>>   
>> -		pdata->wakeup = of_property_read_bool(node, "ti,wakeup");
>> +	if (node && !pdata) {
>> +		palmas_usb->wakeup = of_property_read_bool(node, "ti,wakeup");
>> +		palmas_usb->enable_id_detection = of_property_read_bool(node,
>> +						"ti,enable-id-detection");
>> +		palmas_usb->enable_vbus_detection = of_property_read_bool(node,
>> +						"ti,enable-vbus-detection");
>> +	} else if (pdata) {
>> +		palmas_usb->wakeup = pdata->wakeup;
>> +		palmas_usb->enable_id_detection = true;
>> +		palmas_usb->enable_vbus_detection = true;
>>   	} else if (!pdata) {
>> -		return -EINVAL;
>> +		palmas_usb->wakeup = true;
>> +		palmas_usb->enable_id_detection = true;
>> +		palmas_usb->enable_vbus_detection = true;
>>   	}
> I think we could modify it as following patch to remove duplicate line.
> If you agree about below modification, I will apply your patch with following patch.
>
I am fine with this and this looks simple and straight.

I have seen some patches/discussion from TI to remove the platform data 
support at all and hence removing from here in future will be very simple.



