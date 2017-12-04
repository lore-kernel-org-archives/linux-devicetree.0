From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add optional nvmem MAC address bindings
 to ti,wlink-st
Date: Mon, 4 Dec 2017 13:09:43 +0300
Message-ID: <f50b5810-31ca-6ce8-ba1e-0484a3dd1d89@cogentembedded.com>
References: <1512357682-8911-1-git-send-email-david@lechnology.com>
 <1512357682-8911-2-git-send-email-david@lechnology.com>
 <2dfb7130-e229-7429-0f30-11d7df553fdf@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2dfb7130-e229-7429-0f30-11d7df553fdf-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/4/2017 12:54 PM, Sergei Shtylyov wrote:

>> This adds optional nvmem consumer properties to the ti,wlink-st device tree
>> bindings to allow specifying the Bluetooth MAC address.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/net/ti,wilink-st.txt | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/ti,wilink-st.txt 
>> b/Documentation/devicetree/bindings/net/ti,wilink-st.txt
>> index 1649c1f..24eb897 100644
>> --- a/Documentation/devicetree/bindings/net/ti,wilink-st.txt
>> +++ b/Documentation/devicetree/bindings/net/ti,wilink-st.txt
>> @@ -32,6 +32,8 @@ Optional properties:
>>      See ../clocks/clock-bindings.txt for details.
>>    - clock-names : Must include the following entry:
>>      "ext_clock" (External clock provided to the TI combo chip).
>> + - nvmem-cells: phandle to nvmem data cell that contains a MAC address
>> + - nvmem-cell-names: "mac-address" (required when nvmem-cells is specified)
>>   Example:
>> @@ -43,5 +45,7 @@ Example:
>>           enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
>>           clocks = <&clk32k_wl18xx>;
>>           clock-names = "ext_clock";
>> +        nvmem-cells: <&mac_address>
> 
>     s/:/ = /?
> 
>> +        nvmem-cell-names "mac-address"
> 
>     Where's =?

    And ;? :-)

[...]

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
