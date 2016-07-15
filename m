From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor
 rate application method
Date: Fri, 15 Jul 2016 12:38:54 +0200
Message-ID: <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IGe5uIOnaMnRQf3lORISKcRJnT06bVfME"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBRX2UK6AKGQEYYQ7UIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160715085356.GR4761@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IGe5uIOnaMnRQf3lORISKcRJnT06bVfME
Content-Type: multipart/mixed; boundary="LCkHJRUDtL0K7IA53Tewkvb4U6for6in8"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>,
 Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>,
 =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Message-ID: <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
References: <20160625034511.7966-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160625034511.7966-7-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160715085356.GR4761@lukather>
In-Reply-To: <20160715085356.GR4761@lukather>

--LCkHJRUDtL0K7IA53Tewkvb4U6for6in8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15.7.2016 10:53, Maxime Ripard wrote:
> On Fri, Jul 01, 2016 at 02:50:57AM +0200, Ond=C5=99ej Jirman wrote:
>>>>  /**
>>>> + * sun8i_h3_apply_pll1_factors() - applies n, k, m, p factors to the
>>>> + * register using an algorithm that tries to reserve the PLL lock
>>>> + */
>>>> +
>>>> +static void sun8i_h3_apply_pll1_factors(struct clk_factors *factors, =
struct factors_request *req)
>>>> +{
>>>> +	const struct clk_factors_config *config =3D factors->config;
>>>> +	u32 reg;
>>>> +
>>>> +	/* Fetch the register value */
>>>> +	reg =3D readl(factors->reg);
>>>> +
>>>> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) < req->p) {
>>>> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
>>>> +
>>>> +		writel(reg, factors->reg);
>>>> +		__delay(2000);
>>>> +	}
>>>
>>> So there was some doubts about the fact that P was being used, or at
>>> least that it was useful.
>>
>> p is necessary to reduce frequencies below 288 MHz according to the
>> datasheet.
>=20
> Yes, but you could reach those frequencies without P, too, and it's
> not part of any OPP provided by Allwinner.

