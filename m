From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] clocksource: sunxi: Add new compatibles
Date: Tue, 04 Feb 2014 09:13:23 +0100
Message-ID: <52F0A123.2080103@free-electrons.com>
References: <1391348280-9484-1-git-send-email-maxime.ripard@free-electrons.com> <52EFC573.2050302@linaro.org> <20140203194505.GF25625@lukather> <52EFF96A.1020302@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52EFF96A.1020302-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,
On 03/02/2014 21:17, Daniel Lezcano wrote:
> On 02/03/2014 08:45 PM, Maxime Ripard wrote:
>> Hi Daniel,
>>
>> (Adding DT mailing-list in CC)
>>
>> On Mon, Feb 03, 2014 at 05:36:03PM +0100, Daniel Lezcano wrote:
>>> On 02/02/2014 02:37 PM, Maxime Ripard wrote:
>>>> The Allwinner A10 compatibles were following a slightly different =
compatible
>>>> patterns than the rest of the SoCs for historical reasons. Add com=
patibles
>>>> matching the other pattern to the timer driver for consistency, an=
d keep the
>>>> older one for backward compatibility.
>>>
>>> Hi Maxime,
>>>
>>> is it really needed to keep the old pattern ?
>>
>> We agreed during the ARM Kernel Summit to consider the DT as a stabl=
e
>> ABI.
>>
>> While I'd be ok with removing the older ones, that also means that w=
e
>> would break the boot of newer kernels with older DT, so yes, we
>> actually need to keep the old compatibles.
>=20
> Thanks for the clarification.
>=20
> So these old compatibles will stay there 'ad vitam aeternam', right ?

=46rom what I have understood during the ARM Kernel Summit, it was
acceptable to remove them after a few release.

Gregory

>=20
>=20
>>>> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>>> ---
>>>>   Documentation/devicetree/bindings/timer/allwinner,sun4i-timer.tx=
t | 5 +++--
>>>>   drivers/clocksource/sun4i_timer.c                               =
  | 4 ++++
>>>>   2 files changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun=
4i-timer.txt b/Documentation/devicetree/bindings/timer/allwinner,sun4i-=
timer.txt
>>>> index 48aeb78..d9e35ae 100644
>>>> --- a/Documentation/devicetree/bindings/timer/allwinner,sun4i-time=
r.txt
>>>> +++ b/Documentation/devicetree/bindings/timer/allwinner,sun4i-time=
r.txt
>>>> @@ -2,7 +2,8 @@ Allwinner A1X SoCs Timer Controller
>>>>
>>>>   Required properties:
>>>>
>>>> -- compatible : should be "allwinner,sun4i-timer"
>>>> +- compatible : should be "allwinner,sun4i-a10-timer"
>>>> +               (Deprecated "allwinner,sun4i-timer")
>>>>   - reg : Specifies base physical address and size of the register=
s.
>>>>   - interrupts : The interrupt of the first timer
>>>>   - clocks: phandle to the source clock (usually a 24 MHz fixed cl=
ock)
>>>> @@ -10,7 +11,7 @@ Required properties:
>>>>   Example:
>>>>
>>>>   timer {
>>>> -	compatible =3D "allwinner,sun4i-timer";
>>>> +	compatible =3D "allwinner,sun4i-a10-timer";
>>>>   	reg =3D <0x01c20c00 0x400>;
>>>>   	interrupts =3D <22>;
>>>>   	clocks =3D <&osc>;
>>>> diff --git a/drivers/clocksource/sun4i_timer.c b/drivers/clocksour=
ce/sun4i_timer.c
>>>> index bf497af..de03895 100644
>>>> --- a/drivers/clocksource/sun4i_timer.c
>>>> +++ b/drivers/clocksource/sun4i_timer.c
>>>> @@ -196,5 +196,9 @@ static void __init sun4i_timer_init(struct dev=
ice_node *node)
>>>>   	clockevents_config_and_register(&sun4i_clockevent, rate,
>>>>   					TIMER_SYNC_TICKS, 0xffffffff);
>>>>   }
>>>> +CLOCKSOURCE_OF_DECLARE(sun4i, "allwinner,sun4i-a10-timer",
>>>> +		       sun4i_timer_init);
>>>> +
>>>> +/* Deprecated */
>>>>   CLOCKSOURCE_OF_DECLARE(sun4i, "allwinner,sun4i-timer",
>>>>   		       sun4i_timer_init);
>>>>
>>>
>>>
>>> --
>>>   <http://www.linaro.org/> Linaro.org =E2=94=82 Open source softwar=
e for ARM SoCs
>>>
>>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>>> <http://twitter.com/#!/linaroorg> Twitter |
>>> <http://www.linaro.org/linaro-blog/> Blog
>>>
>>
>=20
>=20


--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
