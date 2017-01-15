From: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/2] iio: adc: Add Maxim MAX11100 driver
Date: Sun, 15 Jan 2017 15:13:37 +0100
Message-ID: <502b12a0-6011-c0eb-06b4-a40245d1d8db@jmondi.org>
References: <1484301038-16386-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484301038-16386-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jonathan,
    thanks for review,

On 13/01/2017 10:50, Jacopo Mondi wrote:
> Hello,
>    sending out v4 splitting device tree bindings documentation and actual ADC
> driver.
> No changes in driver code since v3.
>
> Same question for iio maintainers here:
> I would like to have clarified the measure unit returned by read_raw().
> Currently (value_raw * value_scale) return the ADC input value in mV.
> While testing the patch I've been questioned if that should not actually
> be in uV. This is easily achievable making _scale return a value in uV.
> I have found no mention of this in the ABI documentation as it speaks of
> generic voltage.
> Can we have a final word on this?

I see you have reviewed the driver without complaining for the 
read_raw() measure unit, so I assume this replies to the above question 
as well...

Thanks
    j


>
> Thanks Marek for having tested this.
>
> v1 -> v2:
>     - incorporated pmeerw's review comments
>     - retrieve vref from dts and use that to convert read_raw result
>       to mV
>     - add device tree bindings documentation
>
> v2 -> v3:
>     - add _SCALE bit of read_raw function and change _RAW bit accordingly
>     - call regulator_get_voltage when accessing the _SCALE part of read_raw
>       and not during probe
>     - add back remove function as regulator has to be disabled when detaching
>       the module. Do not use devm_ version of iio_register/unregister functions
>       anymore but do unregister in the remove.
>     - remove mutex as access to SPI bus is protected by SPI core. Thanks marex
>
> v3 -> v4:
>     - split device tree binding documentation and actual ADC driver
>     - add "reg" to the list of required properties and use a better
>       namimg for the adc device node in bindings documentation as suggested
>       by Geert.
>
> Jacopo Mondi (2):
>   iio: adc: Add Maxim MAX11100 driver
>   dt-bindings: iio: document MAX11100 ADC
>
>  .../devicetree/bindings/iio/adc/max11100.txt       |  19 +++
>  drivers/iio/adc/Kconfig                            |   9 +
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/iio/adc/max11100.c                         | 187 +++++++++++++++++++++
>  4 files changed, 216 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/max11100.txt
>  create mode 100644 drivers/iio/adc/max11100.c
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
