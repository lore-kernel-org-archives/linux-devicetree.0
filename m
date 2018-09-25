From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/4] dt: bindings: add missing dt properties for WCN3990
 wifi node
Date: Tue, 25 Sep 2018 17:38:35 +0530
Message-ID: <f4785e79ccea53e0b696bdaaf2aa9ffb@codeaurora.org>
References: <20180921090907.25937-1-govinds@codeaurora.org>
 <20180921090907.25937-2-govinds@codeaurora.org>
 <5baa1b0a.1c69fb81.c0b19.4038@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5baa1b0a.1c69fb81.c0b19.4038-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 2018-09-25 04:21, Rob Herring wrote:
> On Fri, Sep 21, 2018 at 02:39:04PM +0530, Govind Singh wrote:
>> Add missing optional properties in WCN3990 wifi node.
>> 
>> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  .../bindings/net/wireless/qcom,ath10k.txt     | 22 
>> +++++++++++++------
>>  1 file changed, 15 insertions(+), 7 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 7fd4e8ce4149..22dea7d83ee8 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -37,12 +37,14 @@ Optional properties:
>>  - clocks: List of clock specifiers, must contain an entry for each 
>> required
>>            entry in clock-names.
>>  - clock-names: Should contain the clock names "wifi_wcss_cmd", 
>> "wifi_wcss_ref",
>> -               "wifi_wcss_rtc".
>> -- interrupts: List of interrupt lines. Must contain an entry
>> -	      for each entry in the interrupt-names property.
>> +               "wifi_wcss_rtc", "cxo_ref_clk_pin", 
>> "smmu_aggre2_noc_clk".
>> +- interrupts: List of interrupt lines. Must contain interrupt-names 
>> property
>> +	      per entry for "qcom,ath10k", "qcom,ipq4019-wifi" compatible
>> +	      targets.
> 
> It would be clearer to list how many interrupts for each set of
> compatibles.
> 

Sure, I will address this in next revision.

>>  - interrupt-names: Must include the entries for MSI interrupt
>>  		   names ("msi0" to "msi15") and legacy interrupt
>> -		   name ("legacy"),
>> +		   name ("legacy") for "qcom,ath10k", "qcom,ipq4019-wifi"
>> +		   compatible targets.
> 
> So no legacy interrupt for wcn3990?
> 

Yes, no legacy interrupt for wcn3990.

>>  - qcom,msi_addr: MSI interrupt address.
>>  - qcom,msi_base: Base value to add before writing MSI data into
>>  		MSI address register.
>> @@ -55,7 +57,8 @@ Optional properties:
>>  - qcom,ath10k-pre-calibration-data : pre calibration data as an 
>> array,
>>  				     the length can vary between hw versions.
>>  - <supply-name>-supply: handle to the regulator device tree node
>> -			   optional "supply-name" is "vdd-0.8-cx-mx".
>> +			   optional "supply-name" are "vdd-0.8-cx-mx",
>> +			   "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
>> 
>>  Example (to supply the calibration data alone):
>> 
>> @@ -133,8 +136,10 @@ wifi@18000000 {
>>  		compatible = "qcom,wcn3990-wifi";
>>  		reg = <0x18800000 0x800000>;
>>  		reg-names = "membase";
>> -		clocks = <&clock_gcc clk_aggre2_noc_clk>;
>> -		clock-names = "smmu_aggre2_noc_clk"
>> +		clocks = <&clock_gcc clk_aggre2_noc_clk>,
>> +			 <&clock_gcc clk_rf_clk2_pin>;
>> +		clock-names = "smmu_aggre2_noc_clk",
>> +			      "cxo_ref_clk_pin";
> 
> The binding now says there should be 5 clocks...
> 

Only 2 clocks are applicable for wcn3990. I will list no of clocks for 
each set of compatible for more clarity.

>>  		interrupts =
>>  			   <0 130 0 /* CE0 */ >,
>>  			   <0 131 0 /* CE1 */ >,
>> @@ -149,4 +154,7 @@ wifi@18000000 {
>>  			   <0 140 0 /* CE10 */ >,
>>  			   <0 141 0 /* CE11 */ >;
>>  		vdd-0.8-cx-mx-supply = <&pm8998_l5>;
>> +		vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
>> +		vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
>> +		vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>>  };
>> --
>> 2.17.0
>> 

Thanks,
Govind
