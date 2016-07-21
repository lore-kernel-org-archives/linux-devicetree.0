From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
Date: Thu, 21 Jul 2016 11:52:15 +0200
Message-ID: <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160721094852.GI5993@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XeDsBnWmvvKSRXMo8Ha5KRR6BRHhkeU0r"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160721094852.GI5993@lukather>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XeDsBnWmvvKSRXMo8Ha5KRR6BRHhkeU0r
Content-Type: multipart/mixed; boundary="wvbBQToQOt3eA67n26UaGSJJwX34bv2Si"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160721094852.GI5993@lukather>
In-Reply-To: <20160721094852.GI5993@lukather>

--wvbBQToQOt3eA67n26UaGSJJwX34bv2Si
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 21.7.2016 11:48, Maxime Ripard wrote:
> On Fri, Jul 15, 2016 at 12:38:54PM +0200, Ond=C5=99ej Jirman wrote:
>> On 15.7.2016 10:53, Maxime Ripard wrote:
>>> On Fri, Jul 01, 2016 at 02:50:57AM +0200, Ond=C5=99ej Jirman wrote:
>>>>>>  /**
>>>>>> + * sun8i_h3_apply_pll1_factors() - applies n, k, m, p factors to =
the
>>>>>> + * register using an algorithm that tries to reserve the PLL lock=

>>>>>> + */
>>>>>> +
>>>>>> +static void sun8i_h3_apply_pll1_factors(struct clk_factors *facto=
rs, struct factors_request *req)
>>>>>> +{
>>>>>> +	const struct clk_factors_config *config =3D factors->config;
>>>>>> +	u32 reg;
>>>>>> +
>>>>>> +	/* Fetch the register value */
>>>>>> +	reg =3D readl(factors->reg);
>>>>>> +
>>>>>> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) < req->p) {
>>>>>> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p)=
;
>>>>>> +
>>>>>> +		writel(reg, factors->reg);
>>>>>> +		__delay(2000);
>>>>>> +	}
>>>>>
>>>>> So there was some doubts about the fact that P was being used, or a=
t
>>>>> least that it was useful.
>>>>
>>>> p is necessary to reduce frequencies below 288 MHz according to the
>>>> datasheet.
>>>
>>> Yes, but you could reach those frequencies without P, too, and it's
>>> not part of any OPP provided by Allwinner.
>>
>> The arisc firmware for H3 contains table of factors for frequences fro=
m
>> 0 to 2GHz and, P is used below 240MHz. M is never used, BTW. (other
>> datasheets specify M as for testing use only, whatever that means - no=
t
>> H3, but it seems it's the same PLL block)
>=20
> Interesting. Which SoCs in particular?
>=20
>>>>>> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) < req->m) {
>>>>>> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m)=
;
>>>>>> +
>>>>>> +		writel(reg, factors->reg);
>>>>>> +		__delay(2000);
>>>>>> +	}
>>>>>> +
>>>>>> +	reg =3D FACTOR_SET(config->nshift, config->nwidth, reg, req->n);=

>>>>>> +	reg =3D FACTOR_SET(config->kshift, config->kwidth, reg, req->k);=

>>>>>> +
>>>>>> +	writel(reg, factors->reg);
>>>>>> +	__delay(20);
>>>>>> +
>>>>>> +	while (!(readl(factors->reg) & (1 << config->lock)));
>>>>>
>>>>> So, they are applying the dividers first, and then applying the
>>>>> multipliers, and then wait for the PLL to stabilize.
>>>>
>>>> Not exactly, first we are increasing dividers if the new dividers ar=
e
>>>> higher that that what's already set. This ensures that because
>>>> application of dividers is immediate by the design of the PLL, the
>>>> application of multipliers isn't. So the VCO would still run at the =
same
>>>> frequency for a while gradually rising to a new value for example,
>>>> while the dividers would be reduced immediately. Leading to crash.
>>>>
>>>> PLL
>>>> --------------------------
>>>> PRE DIV(f0) -> VCO(f1) -> POST DIV(f2)
>>>>    P             K,N           M
>>>>
>>>> Example: (we set all factors at once, reducing dividers and multipli=
ers
>>>> at the same time at 0ms - this should lead to no change in the outpu=
t
>>>> frequency, but...)
>>>>
>>>> -1ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz
>>>>  0ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 2GHz       - boom
>>>>  1ms: f0 =3D 24MHz, f1 =3D 1.5GHz, f2 =3D 1.5GHz
>>>>  2ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 1GHz
>>>>
>>>> The current code crashes exactly at boom, you don't get any more
>>>> instructions to execute.
>>>>
>>>> See.
>>>>
>>>> So this patch first increases dividers (only if necessary), changes
>>>> multipliers and waits for change to happen (takes around 2000 cycles=
),
>>>> and then decreases dividers (only if necessary).
>>>>
>>>> So we get:
>>>>
>>>> -1ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz
>>>>  0ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz   - no boom, multipli=
er
>>>>                                              reduced
>>>>  1ms: f0 =3D 24MHz, f1 =3D 1.5GHz, f2 =3D 0.75GHz
>>>> 1.9ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 0.5GHz - we got PLL sync
>>>>  2ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 1GHz   - and here we reduc=
e divider
>>>> at last
>>>
>>> Awesome explanation, thanks!
>>>
>>> So I guess it really all boils down to the fact that the CPU is
>>> clocked way outside of it's operating frequency while the PLL
>>> stabilizes, right?
>>
>> It may be, depending on the factors before and after change. I haven't=

