From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: phy-rockchip-inno-usb2: add companion
 grf quirk
Date: Fri, 11 Aug 2017 09:43:14 +0800
Message-ID: <553ed6db-9d5a-d453-92f1-677bc63fdb5b@rock-chips.com>
References: <1501747753-6983-1-git-send-email-frank.wang@rock-chips.com>
 <1501747753-6983-3-git-send-email-frank.wang@rock-chips.com>
 <20170810170508.pwf35mud4ffnrzzd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170810170508.pwf35mud4ffnrzzd@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 2017/8/11 1:05, Rob Herring wrote:
> On Thu, Aug 03, 2017 at 04:09:10PM +0800, Frank Wang wrote:
>> Add rockchip,usbgrf and rockchip,companion_grf_quirk to support
>> the registers of usb-phy that are distributed in grf and usbgrf
>> on some special Rockchip SoCs (e.g RV1108).
>>
>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
>> index 84d59b0..ddf868a 100644
>> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
>> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
>> @@ -18,6 +18,10 @@ Optional properties:
>>   		 usb-phy output 480m and xin24m.
>>   		 Refer to clk/clock-bindings.txt for generic clock
>>   		 consumer properties.
>> + - rockchip,usbgrf : phandle to the syscon managing the "usb general
>> +		 register files".
>> + - rockchip,companion_grf_quirk : when set driver will request
>> +		 "rockchip,usbgrf" phandle as one companion-grf.
> Why isn't presence of rockchip,usbgrf or being implied by an SoC
> specific compatible string enough?
>
> In any case, use '-' rather than '_'.

All right, thanks for your comments, I will fix it with matching SoC 
specific compatible string.


BR.
Frank

>>   
>>   Required nodes : a sub-node is required for each port the phy provides.
>>   		 The sub-node name is used to identify host or otg port,
>> -- 
>> 2.0.0
>>
>>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
