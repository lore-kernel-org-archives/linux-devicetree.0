From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH 0/4] IIO wrapper drivers, dpot-dac and envelope-detector
Date: Fri, 21 Oct 2016 10:24:24 +0200
Message-ID: <28861d1d-7f50-7ea2-f8cb-5a9d359f74c0@axentia.se>
References: <1476955562-13673-1-git-send-email-peda@axentia.se>
 <9b8c0789-566d-67a3-b4f5-dbe4c69f6932@metafoo.de>
 <8B9238AE-D53C-4A22-84CF-EC42FDA2DFB2@jic23.retrosnub.co.uk>
 <DB170A5C-B172-4B86-80D5-58FD53752ED4@jic23.retrosnub.co.uk>
 <ba941bcd-c542-b699-638f-3b3003e8af00@axentia.se>
 <736c146284d93633a4692b1102eaadaf@jic23.retrosnub.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <736c146284d93633a4692b1102eaadaf-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-21 09:17, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org wrote:
> On 20.10.2016 19:17, Peter Rosin wrote:
>> On 2016-10-20 19:37, Jonathan Cameron wrote:
>>> http://marc.info/?l=linux-iio&m=138469765309868&w=2 I think...
>>
>> Interesting, one issue with that is that it is all in real world
>> units, while I'd rather have the raw value.
> Um.. It's been a while, but the principle was (IIRC) that every
> _available would match the units fo the associated info mask element.
> Thus if you have a _raw element it would be in adc counts (most likely).
> 
> _input would be in relevant real world units, scale etc in the whatever
> units the value itself is in.

Ah, that was just me totally misreading the patch. I didn't realize
that the iio_format_value function is also used for raw values and
assumed it was all about real world units when that function was
used. Feel rather silly ATM...

>> So, I would need to
>> convert back to the raw value using the scale, which sounds boring
>> but doable. However, I wonder if calibration may also be involved
>> with that conversion back to raw for some channels? That sounds a
>> bit more driver specific and potentially troublesome...
> I've not had a chance to look at your code (only picked up on this as
> there was a fair length thread developing), but I wouldn't have thought 
> we'd
> need to deal with calibrations.   Might need them to move to real world
> units from raw but that's always the case anyway (unfortunately).

Right.

Cheers,
Peter
