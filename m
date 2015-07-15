From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: vf-colibri: Add property for minimum
 sample time
Date: Wed, 15 Jul 2015 15:02:35 +0200
Message-ID: <c84f141e3e222a48b6adf52e686df7e9@agner.ch>
References: <cover.1436880513.git.maitysanchayan@gmail.com>
 <20e2cfad3fbb1a45332e9936ea493ddc8bfaf51d.1436880513.git.maitysanchayan@gmail.com>
 <20150715015725.GK4119@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150715015725.GK4119@tiger>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-07-15 03:57, Shawn Guo wrote:
> On Tue, Jul 14, 2015 at 07:23:23PM +0530, Sanchayan Maity wrote:
>> Add a device tree property which allows to specify the minimum sample
>> time which can be used to calculate the actual ADC cycles required
>> depending on the hardware.
>>
>> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/vf-colibri.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
>> index ab10d2e..59f5deb 100644
>> --- a/arch/arm/boot/dts/vf-colibri.dtsi
>> +++ b/arch/arm/boot/dts/vf-colibri.dtsi
>> @@ -16,10 +16,12 @@
>>  };
>>
>>  &adc0 {
>> +	min-sample-time = <1000>;
>>  	status = "okay";
>>  };
>>
>>  &adc1 {
>> +	min-sample-time = <1000>;
> 
> Since this is the default value anyway, we can just save the patch,
> right?

I thought it would be nice to be explicit here and define this value
which we verified internally.

On the other hand, we did not derived the minimum value from the DS
(using the capacity/resistance of the actual analog source connected) to
maximize the sampling frequency, hence I'm also ok with not explicitly
defining a value.

--
Stefan
