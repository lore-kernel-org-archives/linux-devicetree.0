From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH 0/4] IIO wrapper drivers, dpot-dac and envelope-detector
Date: Thu, 20 Oct 2016 16:53:45 +0200
Message-ID: <7472292a-a509-c791-4eff-5a5037ead837@axentia.se>
References: <1476955562-13673-1-git-send-email-peda@axentia.se>
 <9b8c0789-566d-67a3-b4f5-dbe4c69f6932@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b8c0789-566d-67a3-b4f5-dbe4c69f6932-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-20 14:55, Lars-Peter Clausen wrote:
> On 10/20/2016 11:25 AM, Peter Rosin wrote:
>> Also, is there some agreed-upon way to dig out the maximum value from
>> an iio channel? If so, "dpot-dac,max-ohms" can be eliminated from the
>> dt bindings, which would have been nice...
> 
> Yes, this is something we could really use. In a sense it exists for the
> devices with buffer-capable channels where there is the real_bits field
> which tells us the data width of the channel. But a dedicated mechanism for
> querying the maximum (and minimum) valid code seems like a useful feature.
> Not only for in-kernel clients, but also for userspace.

For the dpot I have, real_bits (if provided) would not be too great since
the maximum value is 256 (i.e. 257 possible wiper positions). I doesn't
feel like I'm the most qualified person to add these new min/max attributes
though, as I'm not familiar with most parts of the iio code. I'll happily
jump on board if they are somehow magically available, of course :-)

>> I'm also wondering if I'm somehow abusing the regulator? I only added
>> it to get rid of a "dpot-dac,max-voltage" thing from the dt bindings.
>> It feels right though, but maybe I should do more with it than check
>> its voltage? What?
> 
> Enable the regulator when it is in use?

Right, I didn't express myself all that clearly, I do in fact already
enable the regulator in ->probe and disable it in ->remove. Anything
else?

>> There are a couple of things to be said about the envelope detector,
>> one question is where it should live? I placed it in the adc directory,
>> but maybe it deserves an iio directory of its own? I'm also a bit
>> worried that the name is a wee bit too generic. But what is a good
>> name? I don't want it to be too long like dac-comp-envelope-detector
>> and something like dac-comp-env-det is just unreadable. Naming is
>> difficult... And suggestions?
> 
> Yeah, it is a bit tricky. It is a envelope detector built from discrete
> components, but of course there are many more ways to build one. If you have
> a codename for your platform you could use this for the DT compatible
> string, like 'vendor,foobar-envelope-detector'.

Good idea! Then the "envelope-detector,inverted" bool can go, and be
implied by the compatible string. If some way to rebind the irq trigger
is later discovered that can be added as a channel attr without
deprecating any dt bindings stuff. While at it, the other properties
("envelope-detector,dac-max" and "envelope-detector,comp-interval-ms")
could also be implied from the compatible string. Would that be better?
I think so.

But, the compatible string is one thing and the driver name is another.
"axentia,tse850-envelope-detector" doesn't seem like the best of driver
names...

Are there any existing examples of drivers for (generic) things built
with discrete components like this that could perhaps provide guidance?

>> Anyway, despite all the above questions and remarks, this works for
>> me. Please consider applying.
> 
> In general this series looks really good, good and clear implementation as
> well as documentation. A few minor bits here and there, but that is normal.

Thanks, appreciated!

Cheers,
Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
