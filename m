From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: mxs-lradc: Move binding document out of staging as
 well
Date: Sun, 17 Apr 2016 09:57:30 +0100
Message-ID: <57134FFA.1030603@kernel.org>
References: <1460293398-23654-1-git-send-email-harald@ccbib.org>
 <20160411194204.GA17762@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160411194204.GA17762@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Cc: Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/04/16 20:42, Rob Herring wrote:
> On Sun, Apr 10, 2016 at 01:03:18PM +0000, Harald Geyer wrote:
>> commit f836c45922446df872250a12dd08e48978aceb2f moved mxs-lradc driver
>> out of staging. However the binding document was left in the old place.
> 
> A move out of staging should probably imply a review. Though we don't 
> have clear rules around that for bindings.
Sorry, my bad.  We kind of forgot this even had bindings during the review.
It sat in staging a long time on the basis we ideally were going to split
the touchscreen and IIO bits round an mfd.  Eventually it became clear no
one was going to work on it so we agreed with Dmitry that it could go out
of staging as is. Original bindings were back in 2012 so before the whole
devicetree binding maintainership really got going (IIRC). 

Will make sure to insist on a device tree binding review opportunity at
least in future!   We'll have to keep what is here as there are doubtless
a number of device trees out there using it, but we can of course deprecate
them and add additional new bindings.

Jonathan
> 
>>
>> Signed-off-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
>> ---
>>  .../devicetree/bindings/iio/adc/mxs-lradc.txt      | 47 ++++++++++++++++++++++
>>  .../bindings/staging/iio/adc/mxs-lradc.txt         | 47 ----------------------
>>  2 files changed, 47 insertions(+), 47 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mxs-lradc.txt
>>  delete mode 100644 Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/mxs-lradc.txt b/Documentation/devicetree/bindings/iio/adc/mxs-lradc.txt
>> new file mode 100644
>> index 0000000..555fb11
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/mxs-lradc.txt
>> @@ -0,0 +1,47 @@
>> +* Freescale MXS LRADC device driver
>> +
>> +Required properties:
>> +- compatible: Should be "fsl,imx23-lradc" for i.MX23 SoC and "fsl,imx28-lradc"
>> +              for i.MX28 SoC
>> +- reg: Address and length of the register set for the device
>> +- interrupts: Should contain the LRADC interrupts
>> +
>> +Optional properties:
>> +- fsl,lradc-touchscreen-wires: Number of wires used to connect the touchscreen
>> +                               to LRADC. Valid value is either 4 or 5. If this
>> +                               property is not present, then the touchscreen is
>> +                               disabled. 5 wires is valid for i.MX28 SoC only.
> 
> Standard touchscreen property?
> 
>> +- fsl,ave-ctrl: number of samples per direction to calculate an average value.
>> +                Allowed value is 1 ... 32, default is 4
>> +- fsl,ave-delay: delay between consecutive samples. Allowed value is
>> +                 2 ... 2048. It is used if 'fsl,ave-ctrl' > 1, counts at
>> +                 2 kHz and its default is 2 (= 1 ms)
> 
> ditto.
> 
> If not, it should have units.
> 
>> +- fsl,settling: delay between plate switch to next sample. Allowed value is
>> +                1 ... 2047. It counts at 2 kHz and its default is
>> +                10 (= 5 ms)
> 
> ditto.
> 
>> +
>> +Example for i.MX23 SoC:
>> +
>> +	lradc@80050000 {
>> +		compatible = "fsl,imx23-lradc";
>> +		reg = <0x80050000 0x2000>;
>> +		interrupts = <36 37 38 39 40 41 42 43 44>;
>> +		status = "okay";
>> +		fsl,lradc-touchscreen-wires = <4>;
>> +		fsl,ave-ctrl = <4>;
>> +		fsl,ave-delay = <2>;
>> +		fsl,settling = <10>;
>> +	};
>> +
>> +Example for i.MX28 SoC:
>> +
>> +	lradc@80050000 {
>> +		compatible = "fsl,imx28-lradc";
>> +		reg = <0x80050000 0x2000>;
>> +		interrupts = <10 14 15 16 17 18 19 20 21 22 23 24 25>;
>> +		status = "okay";
>> +		fsl,lradc-touchscreen-wires = <5>;
>> +		fsl,ave-ctrl = <4>;
>> +		fsl,ave-delay = <2>;
>> +		fsl,settling = <10>;
>> +	};
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
