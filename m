From: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] devicetree: ad5064: Added devicetree bindings documentation
Date: Wed, 12 Feb 2014 15:07:32 +0100
Message-ID: <52FB8024.1090402@analog.com>
References: <1392206518-1457-1-git-send-email-paul.cercueil@analog.com> <1392206518-1457-3-git-send-email-paul.cercueil@analog.com> <20140212121832.GF21992@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140212121832.GF21992-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/12/14 13:18, Mark Rutland wrote:
> On Wed, Feb 12, 2014 at 12:01:58PM +0000, Paul Cercueil wrote:
>> Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>   .../devicetree/bindings/iio/dac/ad5064.txt         |   49 ++++++++++++++++++++
>>   1 file changed, 49 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/dac/ad5064.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/dac/ad5064.txt b/Documentation/devicetree/bindings/iio/dac/ad5064.txt
>> new file mode 100644
>> index 0000000..e5997b0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/dac/ad5064.txt
>> @@ -0,0 +1,49 @@
>> +Analog Devices AD5064 DAC device driver
>
> It would be nice to have a short description here, with useful facts
> (e.g. this is an SPI device).
>
> Is there any public documentation? It might not need to go in the
> document, but having a link really helps with review.

Allright, I will add a short description. I didn't add a link to the 
documentation as it moves every once in a while...

>> +
>> +Required properties:
>> +	- compatible: Must be one of:
>> +		* "adi,ad5024"
>> +		* "adi,ad5025"
>> +		* "adi,ad5044"
>> +		* "adi,ad5045"
>> +		* "adi,ad5064"
>> +		* "adi,ad5064-1"
>> +		* "adi,ad5065"
>> +		* "adi,ad5628-1"
>> +		* "adi,ad5628-2"
>> +		* "adi,ad5648-1"
>> +		* "adi,ad5648-2"
>> +		* "adi,ad5666-1"
>> +		* "adi,ad5666-2"
>> +		* "adi,ad5668-1"
>> +		* "adi,ad5668-2"
>> +		* "adi,ad5668-3"
>
> How do these differ? Are these just different revisions of the same
> chip?
>
> Are particular strings expected to be used as fallbacks in the
> compatible list?

All of those chips are different, but are handled by the ad5064 driver. 
They differ in the number of channels available, in the presence of an 
internal vref and/or its voltage. Some of those use a shared vref, some 
others have a vref per channel. The only similar chips are the ad5668-2 
and ad5668-3.

>> +	- reg: SPI chip select number for the device
>> +	- spi-max-frequency: Max SPI frequency to use (< 30000000)
>> +	- vrefA-supply, vrefB-supply: phandles to external reference voltage
>> +	  supplies for channels 0 and 1 respectively.
>> +	  This property must be present for ad5024, ad5025, ad5044, ad5045,
>> +	  ad5064, ad5065.
>
> Does ad5064 also imply ad5604-1 here?
>
>> +	- vrefC-supply, vrefD-supply: phandles to external reference voltage
>> +	  supplies for channels 2 and 3 respectively.
>> +	  This property must be present for ad5024, ad5044, ad5064.
>
> Likewise.

The ad5064 and ad5064-1 chips are actually different; the first one has 
one vref per channel, the second one use a shared vref.

> These seem oddly named given the description. Are these named A B C D in
> the documentation? If not, vref-channel-X-supply would seem to be
> clearer.

They are named after the pin names on the datasheets: vrefA, vrefB, 
vrefC, vrefD.

> Why are these grouped in pairs rather than listed individually?

All the chips featuring separate vref per channel, have either 2 or 4 
channels, which means that some chips have only the vrefA/vrefB pins, 
while others have them all. These properties were grouped in pairs 
because the description and the list of supported chips are the same, 
but I can list them individually if it's preferred.

>> +
>> +Optional properties:
>> +	- adi,use-external-reference: If set, the external reference voltage
>> +	  supply is used. This should only be set if there is an external
>> +	  reference voltage connected to the vref or vref[A-D] pins.
>> +	  If the property is not set, the internal reference voltage supply
>> +	  is used if present, or an error is issued by the driver.
>
> When would you want to do this, and when would you want to use the
> internal reference? Could the driver not choose to do this based on
> whether a supply is listed in the dt?

Using or not the internal reference is up to the platform. But you make 
a valid point, it would be better for the driver to use the external 
reference if specified in the dt and revert to the internal one 
otherwise. I will fix that in the driver.

> Strip the part about the error, that's not a description of the device
> and not a matter for the binding.

Allright.

>> +	- vref-supply: phandle to the external reference voltage supply.
>> +	  This property can be used with ad5064-1, ad5628-1, ad5628-2, ad5648-1,
>> +	  ad5648-2, ad5666-1, ad5666-2, ad5668-1, ad5668-2, ad5668-3.
>
> Just to check, on some versions (e.g. ad5668-3), this can work without
> any supply listed at all, yes?

All of those chips except for ad5064-1 have an internal vref, which will 
be used if no external regulator is specified, so yes.

> Cheers,
> Mark.
>

Thanks for your comments!

Regards,
Paul
