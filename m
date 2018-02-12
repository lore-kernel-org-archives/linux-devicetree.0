From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] Documentation: bindings: add usb3-host-disable and
 usb3-host-port for Rockchip USB Type-C PHY
Date: Mon, 12 Feb 2018 10:43:41 -0600
Message-ID: <CAL_JsqLvkPEm1mZaEfEVFEYMoGvOsbSQb8c35UvjmRTCwrCF8Q@mail.gmail.com>
References: <20180208152028.9997-1-enric.balletbo@collabora.com>
 <20180208152028.9997-2-enric.balletbo@collabora.com> <CABGGisyaqV5HtTUL5LdjH3ZcU3_RTPmzMvEAhv5wZjCD_XCujg@mail.gmail.com>
 <CAFqH_53-iN9m=U+WdQh6_rKyxE5c9RUQO9qD1QaY0QePM_pOZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFqH_53-iN9m=U+WdQh6_rKyxE5c9RUQO9qD1QaY0QePM_pOZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, huang lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 8, 2018 at 3:23 PM, Enric Balletbo Serra
<eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Rob,
>
> 2018-02-08 18:52 GMT+01:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>> On Thu, Feb 8, 2018 at 9:20 AM, Enric Balletbo i Serra
>> <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>>> From: William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>
>>> rockchip,usb3-host-disable is the register of type-c phy disable usb3 host
>>> rockchip,usb3-host-port is the register of type-c phy usb3 port number
>>>
>>> Signed-off-by: William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>>> index c3be83be9615..9085d95d0079 100644
>>> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>>> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>>> @@ -36,6 +36,12 @@ offset, enable bit, write mask bit.
>>>   - rockchip,uphy-dp-sel : the register of type-c phy enable DP function
>>>     for type-c phy0, it must be <0x6268 19 19>;
>>>     for type-c phy1, it must be <0x6268 3 19>;
>>> + - rockchip,usb3-host-disable : the register of type-c phy disable usb3 host
>>> +   for type-c phy0, it must be <0x2434 0 16>;
>>> +   for type-c phy1, it must be <0x2444 0 16>;
>>> + - rockchip,usb3-host-port : the register of type-c phy usb3 port number
>>> +   for type-c phy0, it must be <0x2434 12 28>;
>>> +   for type-c phy1, it must be <0x2444 12 28>;
>>
>> When does this list stop? Adding properties for various register
>> fields doesn't scale. This information should be in the driver and
>> based on the compatible string if necessary.
>>
>
> I see, seams reasonable to me, is this applicable to the new ones only
> or I should get rid of all the proprieties like this from the DT
> (including the old ones)?

We're already kind of stuck with the existing ones. So it depends if
people want to phase them out or not.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
