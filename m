From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/6] ARM: dts: ifc6410: Add pwrseq support for WLAN
Date: Thu, 03 Sep 2015 16:45:53 +0100
Message-ID: <55E86B31.3010604@linaro.org>
References: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org> <1439903212-19931-1-git-send-email-srinivas.kandagatla@linaro.org> <55DCDF19.4070901@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <55DCDF19.4070901@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: agross@codeaurora.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 25/08/15 22:33, Stephen Boyd wrote:
> On 08/18/2015 06:06 AM, Srinivas Kandagatla wrote:
>> @@ -10,6 +11,20 @@
>>           serial1 = &gsbi6_serial;
>>       };
>> +    pwrseq {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>
> Why do we need any of these three properties?
>
Yep, you are right I will remove it and give it a try.

>> +        compatible = "simple-bus";
>> +
>> +        sdcc4_pwrseq: sdcc4_pwrseq {
>> +            pinctrl-names = "default";
>> +            pinctrl-0 = <&wlan_default_gpios>;
>> +            compatible = "mmc-pwrseq-simple";
>> +            reset-gpios = <&pm8921_gpio 43 GPIO_ACTIVE_LOW>;
>
> Especially because this node doesn't have a reg property.
>