The arisc firmware for H3 contains table of factors for frequences from
0 to 2GHz and, P is used below 240MHz. M is never used, BTW. (other
datasheets specify M as for testing use only, whatever that means - not
H3, but it seems it's the same PLL block)


... snip ...
	{ .n =3D 9, .k =3D 0, .m =3D 0, .p =3D 2 }, // 60 =3D> 60 MHz
	{ .n =3D 10, .k =3D 0, .m =3D 0, .p =3D 2 }, // 66 =3D> 66 MHz
	{ .n =3D 11, .k =3D 0, .m =3D 0, .p =3D 2 }, // 72 =3D> 72 MHz
	{ .n =3D 12, .k =3D 0, .m =3D 0, .p =3D 2 }, // 78 =3D> 78 MHz
	{ .n =3D 13, .k =3D 0, .m =3D 0, .p =3D 2 }, // 84 =3D> 84 MHz
	{ .n =3D 14, .k =3D 0, .m =3D 0, .p =3D 2 }, // 90 =3D> 90 MHz
	{ .n =3D 15, .k =3D 0, .m =3D 0, .p =3D 2 }, // 96 =3D> 96 MHz
	{ .n =3D 16, .k =3D 0, .m =3D 0, .p =3D 2 }, // 102 =3D> 102 MHz
	{ .n =3D 17, .k =3D 0, .m =3D 0, .p =3D 2 }, // 108 =3D> 108 MHz
	{ .n =3D 18, .k =3D 0, .m =3D 0, .p =3D 2 }, // 114 =3D> 114 MHz
	{ .n =3D 9, .k =3D 0, .m =3D 0, .p =3D 1 }, // 120 =3D> 120 MHz
	{ .n =3D 10, .k =3D 0, .m =3D 0, .p =3D 1 }, // 126 =3D> 132 MHz
	{ .n =3D 10, .k =3D 0, .m =3D 0, .p =3D 1 }, // 132 =3D> 132 MHz
	{ .n =3D 11, .k =3D 0, .m =3D 0, .p =3D 1 }, // 138 =3D> 144 MHz
	{ .n =3D 11, .k =3D 0, .m =3D 0, .p =3D 1 }, // 144 =3D> 144 MHz
	{ .n =3D 12, .k =3D 0, .m =3D 0, .p =3D 1 }, // 150 =3D> 156 MHz
	{ .n =3D 12, .k =3D 0, .m =3D 0, .p =3D 1 }, // 156 =3D> 156 MHz
	{ .n =3D 13, .k =3D 0, .m =3D 0, .p =3D 1 }, // 162 =3D> 168 MHz
	{ .n =3D 13, .k =3D 0, .m =3D 0, .p =3D 1 }, // 168 =3D> 168 MHz
	{ .n =3D 14, .k =3D 0, .m =3D 0, .p =3D 1 }, // 174 =3D> 180 MHz
	{ .n =3D 14, .k =3D 0, .m =3D 0, .p =3D 1 }, // 180 =3D> 180 MHz
	{ .n =3D 15, .k =3D 0, .m =3D 0, .p =3D 1 }, // 186 =3D> 192 MHz
	{ .n =3D 15, .k =3D 0, .m =3D 0, .p =3D 1 }, // 192 =3D> 192 MHz
	{ .n =3D 16, .k =3D 0, .m =3D 0, .p =3D 1 }, // 198 =3D> 204 MHz
	{ .n =3D 16, .k =3D 0, .m =3D 0, .p =3D 1 }, // 204 =3D> 204 MHz
	{ .n =3D 17, .k =3D 0, .m =3D 0, .p =3D 1 }, // 210 =3D> 216 MHz
	{ .n =3D 17, .k =3D 0, .m =3D 0, .p =3D 1 }, // 216 =3D> 216 MHz
	{ .n =3D 18, .k =3D 0, .m =3D 0, .p =3D 1 }, // 222 =3D> 228 MHz
	{ .n =3D 18, .k =3D 0, .m =3D 0, .p =3D 1 }, // 228 =3D> 228 MHz
	{ .n =3D 9, .k =3D 0, .m =3D 0, .p =3D 0 }, // 234 =3D> 240 MHz
	{ .n =3D 9, .k =3D 0, .m =3D 0, .p =3D 0 }, // 240 =3D> 240 MHz
	{ .n =3D 10, .k =3D 0, .m =3D 0, .p =3D 0 }, // 246 =3D> 264 MHz
	{ .n =3D 10, .k =3D 0, .m =3D 0, .p =3D 0 }, // 252 =3D> 264 MHz
	{ .n =3D 10, .k =3D 0, .m =3D 0, .p =3D 0 }, // 258 =3D> 264 MHz
	{ .n =3D 10, .k =3D 0, .m =3D 0, .p =3D 0 }, // 264 =3D> 264 MHz
	{ .n =3D 11, .k =3D 0, .m =3D 0, .p =3D 0 }, // 270 =3D> 288 MHz
	{ .n =3D 11, .k =3D 0, .m =3D 0, .p =3D 0 }, // 276 =3D> 288 MHz
... snip ...


>>>> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) < req->m) {
>>>> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
>>>> +
>>>> +		writel(reg, factors->reg);
>>>> +		__delay(2000);
>>>> +	}
>>>> +
>>>> +	reg =3D FACTOR_SET(config->nshift, config->nwidth, reg, req->n);
>>>> +	reg =3D FACTOR_SET(config->kshift, config->kwidth, reg, req->k);
>>>> +
>>>> +	writel(reg, factors->reg);
>>>> +	__delay(20);
>>>> +
>>>> +	while (!(readl(factors->reg) & (1 << config->lock)));
>>>
>>> So, they are applying the dividers first, and then applying the
>>> multipliers, and then wait for the PLL to stabilize.
>>
>> Not exactly, first we are increasing dividers if the new dividers are
>> higher that that what's already set. This ensures that because
>> application of dividers is immediate by the design of the PLL, the
>> application of multipliers isn't. So the VCO would still run at the same
>> frequency for a while gradually rising to a new value for example,
>> while the dividers would be reduced immediately. Leading to crash.
>>
>> PLL
>> --------------------------
>> PRE DIV(f0) -> VCO(f1) -> POST DIV(f2)
>>    P             K,N           M
>>
>> Example: (we set all factors at once, reducing dividers and multipliers
>> at the same time at 0ms - this should lead to no change in the output
>> frequency, but...)
>>
>> -1ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz
>>  0ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 2GHz       - boom
>>  1ms: f0 =3D 24MHz, f1 =3D 1.5GHz, f2 =3D 1.5GHz
>>  2ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 1GHz
>>
>> The current code crashes exactly at boom, you don't get any more
>> instructions to execute.
>>
>> See.
>>
>> So this patch first increases dividers (only if necessary), changes
>> multipliers and waits for change to happen (takes around 2000 cycles),
>> and then decreases dividers (only if necessary).
>>
>> So we get:
>>
>> -1ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz
>>  0ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz   - no boom, multiplier
>>                                              reduced
>>  1ms: f0 =3D 24MHz, f1 =3D 1.5GHz, f2 =3D 0.75GHz
>> 1.9ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 0.5GHz - we got PLL sync
>>  2ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 1GHz   - and here we reduce di=
vider
>> at last
>=20
> Awesome explanation, thanks!
>=20
> So I guess it really all boils down to the fact that the CPU is
> clocked way outside of it's operating frequency while the PLL
> stabilizes, right?

