From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: bcm5301x: Add TWD WD Support to DT
Date: Thu, 2 Mar 2017 20:19:26 +0100
Message-ID: <CACna6rw_TY2fVBrzc2YfH_rYZkWJvK-v1TyAs0U6jp3PLdC2sg@mail.gmail.com>
References: <1488313886-17155-1-git-send-email-jon.mason@broadcom.com>
 <1488313886-17155-2-git-send-email-jon.mason@broadcom.com>
 <de705b40-1a8a-faef-846e-3635682671f6@gmail.com> <CAC3K-4pg0TLF-1CV+NtgEh7a0-EHQBvxjNbbGJB32WsNa0U0wA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAC3K-4pg0TLF-1CV+NtgEh7a0-EHQBvxjNbbGJB32WsNa0U0wA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2 March 2017 at 20:00, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On Thu, Mar 2, 2017 at 1:54 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>>
>> On 02/28/2017 09:31 PM, Jon Mason wrote:
>>>
>>> From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>
>>> Add support for the ARM TWD Watchdog to the bcm5301x device tree.  The
>>> ARM TWD timer allocated the register space for the WDT, so this patch
>>> necessitated shrinking that.  Also, the GIC masks were added for these.
>>>
>>> Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/bcm5301x.dtsi | 15 ++++++++++++---
>>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi
>>> b/arch/arm/boot/dts/bcm5301x.dtsi
>>> index 4fbb089..3fbc450 100644
>>> --- a/arch/arm/boot/dts/bcm5301x.dtsi
>>> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
>>> @@ -70,10 +70,19 @@
>>>                         clocks =3D <&periph_clk>;
>>>                 };
>>>
>>> -               local-timer@20600 {
>>> +               timer@20600 {
>>>                         compatible =3D "arm,cortex-a9-twd-timer";
>>> -                       reg =3D <0x20600 0x100>;
>>> -                       interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>=
;
>>> +                       reg =3D <0x20600 0x20>;
>>> +                       interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE=
(2)
>>> |
>>> +                                                 IRQ_TYPE_LEVEL_HIGH)>=
;
>>> +                       clocks =3D <&periph_clk>;
>>> +               };
>>
>>
>> If you follow my recent e-mail thread:
>> BCM5301X: GIC: PPI11 is secure or misconfigured (same for PPI13)
>> you'll see IRQ_TYPE_LEVEL_HIGH type isn't correct. It should be
>> IRQ_TYPE_EDGE_RISING.
>>
>> I believe patch switching to IRQ_TYPE_EDGE_RISING should be sent with Cc
>> stable
>> for kernels 4.8+.
>>
>> The same change is needed for "arm,cortex-a9-global-timer".
>>
>> Would you find time to revise this patch?
>
>
> I'll do 2 patches.  One to revise this one and one to address the issue
> you've discovered.  Will that be okay for you?

Sure. Please make sure you switch to IRQ_TYPE_EDGE_RISING before doing
other changes, so it can be applied cleanly to the stable kernels.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
