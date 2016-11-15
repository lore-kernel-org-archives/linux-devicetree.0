From: wlf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] phy: rockchip-inno-usb2: correct clk_ops callback
Date: Tue, 15 Nov 2016 11:22:30 +0800
Message-ID: <ee7f7cd7-cd77-dfa9-5075-3cc08b1cd79e@rock-chips.com>
References: <1479106911-16049-1-git-send-email-wulf@rock-chips.com>
 <1479106911-16049-2-git-send-email-wulf@rock-chips.com>
 <CAD=FV=W36tdw3LqPq3tp58U4trYX6n=qaotMTsP6tm0QzZrRWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=W36tdw3LqPq3tp58U4trYX6n=qaotMTsP6tm0QzZrRWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?6buE5rab?= <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Doug,

在 2016年11月15日 02:15, Doug Anderson 写道:
> William
>
> On Sun, Nov 13, 2016 at 11:01 PM, William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>> Since we needs to delay ~1ms to wait for 480MHz output clock
>> of USB2 PHY to become stable after turn on it, the delay time
>> is pretty long for something that's supposed to be "atomic"
>> like a clk_enable(). Consider that clk_enable() will disable
>> interrupt and that a 1ms interrupt latency is not sensible.
>>
>> The 480MHz output clock should be handled in prepare callbacks
>> which support gate a clk if the operation may sleep.
>>
>> Signed-off-by: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>   drivers/phy/phy-rockchip-inno-usb2.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
> Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Thanks! I'll add  Reviewed-by.
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
