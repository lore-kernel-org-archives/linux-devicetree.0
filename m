From: Tamizh chelvam <tamizhchelvam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCHv2 3/4] dt: bindings: add new dt entry for BTCOEX feature
 in qcom,ath10k.txt
Date: Wed, 23 Nov 2016 15:50:17 +0530
Message-ID: <df0313af8ab0ed1e7bddcfeca8429632@codeaurora.org>
References: <1479383064-25718-1-git-send-email-c_traja@qti.qualcomm.com>
 <1479383064-25718-4-git-send-email-c_traja@qti.qualcomm.com>
 <20161118144406.3se7gnckhcmwqytp@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161118144406.3se7gnckhcmwqytp@rob-hp-laptop>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: c_traja-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks for the comments.

On 2016-11-18 20:14, Rob Herring wrote:
> On Thu, Nov 17, 2016 at 05:14:23PM +0530, c_traja-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org 
> wrote:
>> From: Tamizh chelvam <tamizhchelvam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> 
>> There two things done in this patch.
>> 
>> 1) 'btcoex_support' flag for BTCOEX feature support by the hardware.
>> 2) 'wlan_btcoex_gpio' is used to fill wlan priority pin number for
>>    BTCOEX priority feature support.
>> 
>> Signed-off-by: Tamizh chelvam <tamizhchelvam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  .../bindings/net/wireless/qcom,ath10k.txt          |    4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 74d7f0a..08150e2d 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -46,6 +46,10 @@ Optional properties:
>>  				 hw versions.
>>  - qcom,ath10k-pre-calibration-data : pre calibration data as an 
>> array,
>>  				     the length can vary between hw versions.
>> +- btcoex_support  : should contain eithr "0" or "1" to indicate 
>> btcoex
>> +		    support by the hardware.
> 
> This is BT coexistence? Make this boolean and n

Yes, this is BT coexistence. And I didn't get what are you trying to say 
in this "Make this boolean and n"
> 
>> +- btcoex_gpio_pin :  btcoex gpio pin number for the device which
>> +		     supports BTCOEX.
> 
> This is a pin number on the chip, not any pin number Linux GPIO subsys
> cares about, right? Is there a connection to the host too, or this is
> internal between BT and WiFi?

This is internal between BT and wifi.
> 
> Do you really need 2 properties? Does supporting this feature require
> the GPIO? If so, then the first property is redundant.
> 
Target/driver can hard copy this gpio pin for some chipsets and there we 
will need btcoex_support flag to find the btcoex support.

> Needs vendor prefix and don't use '_'. Should be something like
> 'qcom,bt-coexist-gpio-pin'.
> 
Sure I'll update this and send in v3 patch
