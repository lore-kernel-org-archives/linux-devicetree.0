From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 3/6] dt: bindings: add bindings for msa memory region
Date: Mon, 23 Jul 2018 18:06:58 +0530
Message-ID: <5ba59b76dfcc8ba997ce7b0ea880329c@codeaurora.org>
References: <20180706090043.28363-1-govinds@codeaurora.org>
 <20180711152718.GA18470@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180711152718.GA18470@rob-hp-laptop>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, niklas.cassel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 2018-07-11 20:57, Rob Herring wrote:
> On Fri, Jul 06, 2018 at 02:30:43PM +0530, Govind Singh wrote:
>> Add device tree binding documentation details of msa
>> memory region for ath10k qmi client for SDM845/APQ8098
>> SoC into "qcom,ath10k.txt".
>> 
>> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  .../bindings/net/wireless/qcom,ath10k.txt           | 13 
>> +++++++++++++
>>  1 file changed, 13 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 7fd4e8ce4149..87489054aea5 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -57,6 +57,16 @@ Optional properties:
>>  - <supply-name>-supply: handle to the regulator device tree node
>>  			   optional "supply-name" is "vdd-0.8-cx-mx".
>> 
>> += SUBNODES:
>> +wcn3990-wifi node may contain one subnode, named "msa" representing
>> +the fixed msa memory regions used by the wifi firmware running in Q6.
>> +This sub-node must contain:
> 
> Why do you need a sub-node? Just add memory-region property.
> 
Fixed in v4 version.

Thanks,
Govind
