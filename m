From: jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org
Subject: Re: [PATCH V3] iio: pressure: hp03: Add Hope RF HP03 sensor support
Date: Mon, 18 Apr 2016 14:57:04 +0100
Message-ID: <809d6d41963caff6c7f3fa26e2009dff@jic23.retrosnub.co.uk>
References: <1460321544-8619-1-git-send-email-marex@denx.de>
 <57129538.6010300@kernel.org> <5714E07B.4090902@denx.de>
 <1a6d907d4f0229c80eae5075139febbb@jic23.retrosnub.co.uk>
 <5714E78F.6020305@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5714E78F.6020305-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 18.04.2016 14:56, Marek Vasut wrote:
> On 04/18/2016 03:44 PM, jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org wrote:
>> On 18.04.2016 14:26, Marek Vasut wrote:
>>> On 04/16/2016 09:40 PM, Jonathan Cameron wrote:
>>>> On 10/04/16 21:52, Marek Vasut wrote:
>>>>> Add support for HopeRF pressure and temperature sensor.
>>>>> 
>>>>> This device uses two fixed I2C addresses, one for storing
>>>>> calibration coefficients and another for accessing the ADC.
>>>>> 
>>>>> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
>>>>> Cc: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> Sorry I didn't get to this earlier in the week.
>>>> 
>>>> Unfortunately the resulting scales don't match the standard ABI for
>>>> these
>>>> two channel types.
>>> 
>>> Ah, sorry for the inconvenience.
>>> 
>>>> Otherwise, looks good. I've cc'd the devicetree list and 
>>>> maintainers.
>>>> The binding is trivial I think, but always good to give people a
>>>> opportunity to comment.
>>>> 
>>>> Jonathan
>>>>> ---
>>>>> V2: - Expand the binding document with more details on the XCLR pin
>>>>>     - Switch from IIO_CHAN_INFO_PROCESSED to RAW + SCALE
>>>>>     - Add failpath into hp03_update_temp_pressure() for the case
>>>>>       when ADC readout fails. This correctly sets the XCLR pin back
>>>>>       to LO now.
>>>>>     - Add comment explaining the need for allocation of child 
>>>>> device
>>>>>       in hp03_probe().
>>>>> V3: - Fix indent in the DT binding documentation
>>>>>     - Report raw pressure and temperature unmodified
>>>> Good
>>>>>     - Report pressure scale to be 1 , since pressure is in Pa
>>>> Standard units for pressure (see 
>>>> Documentation/ABI/testing/sysfs-bus-iio
>>>> are KPa so it wants to report 0.001)
>>> 
>>> OK, got it.
>>> 
>>>>>     - Report temperature scale to be 0.01 , since temp is in 0.01C
>>>>> steps
>>>> Unfortunately the documented base unit for temp (originally from
>>>> hwmon before
>>>> we started going for SI units every time) are milli Celcius.  Thus
>>>> the value
>>>> reported * scale should end up in milli degrees Celcius. Hence if it
>>>> is in 0.01
>>>> steps the scale should be 0.1
>>> 
>>> Shouldn't this be 10 ? The value is in 0.01C steps , so the value has 
>>> to
>>> be multiplied by 10 to convert it into mC units.
>> err. yes I'm clearly wrong :)
> 
> Thanks for confirming :) V4 is coming.
Beware, I might not be any more correct today ;)
> 
> Best regards,
> Marek Vasut
