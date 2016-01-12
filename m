From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/5] arm64: dts: apq8016-sbc: add regulators support
Date: Tue, 12 Jan 2016 14:30:34 +0000
Message-ID: <56950E0A.2000005@linaro.org>
References: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org> <1452606392-24614-1-git-send-email-srinivas.kandagatla@linaro.org> <7998607.BblzgPxGPW@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <7998607.BblzgPxGPW@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/01/16 13:59, Arnd Bergmann wrote:
> On Tuesday 12 January 2016 13:46:32 Srinivas Kandagatla wrote:
>>          };
>>
>> +       smd {
>> +               rpm {
>> +                       rpm-requests {
>> +                               pm8916-regulators {
>> +
>> +                                       vdd_l1_l2_l3-supply = <&pm8916_s3>;
>> +                                       vdd_l5-supply = <&pm8916_s3>;
>> +                                       vdd_l4_l5_l6-supply = <&pm8916_s4>;
>> +                                       vdd_l7-supply = <&pm8916_s4>;
>> +
>>
>
> If you're nested this deeply, you should consider using labels, e.g.
>
Labels are good and works for me.

Stephen/Andy are you ok to use labels for such deeply nested nodes in 
board dts?

> / {
>         ...
>
>         smd {
>                 rpm {
>                        rpm-requests {
>                                 regulators: pm8916-regulators {
>
> 				};
> 			};
> 		};
> 	};
>
> 	...
> };
>
>
> &regulators {
>          vdd_l1_l2_l3-supply = <&pm8916_s3>;
>          vdd_l5-supply = <&pm8916_s3>;
>          vdd_l4_l5_l6-supply = <&pm8916_s4>;
>          vdd_l7-supply = <&pm8916_s4>;
>
> 	s1 {
>                   regulator-min-microvolt = <375000>;
>                   regulator-max-microvolt = <1562000>;
> 	};
>
>          s3 {
> 	        regulator-min-microvolt = <375000>;
> 	        regulator-max-microvolt = <1562000>;
>          };
>
> 	...
> };
>
> btw, it seems odd to me that all those nodes under 'smd'
> have names but no addresses.
These regulators are identified by the node names, and have no addresses 
associated with it as control goes over SMD based IPC to the rpm.

https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt?id=refs/tags/next-20160112

--srini

>
> 	Arnd
>
