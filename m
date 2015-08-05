From: Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] MAX6675 IIO temperature driver
Date: Wed, 5 Aug 2015 11:33:25 +0300
Message-ID: <CAEnQRZCh7+z9=rvP9znwggzF2-xOSrrD=LeuW9wHMXdt47WtSw@mail.gmail.com>
References: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
	<897A4C3B-DF7E-4AEE-A117-00CCB510F4DD@jic23.retrosnub.co.uk>
	<20150804173417.GN15004@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150804173417.GN15004@beef>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>, Linux IIO List <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 4, 2015 at 8:34 PM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> On Tue, Aug 04, 2015 at 05:52:17PM +0100, Jonathan Cameron wrote:
>>
>>
>> On 3 August 2015 21:56:47 BST, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> >This series adds a driver for the MAX6675 SPI thermocouple converter.
>> >The device supports temperature measurements via type-K thermocouples
>> >and implements cold-junction compensation within the part. The
>> >datasheet
>> >can be found at http://datasheets.maximintegrated.com/en/ds/MAX6675.pdf
>> For a device like this where perhaps it's position wrt iio/hwmon boundary is unclear
>> I want to see an argument for why IIO makes more sense in the cover letter + cc
>>  at least the hwmon MAINTAINERS if not the list...
>
> Will do. Just to summarize here, the typical use case for this type of
> thermocouple converter involves sample rates that are relatively high
> compared to what the hwmon interface can support. The upcoming hrtimer
> trigger will match up well with this to support fine-grained
> periodic samples. I'll add this in the v2 cover latter.

Are we talking about this hrtimer trigger patches:

http://marc.info/?l=linux-iio&m=143109196107382&w=2

Right? I've been busy with some other things, but I hope to have a
final version by Sunday :).

thanks,
Daniel.
