From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] iio: adc: add NXP LPC18xx ADC driver
Date: Sat, 12 Mar 2016 12:11:03 +0100
Message-ID: <CAGhQ9VyEywGgUv128oCSqaXUkVNniqEAi7qXbpSypZjCr-ixxQ@mail.gmail.com>
References: <1457262795-20282-1-git-send-email-manabian@gmail.com>
	<1457262795-20282-2-git-send-email-manabian@gmail.com>
	<56E3EFAC.8090906@kernel.org>
	<56E3F104.20105@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E3F104.20105-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12 March 2016 at 11:35, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On 12/03/16 10:30, Jonathan Cameron wrote:
>> On 06/03/16 11:13, Joachim Eastwood wrote:
>>> Add base support for the 10-bit SAR ADC peripheral found
>>> on NXP LPC18xx/43xx SoCs.
>>>
>>> This is a minimal driver that does not support burst mode,
>>> interrupts, DMA or hardware triggers.
>>>
>>> User manual with register description can be found on:
>>> LPC18xx: www.nxp.com/documents/user_manual/UM10430.pdf
>>> LPC43xx: www.nxp.com/documents/user_manual/UM10503.pdf
>>>
>>> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Applied to the togreg branch of iio.git - initially pushed out as testing
>> for the autobuilders to play with it.
> Actually I've backed this out.  Picked up on a few things lookint
> at the DAC driver that apply here too.
>
> Clearly half asleep this morning!
>
> Sorry,
>
> Jonathan
>>
>> Thanks,
>>
>> Jonathan
>>> ---
>>>  drivers/iio/adc/Kconfig       |  10 ++
>>>  drivers/iio/adc/Makefile      |   1 +
>>>  drivers/iio/adc/lpc18xx_adc.c | 228 ++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 239 insertions(+)
>>>  create mode 100644 drivers/iio/adc/lpc18xx_adc.c

>>> +static int lpc18xx_adc_read_raw(struct iio_dev *indio_dev,
>>> +                            struct iio_chan_spec const *chan,
>>> +                            int *val, int *val2, long mask)
>>> +{
>>> +    struct lpc18xx_adc *adc = iio_priv(indio_dev);
>>> +
>>> +    switch (mask) {
>>> +    case IIO_CHAN_INFO_RAW:
> Please use a local lock to protect channels.  The mlock is specifically
> for use in protecting against moving in and out of buffered mode for
> drivers in which individual reads will break buffered capture.

okey, got it. I'll send out a new version later today. I'll add the
lock to the dac driver as well.

Does this mean that if buffered mode support is added to the driver
I'll have to change the lock again?


regards,
Joachim Eastwood
