From: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4] iio: iadc: Qualcomm SPMI PMIC current ADC driver
Date: Sat, 01 Nov 2014 20:46:42 +0100
Message-ID: <545538A2.7080403@gmx.de>
References: <1413987213-22218-1-git-send-email-iivanov@mm-sol.com>	 <5453ED55.2000003@gmx.de> <1414859945.2207.1.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414859945.2207.1.camel-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ivan T. Ivanov schrieb am 01.11.2014 17:39:
> 
> On Fri, 2014-10-31 at 21:13 +0100, Hartmut Knaack wrote:
>> Ivan T. Ivanov schrieb am 22.10.2014 16:13:
>>> The current ADC is peripheral of Qualcomm SPMI PMIC chips. It has
>>> 16 bits resolution and register space inside PMIC accessible across
>>> SPMI bus.
>>>
>>> The driver registers itself through IIO interface.
>> Pretty much there, just one question I would like to double-check: 
>> The CPU of these chips is Little Endian, right?
> 
> Yes, it is Little Endian.
Cool.
> 
>> Annoyingly, you introduced a small typo in this revision, 
> 
> No it is not a typo. Calculation is really in nano Ohms.
Right, but the typo is, that you wrote "nono" instead of "nano".
> 
> Regards,
> Ivan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
