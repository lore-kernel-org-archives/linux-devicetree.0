From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 3/4] dt: bindings: add bindings for wifi iommu node
Date: Tue, 25 Sep 2018 17:39:59 +0530
Message-ID: <74c8e0f9eb793720e3dff4e3cff382b5@codeaurora.org>
References: <20180921090907.25937-1-govinds@codeaurora.org>
 <20180921090907.25937-4-govinds@codeaurora.org>
 <5baa1b0b.1c69fb81.79d38.4171@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5baa1b0b.1c69fb81.79d38.4171-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-09-25 04:23, Rob Herring wrote:
> On Fri, Sep 21, 2018 at 02:39:06PM +0530, Govind Singh wrote:
>> WCN3990 wifi module can optionally make use of the IOMMU.
> 
> Can the other compatibles use IOMMU too?
> 

No, only wcn3990 can optionally use IOMMU.

>> Add binding documentation for phandle to the IOMMU and
>> the stream id of wifi iommu block.
>> 
>> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt         | 5 
>> +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 22dea7d83ee8..07e58008c665 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -59,6 +59,10 @@ Optional properties:
>>  - <supply-name>-supply: handle to the regulator device tree node
>>  			   optional "supply-name" are "vdd-0.8-cx-mx",
>>  			   "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
>> +- iommus:
>> +	Usage: optional
>> +	Value type: <prop-encoded-array>
>> +	Definition: A list of phandle and IOMMU specifier pairs.
>> 
>>  Example (to supply the calibration data alone):
>> 
>> @@ -157,4 +161,5 @@ wifi@18000000 {
>>  		vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
>>  		vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
>>  		vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>> +		iommus = <&apps_smmu 0x0040 0x1>;
>>  };
>> --
>> 2.17.0
>> 

BR,
Govind
