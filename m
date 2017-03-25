From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: adc: meson-saradc: add Meson8b SoC compatibility
Date: Sat, 25 Mar 2017 18:31:17 +0000
Message-ID: <c0151b73-2939-179b-0dd3-1fc9e9877c2d@kernel.org>
References: <20170325162938.28659-1-martin.blumenstingl@googlemail.com>
 <20170325162938.28659-3-martin.blumenstingl@googlemail.com>
 <231f1fef-e947-3461-2e5b-99d80abfa73a@kernel.org>
 <CAFBinCDVLZdBEX=UnGKFCkRF02YYx4hoRw54+AcwAku9zGjvaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCDVLZdBEX=UnGKFCkRF02YYx4hoRw54+AcwAku9zGjvaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 25/03/17 18:28, Martin Blumenstingl wrote:
> On Sat, Mar 25, 2017 at 7:13 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On 25/03/17 16:29, Martin Blumenstingl wrote:
>>> Meson GX SoCs however use some magic bits to prevent simultaneous (=
>>> conflicting, because only consumer should use the FIFO buffer with the
>>> ADC results) usage by the Linux kernel and the bootloader (the BL30
>>> bootloader uses the SAR ADC to read the CPU temperature).
>>> This patch changes guards all BL30 functionality so it is skipped on
>>> SoCs which don't have it. Since the hardware itself doesn't know whether
>>> BL30 is available the internal meson_sar_adc_data is extended so this
>>> information can be provided per of_device_id.data inside the driver.
>>>
>>> Additionally the clocks "adc_clk" and "adc_sel" are not provided by the
>>> clock-controller itself. "adc_sel" is not available at all. "adc_clk"
>>> is provided by the SAR ADC IP block itself on Meson8b (and earlier).
>>> This is already supported by the meson_saradc driver.
>>>
>>> Finally a new of_device_id for the Meson8b SoC is added so it can be
>>> wired up in the corresponding DT.
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> Looks sensible to me. Just fix those bits from Peter and we'll let it sit
>> a few days on the list to see if anyone else wants to chip in.
> OK, we'll have to wait for one of the DT-maintainers ACK (on the other
> patch) anyways, so I'll re-spin this in a week or so and fix
> everything that has come up until then
There is some flexibility in 'trivial' dt bindings such as this so as
not to waste their time.  But we should allow them the opportunity before
applying it anyway ;)

Jonathan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
