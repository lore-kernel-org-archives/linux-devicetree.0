From: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: ath10k: fix node name and device
 type in qcom ath10k example
Date: Tue, 11 Dec 2018 11:26:57 +0530
Message-ID: <266a1bec89b88abe4637c33b080d85bb@codeaurora.org>
References: <1544466691-11821-1-git-send-email-bperumal@codeaurora.org>
 <1544466691-11821-2-git-send-email-bperumal@codeaurora.org>
 <20181210232523.GA14192@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20181210232523.GA14192@bogus>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-12-11 04:55, Rob Herring wrote:
> On Tue, Dec 11, 2018 at 12:01:29AM +0530, Bhagavathi Perumal S wrote:
>> In qcom,ath10k documentation, ath10k is used as node name in the 
>> example of
>> pci based device. Normally, node name shoud be class of device and not 
>> the model
> 
> s/shoud/should/
Thanks, Will correct typo error and send v4 patch.
> 
>> name, so fix it to node name "wifi". And remove the property 
>> device_type pci
>> since only pci bridges should have this property.
>> 
>> Signed-off-by: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 
>> +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 2196d1a..ef60f25 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -74,9 +74,8 @@ pci {
>>  		#address-cells = <3>;
>>  		device_type = "pci";
>> 
>> -		ath10k@0,0 {
>> +		wifi@0,0 {
>>  			reg = <0 0 0 0 0>;
>> -			device_type = "pci";
>>  			qcom,ath10k-calibration-data = [ 01 02 03 ... ];
>>  		};
>>  	};
>> --
>> 1.9.1
>> 
