From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/5] extcon: usbc-cros-ec: add support to notify USB
 type cables.
Date: Fri, 15 Dec 2017 17:20:32 +0900
Message-ID: <5A3385D0.2050308@samsung.com>
References: <CGME20171213103241epcas2p412031074459fa3893388ffca4f894abc@epcas2p4.samsung.com>
        <20171213103219.1464-1-enric.balletbo@collabora.com>
        <5A33702D.60004@samsung.com> <20171215081453.6jwjdetwe655imqo@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20171215081453.6jwjdetwe655imqo@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2017년 12월 15일 17:14, Lee Jones wrote:
>> On 2017년 12월 13일 19:32, Enric Balletbo i Serra wrote:
>>> From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>
>>> Extend the driver to notify host and device type cables and the presence
>>> of power.
>>>
>>> Signed-off-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>> Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>> Changes since v1:
>>>  - Use the BIT macro. Requested by Lee Jones.
>>>  - Add the Reviewed-by: Chanwoo Choi.
>>>
>>>  drivers/extcon/extcon-usbc-cros-ec.c | 142 ++++++++++++++++++++++++++++++++++-
>>>  include/linux/mfd/cros_ec_commands.h |  17 +++++
>>>  2 files changed, 155 insertions(+), 4 deletions(-)
> 
>> Looks good to me. After reviewing the Lee Jones,
>> I'll take it on next branch.
> 
> If you take it, you need to send me a pull-request to an immutable
> branch.
> 
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 

Sure. I'll send the immutable branch. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
