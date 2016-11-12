From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 8/8] iio: envelope-detector: ADC driver based on a DAC
 and a comparator
Date: Sat, 12 Nov 2016 17:29:04 +0000
Message-ID: <b3b5a1ff-aefd-2268-e5a7-acb515034d4a@kernel.org>
References: <1478606339-31253-1-git-send-email-peda@axentia.se>
 <1478606339-31253-9-git-send-email-peda@axentia.se>
 <alpine.DEB.2.20.1611081630450.3501@nanos>
 <d8237286-d2ff-3146-d718-f54d05b0101d@axentia.se>
 <alpine.DEB.2.20.1611081809320.3501@nanos>
 <1c104a31-6c66-9537-9b90-ede58c8e1a92@axentia.se>
 <alpine.DEB.2.20.1611082146560.3501@nanos>
 <ac908a97-77b8-046a-a0e9-74cc97f56c9b@axentia.se>
 <alpine.DEB.2.20.1611091605090.3501@nanos>
 <9fa01d3d-74ba-a048-52bf-4df959153354@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9fa01d3d-74ba-a048-52bf-4df959153354-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/11/16 11:37, Peter Rosin wrote:
> On 2016-11-09 16:06, Thomas Gleixner wrote:
>> On Wed, 9 Nov 2016, Peter Rosin wrote:
>>> On 2016-11-08 22:47, Thomas Gleixner wrote:
>>>> I don't think you need extra race handling with that, but I might be wrong
>>>> as usual.
>>>
>>> There's obviously no way to determine which of the timeout or the
>>> interrupt that happens first without some race handling, so I don't
>>> know what you mean? If the timeout happens first, there is also a
>>> need to handle late hits from the irq that might come in during the
>>> preparation for the next step in the binary search. It gets messy
>>> quickly compared to the simplicity of the current implementation.
>>
>> Gah, forgot about that timeout thingy. Fair enough.
>>
>> Feel free to add an 
>>
>> Acked-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> 
> Thanks for looking!
Applied to the togreg branch of iio.git and pushed out
as testing for the autobuilders to play with.

Excellent patch set.

Thanks,

Jonathan
> 
> Cheers,
> Peter
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
