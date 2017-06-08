From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: mediatek: add bindings for MediaTek
 MT7622 SoC
Date: Thu, 8 Jun 2017 16:37:11 +0200
Message-ID: <dc04ea44-4f4c-a914-2f92-266b3d11eb54@gmail.com>
References: <cover.1496250798.git.sean.wang@mediatek.com>
 <1b9dd0df077a59aea5a15e3cb7775f80224b0b06.1496250798.git.sean.wang@mediatek.com>
 <20170607213028.xsbgwwjgbgghk3vg@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170607213028.xsbgwwjgbgghk3vg@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/06/17 23:30, Rob Herring wrote:
> On Thu, Jun 01, 2017 at 01:28:59AM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
>> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>
>> This adds dt-binding documentation for MediaTek MT7622 SoC
>> which currently only includes basic items such as ARM CPU,
>> MediaTek SYSIRQ and UART.
>>
>> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/arm/mediatek.txt                    | 4 ++++
>>   .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt      | 3 ++-
>>   Documentation/devicetree/bindings/serial/mtk-uart.txt                 | 1 +
>>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 

Pushed this one to v4.12-next/dts64

Thanks,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
