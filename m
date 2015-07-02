From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: ARM: Mediatek: Document devicetree
 bindings for clock controllers
Date: Thu, 02 Jul 2015 16:40:12 -0700
Message-ID: <5595CBDC.7090101@codeaurora.org>
References: <1435633127-31952-1-git-send-email-jamesjj.liao@mediatek.com> <1435633127-31952-3-git-send-email-jamesjj.liao@mediatek.com> <CAGS+omD9Mvz0-RQMc5TsWCPct80S5fyqMn3+-zR7HB9yb7KoDQ@mail.gmail.com> <1435805534.3526.23.camel@mtksdaap41> <CAGS+omCgNstb+NPmRdbngnLm754hDPLO28KRc4RanCD2Myv7dQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omCgNstb+NPmRdbngnLm754hDPLO28KRc4RanCD2Myv7dQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/01/2015 09:26 PM, Daniel Kurtz wrote:
> On Thu, Jul 2, 2015 at 10:52 AM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Daniel,
>>
>>>> +Required Properties:
>>>> +
>>>> +- compatible: Should be:
>>>> +       - "mediatek,mt8173-imgsys", "syscon"
>>>> +- #clock-cells: Must be 1
>>>> +
>>>> +The imgsys controller uses the common clk binding from
>>>> +Documentation/devicetree/bindings/clock/clock-bindings.txt
>>>> +The available clocks are defined in dt-bindings/clock/mt*-clk.h.
>>>> +
>>>> +Example:
>>>> +
>>>> +imgsys: imgsys@15000000 {
>>> Since these nodes will be supplying clocks to the rest of the system,
>>> I think the "name" part of each of these should all be
>>> "clock-controller", like topckgen and apmixedsys:
>>>
>>>   imgsys: clock-controller@15000000 {
>> These subsystems (and topckgen also) also contains other functions such
>> as reset controller, which may be implemented in clk/mediatek/ in the
>> future. It is suitable to use "clock-controller" as their name?
> Hmm,
>
> I don't know the "right way" to do this either.
> Pardon me if you've already had these discussions.
> I only recently started looking at these clock nodes in detail :-).
>
> I think what we really have in register space is a "syscon", as
> described in [0]:
> [0] Documentation/devicetree/bindings/mfd/syscon.txt
>
> So, we can define this block of registers as a syscon:
>
> mmsys_syscon: syscon@14000000 {
>        compatible = "mediatek,mt8173-mmsys", "syscon";
>        reg = <0 0x14000000 0 0x1000>;
> };
>
>
> Then for the clock controller functionality, we create a node with a
> "clock-controller" name and a "-clock" compatible, like this:
>
> mmsys_clock: clock-controller {
>        compatible = "mediatek,mt8173-mmsys-clock";
>        #clock-cells = <1>;
>        mediatek,syscon = <&mmsys_syscon>;
> };
>
> You could then do:
> CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys-clock", mtk_mmsys_init);
>
>
> If you want to reuse the same register range for some other
> functionality, we could then use a different node, with a different
> compatible:
>
> mmsys: reset-controller {
>        compatible = "mediatek,mt8173-mmsys-reset";
>        mediatek,syscon = <&mmsys_syscon>;
> };
>
> What do you think of this approach?

DT nodes typically have a reg property. Not having a reg property is a
good indicator of a problem with the binding. A syscon is used when you
have a DT node with a reg property and some driver attached to it, but
you need to poke some bits in another register region that isn't part of
the reg property. Instead of having multiple nodes with two reg
properties where the second one is the same, we use a phandle and a syscon.

If clock-controller isn't acceptable maybe clock-reset-contoller would
work? Or "power-controller"? We certainly shouldn't be making up
multiple nodes for one hardware block. Of course, the subject of the
patch is "bindings for clock controllers", so it may be that the
registers are predominantly clock related and so the name is appropriate
already.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
