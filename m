From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [v1 PATCH 1/4] Documentation: bindings: add dt doc for Rockchip
 USB Type-C PHY
Date: Tue, 7 Jun 2016 08:46:20 -0500
Message-ID: <CAL_Jsq+7fNuL3N24uh+F_VgGU0RBGUn_nwRA3_cFBseaobpqDw@mail.gmail.com>
References: <1464966911-18949-1-git-send-email-zyw@rock-chips.com>
 <1464966911-18949-2-git-send-email-zyw@rock-chips.com> <20160606142738.GA12472@rob-hp-laptop>
 <57561653.9060404@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57561653.9060404-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, =?UTF-8?B?5aea5pm65oOF?= <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 6, 2016 at 7:33 PM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Hi Rob
>
>
> On 06/06/2016 10:27 PM, Rob Herring wrote:
>>
>> On Fri, Jun 03, 2016 at 11:15:08PM +0800, Chris Zhong wrote:
>>>
>>> This patch adds a binding that describes the Rockchip USB Type-C PHY
>>> for rk3399
>>>
>>> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>
>>> ---
>>>
>>> Changes in v1:
>>> - add extcon node description
>>> - move the registers in phy driver
>>> - remove the suffix of reset
>>>
>>>   .../devicetree/bindings/phy/phy-rockchip-typec.txt | 46
>>> ++++++++++++++++++++++
>>>   1 file changed, 46 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>>> b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>>> new file mode 100644
>>> index 0000000..964e0f7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>>> @@ -0,0 +1,46 @@
>>> +* ROCKCHIP type-c PHY
>>> +---------------------
>>> +
>>> +Required properties:
>>> + - compatible: should be "rockchip,rk3399-typec-phy0" or
>>> +                        "rockchip,rk3399-typec-phy1"
>>
>> What's the difference between 0 and 1? If it is to handle the register
>> offsets you have in the previous version and the phy blocks are
>> identical, then the compatible strings should be the same.
>
> yes, the registers are different between 0 and 1, and there is a grf
> register(0x6268) for switch the phy 0 and phy 1

But GRF is in a separate block and not part of the phy, right?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
