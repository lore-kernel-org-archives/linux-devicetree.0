From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH v3 6/8] iio: dpot-dac: DAC driver based on a digital
 potentiometer
Date: Sun, 30 Oct 2016 15:24:48 +0100
Message-ID: <765d8fd2-4753-d3c7-32e0-e6cec9b9002d@axentia.se>
References: <1477262381-7800-1-git-send-email-peda@axentia.se>
 <1477262381-7800-7-git-send-email-peda@axentia.se>
 <301ab064-cd90-d99d-a05a-8a50ba759c62@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <301ab064-cd90-d99d-a05a-8a50ba759c62-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-30 14:33, Jonathan Cameron wrote:
> On 23/10/16 23:39, Peter Rosin wrote:
>> It is assumed that the dpot is used as a voltage divider between the
>> current dpot wiper setting and the maximum resistance of the dpot. The
>> divided voltage is provided by a vref regulator.
>>
>>                   .------.
>>    .-----------.  |      |
>>    | vref      |--'    .---.
>>    | regulator |--.    |   |
>>    '-----------'  |    | d |
>>                   |    | p |
>>                   |    | o |  wiper
>>                   |    | t |<---------+
>>                   |    |   |
>>                   |    '---'       dac output voltage
>>                   |      |
>>                   '------+------------+
>>
>> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> Only a trivial suggestion to drop the devinfo about max ohms now it's
> exposed (effectively) via the dpot driver. (really minor though so don't bother
> respinning for that!)

*snip*

Right, I'm making that change locally so that it's not forgotten, and
feel free to squash that dropped line before pushing it out if you like,
in case there's no respin...

Cheers,
Peter


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
