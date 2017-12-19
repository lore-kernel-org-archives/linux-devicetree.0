From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH net-next v5 1/4] phylib: Add device reset delay support
Date: Tue, 19 Dec 2017 11:12:13 -0600
Message-ID: <CAL_JsqKM2MgpQzxjNOB9JSZD09vgUjrstbFWcNbnUdjQAYjzrA@mail.gmail.com>
References: <20171211121700.10200-1-dev@g0hl1n.net> <20171211121700.10200-2-dev@g0hl1n.net>
 <20171215221752.42sz53izxeebkfuq@rob-hp-laptop> <1b230e6b-8e8c-28a4-7524-6ce60aa71591@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1b230e6b-8e8c-28a4-7524-6ce60aa71591-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Cc: Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Fugang Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 18, 2017 at 1:30 AM, Richard Leitner
<richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi Rob,
>
> On 12/15/2017 11:17 PM, Rob Herring wrote:
>> On Mon, Dec 11, 2017 at 01:16:57PM +0100, Richard Leitner wrote:
>>> From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
>>>
>>> Some PHYs need a minimum time after the reset gpio was asserted and/or
>>> deasserted. To ensure we meet these timing requirements add two new
>>> optional devicetree parameters for the phy: reset-delay-us and
>>> reset-post-delay-us.
>>>
>>> Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/net/phy.txt | 10 ++++++++++
>>>  drivers/net/phy/mdio_device.c                 | 13 +++++++++++--
>>>  drivers/of/of_mdio.c                          |  4 ++++
>>>  include/linux/mdio.h                          |  2 ++
>>>  4 files changed, 27 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
>>> index c05479f5ac7c..72860ce7f610 100644
>>> --- a/Documentation/devicetree/bindings/net/phy.txt
>>> +++ b/Documentation/devicetree/bindings/net/phy.txt
>>> @@ -55,6 +55,12 @@ Optional Properties:
>>>
>>>  - reset-gpios: The GPIO phandle and specifier for the PHY reset signal.
>>>
>>> +- reset-delay-us: Delay after the reset was asserted in microseconds.
>>> +  If this property is missing the delay will be skipped.
>>> +
>>> +- reset-post-delay-us: Delay after the reset was deasserted in microseconds.
>>> +  If this property is missing the delay will be skipped.
>>
>> I think these names could be clearer as to exactly what they mean.
>> Looking at existing properties with "reset-delay" there's a mixture of
>> definitions whether it is the assert time or the time after deassert.
>>
>> So I'd call these "reset-assert-us" and "reset-deassert-us".
>
> Ok, that would be fine with me, but are you sure that we should omit the
> "-delay" term completely?

These are just minimum assertion and deassertion times. I think that's
clear enough.

> What would be the best approach to post this change (as the patchset was
> already merged to net-next)? A separate patch or a v6 of the complete
> patchset?

A patch on top of this.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
