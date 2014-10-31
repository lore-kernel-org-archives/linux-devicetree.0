From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] DT: iio: vadc: document dt binding
Date: Fri, 31 Oct 2014 16:40:28 +0200
Message-ID: <54539F5C.50308@mm-sol.com>
References: <1411563415-11933-1-git-send-email-svarbanov@mm-sol.com> <1411563415-11933-3-git-send-email-svarbanov@mm-sol.com> <20141013150039.GB16598@leverpostej> <543CEC7F.50208@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <543CEC7F.50208-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi,

> On 10/13/2014 06:00 PM, Mark Rutland wrote:
>> On Wed, Sep 24, 2014 at 01:56:55PM +0100, Stanimir Varbanov wrote:

>>> +- qcom,ratiometric:
>>> +    Usage: optional
>>> +    Value type: <empty>
>>> +    Definition: Channel calibration type. If this property is specified
>>> +            VADC will use the VDD reference(1.8V) and GND for channel
>>> +            calibration. If property is not found, channel will be
>>> +            calibrated with 625mV and 1.25V reference channels.
>>> +            Otherwise the absolute calibration will be used.
>>
>> Surely this should be part of the specifier?
>

This is per channel type of configuration. Clients didn't and
shouldn't care how calibration is done.

Regards,
Ivan