It may be, depending on the factors before and after change. I haven't
tested what factors the mainline kernel calculates for each frequency.
The arisc never uses M, and only uses P at frequencies that would not
allow for this behavior.

I created a test program for arisc that runs a loop on the main CPU
using msgbox to send pings to the arisc CPU, and the vary the PLL1
randomly from the arisc, and haven't been able to lockup the main CPU
yet with either method.

There's also AXI clock, that depends on PLL1. Arisc firmware uses the
same method to change it while changing CPUX clock. If the clock would
rise above certain frequency, AXI divider is increased before the PLL1
change. If it would fall below certain frequency it is decreased after
the PLL1 change.

Though, aw kernel has axi divider set to 3 for all PLL1 frequencies, so
this has no effect in practice.

It's all smoke and mirrors. :D

> If so, then yes, trying to switch to the 24MHz oscillator before
> applying the factors, and then switching back when the PLL is stable
> would be a nice solution.
>=20
> I just checked, and all the SoCs we've had so far have that
> possibility, so if it works, for now, I'd like to stick to that.

It would need to be tested. U-boot does the change only once, while the
kernel would be doing it all the time and between various frequencies
and PLL settings. So the issues may show up with this solution too.

>>>> +
>>>> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) > req->m) {
>>>> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
>>>> +
>>>> +		writel(reg, factors->reg);
>>>> +		__delay(2000);
>>>> +	}
>>>> +
>>>> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) > req->p) {
>>>> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
>>>> +
>>>> +		writel(reg, factors->reg);
>>>> +		__delay(2000);
>>>> +	}
>>>
>>> However, this is kind of weird, why would you need to re-apply the
>>> dividers? Nothing really changes. Have you tried without that part?
>>
>> See above, we either increase before PLL change, or reduce dividers
>> after the change. Nothing is re-applied.
>>
>>> Since this is really specific, I guess you could simply make the
>>> clk_ops for the nkmp clocks public, and just re-implement set_rate
>>> using that logic.
>>
>> I would argue that this may be necessary for other PLL clocks too, if
>> you can get out of bounds output frequency, by changing the dividers too
>> early or too late. So perhaps this code should be generalized for other
>> PLL clocks too, instead.
>=20
> We can scale down the problem a bit. The only PLL we modify are the
> CPU, audio and video ones.
>=20
> The CPU should definitely be addressed, but what would be the outcome
> of an out of bounds audio pll for example? Is it just taking more time
> to stabilize, or would it hurt the system?

I have no idea. Given the low frequencies, you'll probably just get some
transient audio noise.

> In the former case, then we can just wait. In the latter, we of course
> need to come up with a solution.
>=20
> Maxime
>=20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--LCkHJRUDtL0K7IA53Tewkvb4U6for6in8--

--IGe5uIOnaMnRQf3lORISKcRJnT06bVfME
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXiL0+AAoJEG5kJsZ3z+/x4VQP/1trB8yFIHNeNRMnag/V+lzr
5U9HZ1vbrSLCLTG3EK+Xup+J8mq5n+v8ymSkBCrjUQ0Z7p3TZqI8d9arEdfWwyxc
pXHQd3vZuZ1uOK2bs79OmYZopbGp4OSBfiyX5AlhJZfI9AQXtERJTE7gGekgaIBz
+LcaBR4FCsa2OYFyGOWMymGxbtLUvQ/tqjGn53DHd+qU6SF+WgkxVRz8ffOUbI1v
qXgwF3hBwh/RJQpsciVEoxXpWE+amyheakXCfo8US9k6UHcZfhvMLr1KgDmLlFVM
84pv8UAds9cA4Y/1/mf5/jg1/XmxVDEZpr7WAS0Fpjfl+qPzkHh2xLAo7nASVqn7
tTp617/jiA0RtbvcSelpr36OfbY61RypC71VwhPRXd4ORAVvDOq8K7uEWTXMY2ch
Ak1n+DJ/h014r3ZGvlGkAjCs0T0QMwu0G9V1znuQH/F5sZLLM408R67wjWpYs3xz
rkpWY6dSO2l+pl37XIn3pvLc2zdV++duntbP1VFcP+KV7miBIULTjFwB3ME7npx8
eTIJhXGlXnU7bONtvpLY6kSQcheT8nP0L1HX05OfjUWiC6Aygz3gHbtXZGwmF5+6
lATzu70DPYNN/r9C3o69szKMGLWbao+uPxMe/noomB6PXYPG8O0IXGLod/VF4z4y
J1gO3T72P5pIMwGNFxCK
=Biut
-----END PGP SIGNATURE-----

--IGe5uIOnaMnRQf3lORISKcRJnT06bVfME--
