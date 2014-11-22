From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] iio: vadc: Qualcomm SPMI PMIC voltage ADC driver
Date: Sat, 22 Nov 2014 11:55:19 +0000
Message-ID: <547079A7.2040502@kernel.org>
References: <1415028270-25860-1-git-send-email-iivanov@mm-sol.com>			 <1415028270-25860-3-git-send-email-iivanov@mm-sol.com>			 <54612A0D.7020308@gmx.de> <1415694109.22935.13.camel@mm-sol.com>		 <54629026.3080002@gmx.de> <1415782511.4820.2.camel@mm-sol.com>	 <546A72E2.9060401@gmx.de> <1416299013.30131.4.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416299013.30131.4.camel-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 18/11/14 08:23, Ivan T. Ivanov wrote:
> 
> On Mon, 2014-11-17 at 23:12 +0100, Hartmut Knaack wrote:
>> Ivan T. Ivanov schrieb am 12.11.2014 09:55:
>>> On Tue, 2014-11-11 at 23:39 +0100, Hartmut Knaack wrote:
>>>> Ivan T. Ivanov schrieb am 11.11.2014 09:21:
>>>>> Hi Hartmut,
>>>>>
>>>>> On Mon, 2014-11-10 at 22:11 +0100, Hartmut Knaack wrote:
>>>>>> Ivan T. Ivanov schrieb am 03.11.2014 16:24:
>>>>>>> From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>>>>>>>
>>>>>>> The voltage ADC is peripheral of Qualcomm SPMI PMIC chips. It has
>>>>>>> 15 bits resolution and register space inside PMIC accessible across
>>>>>>> SPMI bus.
>>>>>>>
>>>>>>> The vadc driver registers itself through IIO interface.
>>>>>> Reviewing again, I got the feeling that due to the complexity of adc reads (writing to
>>>>>> register
>>>>>> to start conversion, waiting a decent time for the conversion to complete, reading the
>>>>>> result),
>>>>>> it would be beneficial to use a mutex in vadc_read_raw or its depending functions.
>>>>>
>>>>> Hm, yes, but there is such a nice info_exist_lock :-) in core functions,
>>>>> which in practice serve the same purpose.
>>>> I seem to miss that. Please point me in the right direction.
>>>
>>> I am referring to info_exist_lock mutex part of struct iio_dev.
>>> It protects all operations inkern.c, no?
>>>
>> Good point, thanks for helping me there.
> 
> I was wondering, is there a plan to improve this part of the code? 
No one is working on it that I know of.  All patches welcome!
> I mean to remove per device lock and use something like try_module_get(),
> when clients are acquiring reference to iio channel? 
That might indeed provide a more elegant solution...
(the things I don't know exist never fail to surprise me!)
> 
>>>>>>> +
>>>>>>> +       ret = of_property_read_u32(node, "reg", &res);
>>>>>> For u16, there would be of_property_read_u16().
>>>>>>> +       if (ret < 0)
>>>>>>> +       return -ENODEV;
>>>>>> Just return ret here?
>>>>>
>>>>> I am usually trying to follow these recommendations[1]. In practice driver
>>>>> core cares only for EPROBE_DEFER, ENODEV and ENXIO, while of_property_read_u32()
>>>>> can return ENODATA and EOVERFLOW, which did't not make sense for the core.
>>>> Please point me in the right direction on this one, too. It is pretty common to pass error 
>>>> codes
>>>> up, as it is also mentioned in [1].
>>>
>>> Yes, I know that is common to just pass error codes up, but in this case it did't
>>> make too much sense, I think. Also take a look at realy_probe() and line 343.
>> This doesn't convince me. Actually, within the probe_failed part, it just doesn't care about 
>> ENODEV and ENXIO as long as debug messages are disabled (which apart from some developers, is 
>> default for the vast majority of devices). For all other error codes, it will at least print an 
>> info or warning about what's going wrong (and that can be a lot of help for debugging).
> 
> Well, if you insist... will change it.
> 
> Thanks, 
> Ivan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
