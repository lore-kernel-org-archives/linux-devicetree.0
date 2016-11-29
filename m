From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] iio: misc: add a generic regulator driver
Date: Tue, 29 Nov 2016 16:35:00 +0100
Message-ID: <CAMpxmJWDWk-mXUHHGEKm-VVwzqEGLDQjc274Xq+Qwc2eN=YbsQ@mail.gmail.com>
References: <1480432969-20913-1-git-send-email-bgolaszewski@baylibre.com> <44cce3d5-f65e-1a35-20a4-5eb9fda42312@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <44cce3d5-f65e-1a35-20a4-5eb9fda42312-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-11-29 16:30 GMT+01:00 Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>:
> On 11/29/2016 04:22 PM, Bartosz Golaszewski wrote:
> [...]
>> diff --git a/Documentation/devicetree/bindings/iio/misc/iio-regulator.txt b/Documentation/devicetree/bindings/iio/misc/iio-regulator.txt
>> new file mode 100644
>> index 0000000..147458f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/misc/iio-regulator.txt
>> @@ -0,0 +1,18 @@
>> +Industrial IO regulator device driver
>> +-------------------------------------
>> +
>> +This document describes the bindings for the iio-regulator - a dummy device
>> +driver representing a physical regulator within the iio framework.
>
> No bindings for drivers, only for hardware. So this wont work.
>

What about exporting regulator attributes analogous to the one in this
patch from the iio-core when a *-supply property is specified for a
node?

Thanks,
Bartosz
