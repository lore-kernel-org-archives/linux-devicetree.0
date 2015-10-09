From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Add msm8916 I2C nodes.
Date: Fri, 09 Oct 2015 09:42:51 +0100
Message-ID: <56177E0B.1050908@linaro.org>
References: <1444303124-32402-1-git-send-email-srinivas.kandagatla@linaro.org> <1444303168-32490-1-git-send-email-srinivas.kandagatla@linaro.org> <5616B353.9000207@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5616B353.9000207-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/10/15 19:17, Stephen Boyd wrote:
> On 10/08/2015 04:19 AM, Srinivas Kandagatla wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> index 85f7bee..d49ac37 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>> @@ -233,6 +233,22 @@
>>   			status = "disabled";
>>   		};
>>
>> +		/* BLSP1 QUP2 */
>
> This comment is useless.

Absolutely.. :-)
will fix it in next version.

--srini
>
>> +		blsp_i2c2: i2c@78b6000 {
>> +			compatible = "qcom,i2c-qup-v2.2.1";
>> +			reg = <0x78b6000 0x1000>;
>> +			interrupts = <GIC_SPI 96 0>;
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
