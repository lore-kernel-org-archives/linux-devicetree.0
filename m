From: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: Add sensor node to Juno dt
Date: Fri, 25 Sep 2015 15:37:33 +0100
Message-ID: <9hhd1x6bm4y.fsf@e105922-lin.cambridge.arm.com>
References: <1442335861-7282-1-git-send-email-punit.agrawal@arm.com>
	<1442335861-7282-6-git-send-email-punit.agrawal@arm.com>
	<20150924163658.GH2368@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150924163658.GH2368-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org> (Liviu
	Dudau's message of "Thu, 24 Sep 2015 17:36:58 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "robh+dt@kernel.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "edubezval@gmail.com" <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, "linux@roeck-us.net" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> writes:

> On Tue, Sep 15, 2015 at 05:51:01PM +0100, Punit Agrawal wrote:
>> The SCP firmware on Juno provides access to SoC sensors via the
>> SCPI. Add the sensor nodes to the device tree to enable this support.
>> 
>> Signed-off-by: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
>
> Acked-by: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>

Thanks Liviu!

>
>> Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/arm/juno-base.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
>> index c624208..dd5158e 100644
>> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
>> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
>> @@ -96,6 +96,11 @@
>>  				clock-output-names = "pxlclk0", "pxlclk1";
>>  			};
>>  		};
>> +
>> +		scpi_sensors0: sensors {
>> +			compatible = "arm,scpi-sensors";
>> +			#thermal-sensor-cells = <1>;
>> +		};
>>  	};
>>  
>>  	/include/ "juno-clocks.dtsi"
>> -- 
>> 2.5.1
>> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