>> tested what factors the mainline kernel calculates for each frequency.=

>> The arisc never uses M, and only uses P at frequencies that would not
>> allow for this behavior.
>>
>> I created a test program for arisc that runs a loop on the main CPU
>> using msgbox to send pings to the arisc CPU, and the vary the PLL1
>> randomly from the arisc, and haven't been able to lockup the main CPU
>> yet with either method.
>>
>> There's also AXI clock, that depends on PLL1. Arisc firmware uses the
>> same method to change it while changing CPUX clock. If the clock would=

>> rise above certain frequency, AXI divider is increased before the PLL1=

>> change. If it would fall below certain frequency it is decreased after=

>> the PLL1 change.
>=20
> If we ever need to change that, we can always rely on a clock notifier
> to adjust the divider before the change happen (and support all the
> scenarios, like the clock change has been aborted).
>=20
>>> If so, then yes, trying to switch to the 24MHz oscillator before
>>> applying the factors, and then switching back when the PLL is stable
>>> would be a nice solution.
>>>
>>> I just checked, and all the SoCs we've had so far have that
>>> possibility, so if it works, for now, I'd like to stick to that.
>>
>> It would need to be tested. U-boot does the change only once, while th=
e
>> kernel would be doing it all the time and between various frequencies
>> and PLL settings. So the issues may show up with this solution too.
>=20
> That would have the benefit of being quite easy to document, not be a
> huge amount of code and it would work on all the CPUs PLLs we have so
> far, so still, a pretty big win. If it doesn't, of course, we don't
> really have the choice.

It's probably more code though. It has to access different register from
the one that is already defined in dts, which would add a lot of code
and require dts changes. The original patch I sent is simpler than that.

regards,
  Ondrej

> Maxime
>=20


--wvbBQToQOt3eA67n26UaGSJJwX34bv2Si--

--XeDsBnWmvvKSRXMo8Ha5KRR6BRHhkeU0r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXkJtPAAoJEG5kJsZ3z+/xHgIP/Ak1CYPAXrFGYqQEXqigHCox
hZ5cKRwDlE3pG8eVnwIh6CY/AB/2AMweoXk3WYunVtCcSjkTLDBndDjUyj9J1rMP
e2m8ulPnPMdivX+6iPGY9Fo5mDuPsS63U+A6sAH5gen0RX7YGG/Oh9SSWvrXF4j1
fKX+HzUWEaCMdlux3PsZ1hgvdubfp2rYurr7iCbbn+1dGHlrUgMfj1qYkNExhmRz
nP3YGyMqrCWc0YYXeeXVLytG4uo5F7Y1RrH+3Dz3jz9gB8YmkhDxF7y7CJSzeTRL
xJhT/v3WAWdDABg/bHF/wo40VlRyowT2VlpjqhzQ4LEuEtSe7otKF2+df3eY3isg
L9VE+jBoJEcnwlAfpNkTFDFN+5B7oqD5u845CLy0a7ffVDVzad6wcF0eTvtW2+tB
L7rrIVapYl4iYeTA8/XWfGIM8I+XbPFcDS45nLWZ1mi6LfTkGYuq9DUaOWtlXvFU
c5nXjksqhscAKLOfT1cchZmDCpuByBW8y5PqBbBBc8rivZabu0Bky8zow0OSgKAo
xWhN0v7vRiFLf08fpgDuoiot2R1sk8GAjhyhnkIZK16sP3FgNgTnfh2ZrseyQJg1
4e3gw10jCFMDdpoJTMDOK3LW7VV8mmixRA8STjVbvzQ8A8kkYahv7Pok11QZsrxH
JYuRbZwRcgHeglHgY8wY
=/gti
-----END PGP SIGNATURE-----

--XeDsBnWmvvKSRXMo8Ha5KRR6BRHhkeU0r--
