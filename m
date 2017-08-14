From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: watchdog: mediatek: add support for MediaTek
 MT7623 and MT7622 SoC
Date: Mon, 14 Aug 2017 13:17:21 +0200
Message-ID: <6f81355c-8071-1fc2-fe07-20dfef28e80e@gmail.com>
References: <b0058a0a9f948f17edf3c1a476665c715922ebc3.1501830388.git.sean.wang@mediatek.com>
 <20170810174343.7pejhh7wxkcaf3zj@rob-hp-laptop>
 <1502418991.19230.1.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502418991.19230.1.camel@mtkswgap22>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/11/2017 04:36 AM, Sean Wang wrote:
> On Thu, 2017-08-10 at 12:43 -0500, Rob Herring wrote:
>> On Fri, Aug 04, 2017 at 03:14:07PM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
>>> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>>
>>> This updates dt-binding documentation for MediaTek MT7622 and
>>> MT7623 SoC. For the both SoCs supported all rely on the fallback
>>> binding of the case with "mediatek,mt6589-wdt".
>>>
>>> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> ---
>>>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Hi, Rob
> 
> thanks a lot
> 
> can the patch go through your tree?
> 

 From the MAINTAINERS file:
WATCHDOG DEVICE DRIVERS
M:      Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
R:      Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
L:      linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
W:      http://www.linux-watchdog.org/
T:      git git://www.linux-watchdog.org/linux-watchdog.git
S:      Maintained
F:      Documentation/devicetree/bindings/watchdog/
F:      Documentation/watchdog/
F:      drivers/watchdog/
F:      include/linux/watchdog.h
F:      include/uapi/linux/watchdog.h

The best will be to resend and add the email addresses/lists

Regards,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
