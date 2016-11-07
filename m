From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH v3 1/8] iio:core: add a callback to allow drivers to
 provide _available attributes
Date: Mon, 7 Nov 2016 12:57:43 +0100
Message-ID: <62f150ba-abc0-8e45-1355-8a61354ee3e1@axentia.se>
References: <1477262381-7800-1-git-send-email-peda@axentia.se>
 <1477262381-7800-2-git-send-email-peda@axentia.se>
 <CAEnQRZDgF-x6rNiS1Uv9Evdt1sVfUu9pMF98Z4=r-vKP52C1kA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEnQRZDgF-x6rNiS1Uv9Evdt1sVfUu9pMF98Z4=r-vKP52C1kA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2016-11-07 12:37, Daniel Baluta wrote:
> On Mon, Oct 24, 2016 at 1:39 AM, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org> wrote:
>> From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> A large number of attributes can only take a limited range of values.
>> Currently in IIO this is handled by directly registering additional
>> *_available attributes thus providing this information to userspace.
>>
>> It is desirable to provide this information via the core for much the same
>> reason this was done for the actual channel information attributes in the
>> first place.  If it isn't there, then it can only really be accessed from
>> userspace.  Other in kernel IIO consumers have no access to what valid
>> parameters are.
>>
>> Two forms are currently supported:
>> * list of values in one particular IIO_VAL_* format.
>>         e.g. 1.300000 1.500000 1.730000
>> * range specification with a step size:
>>         e.g. [1.000000 0.500000 2.500000]
>>         equivalent to 1.000000 1.5000000 2.000000 2.500000
> 
> Is there any driver using this format? :)

Yes, soon. Hopefully. See patch 3/8
iio: mcp4531: provide range of available raw values
https://patchwork.kernel.org/patch/9391283/

>>
>> An addition set of masks are used to allow different sharing rules for the
>> *_available attributes generated.
>>
>> This allows for example:
>>
>> in_accel_x_offset
>> in_accel_y_offset
>> in_accel_offset_available.
>>
>> We could have gone with having a specification for each and every
>> info_mask element but that would have meant changing the existing userspace
>> ABI.  This approach does not.
>>
>> Signed-off-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> [forward ported, added some docs and fixed buffer overflows /peda]
>> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> 
> The patch looks good to me at a first glance.

Thanks, may I add your acked-by if/when I respin?

Cheers,
Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
