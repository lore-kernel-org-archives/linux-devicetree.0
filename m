From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: qcom: Add msm8974 CoreSight components
Date: Thu, 9 Feb 2017 14:59:51 +0200
Message-ID: <814b788c-ce2f-5b44-c49e-e4e211a4f926@linaro.org>
References: <20170203183628.28198-1-georgi.djakov@linaro.org>
 <20170206165238.GA11391@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170206165238.GA11391-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iivanov.xz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/06/2017 06:52 PM, Mathieu Poirier wrote:
> Hello Georgi,
>
> Looks good to me, just a cosmetic comment below...
>
> On Fri, Feb 03, 2017 at 08:36:28PM +0200, Georgi Djakov wrote:
>> From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Add initial set of CoreSight components found on Qualcomm
>> msm8974 and apq8074 based platforms, including the APQ8074
>> Dragonboard board.
>>
>> Signed-off-by: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/qcom-msm8974.dtsi | 280 +++++++++++++++++++++++++++++++++++-
>>  1 file changed, 276 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>> index 4b4c61e2ee35..ab766a36a461 100644
>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
[..]
>> +		replicator@fc31c000 {
>> +			compatible = "qcom,coresight-replicator1x", "arm,primecell";
>> +			reg = <0xfc31c000 0x1000>;
>> +
>> +			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
>> +			clock-names = "apb_pclk", "atclk";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					replicator_out0: endpoint {
>> +						remote-endpoint = <&etr_in>;
>> +					};
>> +				};
>> +				port@1 {
>> +					reg = <1>;
>> +					replicator_out1: endpoint {
>> +						remote-endpoint = <&tpiu_in>;
>> +					};
>> +				};
>> +				port@2 {
>> +					reg = <0>;
>> +					replicator_in: endpoint {
>> +						slave-mode;
>> +						remote-endpoint = <&etf_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		etf@fc307000 {
>> +			compatible = "arm,coresight-tmc", "arm,primecell";
>> +			reg = <0xfc307000 0x1000>;
>> +
>> +			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
>> +			clock-names = "apb_pclk", "atclk";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					etf_out: endpoint {
>> +						remote-endpoint = <&replicator_in>;
>> +					};
>> +				};
>> +				port@1 {
>> +					reg = <0>;
>> +					etf_in: endpoint {
>> +						slave-mode;
>> +						remote-endpoint = <&merger_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>
> For the replicator and ETF above, output ports are listed before input
> ports, while the rest of the components below do the opposite.  As such
> picturing the topology of the CS components is a little more difficult but has
> no ramification on functionality.  I would suggest revising that but either way:
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Ok, thanks! Will update it.

BR,
Georgi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
