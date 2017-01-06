From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] phy: rockchip-emmc: try to get drive impedance from DT
Date: Fri, 6 Jan 2017 10:29:04 -0800
Message-ID: <CAD=FV=UhPTHqOUNK344FtaX70Eg3SWhHhxtrYEvcSZJdNCNpnQ@mail.gmail.com>
References: <1483608682-226716-1-git-send-email-shawn.lin@rock-chips.com>
 <1483608682-226716-2-git-send-email-shawn.lin@rock-chips.com>
 <CAD=FV=V0+=yknRQAZu98FVsbKnRTX_5beeKsLe01P0qT7gb5Zg@mail.gmail.com> <669c85b1-f0fb-c58e-90a8-3aeac3118656@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <669c85b1-f0fb-c58e-90a8-3aeac3118656-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jan 5, 2017 at 5:09 PM, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> On 2017/1/6 8:51, Doug Anderson wrote:
>>
>> Hi,
>>
>> On Thu, Jan 5, 2017 at 1:31 AM, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> wrote:
>>>
>>> Try to get drive impedance from DT and use it, otherwise
>>> use 50ohm by default in order not to break the existing boards
>>> as 50ohm works fine for them already.
>>>
>>> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> ---
>>>
>>>  drivers/phy/phy-rockchip-emmc.c | 29 ++++++++++++++++++++++++++++-
>>>  1 file changed, 28 insertions(+), 1 deletion(-)
>>
>>
>> I could have sworn that you somehow needed to make sure that the eMMC
>> part itself needed to also be updated to be told the matching drive
>> impedance so you don't get a mismatch.  How do you make that work?
>
>
> No I didn't. So that means the eMMC part itself still couldn't be
> updated. The intention for me to introduce this only for emmc phy is
> that I got report that the default drive impedance of one eMMC is not
> 50ohms, so now we haven't been able to update it for eMMC part but maybe
> we could just update it for the phy itself to match them in between.

Interesting.  ...the eMMC spec says that 50 Ohm is mandatory, so we
know that 50 Ohm must be supported.

...and even if the default isn't 50 Ohm then wouldn't it get set to 50
OHm when we set the HS_TIMING ?


-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
