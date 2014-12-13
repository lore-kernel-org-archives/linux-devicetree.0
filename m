From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] iio: add driver for the TI DAC8554
Date: Sat, 13 Dec 2014 12:32:16 +0100
Message-ID: <548C23C0.8000701@metafoo.de>
References: <1416858614-32265-1-git-send-email-nikolaus.schulz@avionic-design.de> <1416858614-32265-2-git-send-email-nikolaus.schulz@avionic-design.de> <5482EA33.7020305@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5482EA33.7020305-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/06/2014 12:36 PM, Hartmut Knaack wrote:
[...]
>> +static int dac8554_read_raw(struct iio_dev *indio_dev,
>> +			    struct iio_chan_spec const *chan,
>> +			    int *val,
>> +			    int *val2,
>> +			    long m)
> Commonly, m is called mask (like you do in _write_raw).

We should call it info in new driver. It used to be a mask, but that was a 
long long time ago.

[...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
