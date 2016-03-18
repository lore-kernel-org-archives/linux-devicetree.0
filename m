From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: power: reset: add document for
 reboot-mode driver
Date: Fri, 18 Mar 2016 08:14:08 -0500
Message-ID: <CAL_JsqJ+PGgr8MAYH8onEDX-6DRmVR+Y-iOcw=JUZ3rfeq1ieg@mail.gmail.com>
References: <1457439716-8084-1-git-send-email-andy.yan@rock-chips.com>
 <1457439785-8133-1-git-send-email-andy.yan@rock-chips.com>
 <20160317155212.GA19171@rob-hp-laptop> <56EBBFB1.6000808@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56EBBFB1.6000808-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Matthias
List-Id: devicetree@vger.kernel.org

On Fri, Mar 18, 2016 at 3:43 AM, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wro=
te:
> Hi Rob:
>
>
> On 2016=E5=B9=B403=E6=9C=8817=E6=97=A5 23:52, Rob Herring wrote:
>>
>> On Tue, Mar 08, 2016 at 08:23:05PM +0800, Andy Yan wrote:
>>>
>>> add device tree bindings document for reboot-mode driver
>>>
>>> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

[...]

>>> +Required properties:
>>> +- compatible: should be "syscon-reboot-mode"
>>> +- offset: offset in the register map for the storage register (in =
bytes)
>>> +
>>> +Optional properity:
>>> +- mask: the mask bits of the mode magic value, default set to 0xff=
ffffff
>>> if missing.
>>
>> I can't see how this is used. I would drop it for now.
>>
>> With that change:
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
>
> The mask is suggested by Moritz Fischer in V2[0]. And I found Tegra d=
id
> indeed only use some bits of one register to store the reboot mode[1]=
=2E

And the other bits in the register need to be preserved? Please make
it clear the mask is for the register, not the magic value.

There's also a typo with "properity".

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
