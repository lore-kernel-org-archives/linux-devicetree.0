From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: DT: apq8064: Add SATA controller support.
Date: Tue, 30 Sep 2014 09:18:22 +0100
Message-ID: <542A674E.8040901@linaro.org>
References: <1411982044-7873-1-git-send-email-srinivas.kandagatla@linaro.org> <1411982134-8090-1-git-send-email-srinivas.kandagatla@linaro.org> <5429DB3D.5080701@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5429DB3D.5080701-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 29/09/14 23:20, Stephen Boyd wrote:
> On 09/29/14 02:15, Srinivas Kandagatla wrote:
>> @@ -396,6 +407,35 @@
>>   			usb-phy		= <&usb4_phy>;
>>   		};
>>
>> +		sata_phy0:sata-phy@1b400000{
>
> add some spaces here?
Will fix this in next version.
>
>> +			compatible	= "qcom,apq8064-sata-phy";
>> +			reg		= <0x1b400000 0x200>;
>> +			reg-names	= "phy_mem";
>> +			clocks		= <&gcc SATA_PHY_CFG_CLK>;
>> +			clock-names = "cfg";
>> +			#phy-cells = <0>;
>
> These two lost the pretty tabs.
>
Will fix this in next version.
>> +		};
>> +
>> +		sata0: sata@29000000 {
>> +			compatible	= "generic-ahci";
>> +			reg		= <0x29000000 0x180>;
>> +			interrupts	= <0 209 0>;
>
> Sorry I'm nitpicking but it annoys me. Either align it all or don't
> align it.
I Will fix this in next version.

thanks,
srini
>
>> +			clocks = <&gcc SFAB_SATA_S_H_CLK>, <&gcc SATA_H_CLK>,
>> +				 <&gcc SATA_A_CLK>, <&gcc SATA_RXOOB_CLK>,
>> +				 <&gcc SATA_PMALIVE_CLK>;
>> +
>> +			clock-names = "slave_iface", "iface",
>> +				      "bus", "rxoob",
>> +				      "core_pmalive";
>> +			assigned-clocks = <&gcc SATA_RXOOB_CLK>,
>> +						<&gcc SATA_PMALIVE_CLK>;
>> +			assigned-clock-rates = <100000000>, <100000000>;
>> +
>> +			phys  = <&sata_phy0>;
>> +			phy-names = "sata-phy";
>> +			target-supply = <&pm8921_s4>;
>> +		};
>> +
>>   		/* Temporary fixed regulator */
>>   		vsdcc_fixed: vsdcc-regulator {
>>   			compatible = "regulator-fixed";
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
