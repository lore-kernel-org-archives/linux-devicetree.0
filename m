From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: DT: apq8064: add rpm support
Date: Tue, 30 Sep 2014 08:49:31 +0100
Message-ID: <542A608B.5010408@linaro.org>
References: <1411982044-7873-1-git-send-email-srinivas.kandagatla@linaro.org> <1411982092-7922-1-git-send-email-srinivas.kandagatla@linaro.org> <20140930051138.GH28481@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140930051138.GH28481-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 30/09/14 06:11, Bjorn Andersson wrote:

>>
>> +		apcs: syscon@2011000 {
>> +			compatible = "syscon";
>> +			reg = <0x2011000 0x1000>;
>> +		};
>> +
>> +		rpm@108000 {
>> +			compatible	= "qcom,rpm-apq8064";
>> +			reg		= <0x108000 0x1000>;
>> +			qcom,ipc = <&apcs 0x8 2>;
>
> I don't like your indentation, but please stick with one way of doing it :)
>
I agree, Will fix this in next version.
>> +
>> +			interrupts	= <0 19 0>, <0 21 0>, <0 22 0>;
>> +			interrupt-names = "ack", "err", "wakeup";
>> +
>> +			#address-cells	= <1>;
>> +			#size-cells	= <0>;
>> +
>
> This part looks good.
>
> But how about adding all the regulators here as well?
Yes we can add for the sake of completeness but w.r.t testing only some 
of them will be tested
> Like:
>
>                          pm8921_l5: pm8921-l5 {
> 				compatible = "qcom,rpm-pm8921-pldo";
> 				reg = <QCOM_RPM_PM8921_LDO5>;
> 			};
>
Adding nodes like this should be trival.
> 			...
>
> That way we can update the references from this file (while still allowing the
> dts to override it if needed). I'm not sure if we should add some sane defaults
> or just completely deferr specifying the voltage ranges to the dts. The benefit
> of the latter is that the regulators not configured by the dts author will not
> be accessible.
>
> But simply listing all the nodes here would be nice and I dont see much reason
> to postpone this work.
Ok.. will be done in next version.


--srini
>
>> +		};
>> +
>>   		/* Temporary fixed regulator */
>>   		vsdcc_fixed: vsdcc-regulator {
>>   			compatible = "regulator-fixed";
>
> Regards,
> Bjorn
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
