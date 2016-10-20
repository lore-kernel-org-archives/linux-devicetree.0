From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH 0/4] IIO wrapper drivers, dpot-dac and envelope-detector
Date: Thu, 20 Oct 2016 20:17:03 +0200
Message-ID: <ba941bcd-c542-b699-638f-3b3003e8af00@axentia.se>
References: <1476955562-13673-1-git-send-email-peda@axentia.se>
 <9b8c0789-566d-67a3-b4f5-dbe4c69f6932@metafoo.de>
 <8B9238AE-D53C-4A22-84CF-EC42FDA2DFB2@jic23.retrosnub.co.uk>
 <DB170A5C-B172-4B86-80D5-58FD53752ED4@jic23.retrosnub.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DB170A5C-B172-4B86-80D5-58FD53752ED4-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-20 19:37, Jonathan Cameron wrote:
> On 20 October 2016 18:30:19 BST, Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org> wrote:
>> On 20 October 2016 13:55:12 BST, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
>>> On 10/20/2016 11:25 AM, Peter Rosin wrote:
>>>> Also, is there some agreed-upon way to dig out the maximum value from
>>>> an iio channel? If so, "dpot-dac,max-ohms" can be eliminated from the
>>>> dt bindings, which would have been nice...
>>>
>>> Yes, this is something we could really use. In a sense it exists for
>>> the
>>> devices with buffer-capable channels where there is the real_bits field
>>> which tells us the data width of the channel. But a dedicated mechanism
>>> for
>>> querying the maximum (and minimum) valid code seems like a useful
>>> feature.
>>> Not only for in-kernel clients, but also for userspace.
>>
>> This was something that was addressed by the rather ancient patch
>> series i posted that added 
>> an available call back which provided info on range and values for all
>> info mask elements.
>> Series got buried by there being a lot of precursors but quite a few of
>> those have merged since.
>>
>> Hmm Google won't let me find it on my phone. Was a while back now. Will
>> try to get on pc with
>> decent email archive later and dig out a reference.
> http://marc.info/?l=linux-iio&m=138469765309868&w=2 I think...

Interesting, one issue with that is that it is all in real world
units, while I'd rather have the raw value. So, I would need to
convert back to the raw value using the scale, which sounds boring
but doable. However, I wonder if calibration may also be involved
with that conversion back to raw for some channels? That sounds a
bit more driver specific and potentially troublesome...

Cheers,
Peter
