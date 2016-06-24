From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: magn: DT bindings for AK8974
Date: Fri, 24 Jun 2016 22:48:53 +0200
Message-ID: <CACRpkdbM9RPU3uLzTFfZWXSjqNk13fsi35nMEOnBoEhikuxOQA@mail.gmail.com>
References: <1466608276-10401-1-git-send-email-linus.walleij@linaro.org> <20160624171952.GA23588@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160624171952.GA23588@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samu Onkalo <samu.p.onkalo-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2016 at 7:19 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Jun 22, 2016 at 05:11:16PM +0200, Linus Walleij wrote:
>> This adds device tree bindings for the AK8974 magnetometer, similar
>> to those for the AK8975.
>
> Seems like they should be shared, but there don't appear to be any
> datasheets for 8974 to really tell. Really only matters if the
> programming models are similar.

I have schematics of the component mounted, so I know what the
pins are named. Apart from that only the opaque driver from Samu.
(Found his new mail and mailed him, also requested the datasheet
from AKM, no response so far.)

>> +- avdd-supply: regulator supply for the analog voltage
>> +  (see regulator/regulator.txt)
>> +- dvdd-supply: regulator supply for the digital voltage
>> +  (see regulator/regulator.txt)
>
> This is probably more correct than single vdd-supply for 8975 which in
> fact has 2 supplies.

Yes. But they did change the names. AK8974 is avdd and dvdd
whereas AK8975 has vdd (same as avdd) and vid (same as dvdd).
I have no idea why this arbitrary naming is happening :/

>> +- interrupts: data ready (DRDY) and interrupt (INT1) lines
>> +  from the chip, the DRDY interrupt must be placed first.
>> +  The interrupts can be triggered on rising or falling
>> +  edges alike.
>
> The ak8975 probably should be an interrupt instead of gpio, too...

Yes. Or well. "data ready" is usually used as interrupt but to the
circuit designers it's just a signal which tells when the state machine
has finished.

Yours,
Linus Walleij
