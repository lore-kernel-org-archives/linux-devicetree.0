From: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: r8a7795: Add CA53 L2 cache-controller
 node
Date: Tue, 16 Feb 2016 08:33:41 +0100
Message-ID: <56C2D0D5.7090705@de.bosch.com>
References: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
 <1455568715-20880-8-git-send-email-geert+renesas@glider.be>
 <56C2C534.30704@de.bosch.com>
 <CAMuHMdX=Kgb-i+QpP=yNO2e6nw7sXuCutXPoK0U9NwK-OyANFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdX=Kgb-i+QpP=yNO2e6nw7sXuCutXPoK0U9NwK-OyANFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 16.02.2016 08:12, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Tue, Feb 16, 2016 at 7:44 AM, Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org> wrote:
>> On 15.02.2016 21:38, Geert Uytterhoeven wrote:
>>> Add a device node for the Cortex-A53 L2 cache-controller.
>>>
>>> The L2 cache for the Cortex-A53 CPU cores is 512 KiB large (organized as
>>> 32 KiB x 16 ways).
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>> ---
>>> v3:
>>>     - Remaining part of "[PATCH v2 6/6] arm64: renesas: r8a7795: Add L2
>>>       cache-controller nodes".
>>> ---
>>>    arch/arm64/boot/dts/renesas/r8a7795.dtsi | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>>> b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>>> index c07f4e83b988ba42..c572527afec3403a 100644
>>> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>>> @@ -72,6 +72,12 @@
>>>                  cache-level = <2>;
>>>          };
>>>
>>> +       L2_CA53: cache-controller@1 {
>>> +               compatible = "cache";
>>> +               cache-unified;
>>> +               cache-level = <2>;
>>> +       };
>>> +
>>
>> As we don't have any CA53 in the device tree yet, and it was rejected to add
>> it, I'd think that we don't want these unused entries at the moment.
>
> This is a preparatory step for adding the SYSC PM Domains.


Yes. But what do you want to control if it's not enabled at all?

To my understanding, as long as we don't enable the CA53 cores, we don't 
enable their L2 caches, too. And then we don't have to PM control them?


>> I'd propose to add the CA53 entries, first. And then add their L2 cache
>> entries.
>>
>> Based on the outcome of the discussion for the CA57 we have to see if we
>> want to add the unused cache-unified and cache-level, then, too.
>
> These are specified by ePAPR, as I said before.
> Remember, DT describes the hardware, not what Linux (or any other OS) is
> using.


Yes, this is understood :)

Your argument is the Spec/ePAPR, my point of view is the practical 
implementation. I'd think both are valid. Therefore let's see what 
Sudeep thinks ;)


Best regards

Dirk

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
