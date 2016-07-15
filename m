From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor
 rate application method
Date: Fri, 15 Jul 2016 15:48:45 +0200
Message-ID: <98fd2ab2-9b1d-1494-5867-7701780fd471@megous.com>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160715152756.db7375a7109fed18c2fbf43a@free.fr>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KmgnLmkqgdgnO5bMbpkTqKQqxG8nCQ41j"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBQ6TUO6AKGQE43VF2XY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160715152756.db7375a7109fed18c2fbf43a-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KmgnLmkqgdgnO5bMbpkTqKQqxG8nCQ41j
Content-Type: multipart/mixed; boundary="miiIr03PtmOqRMm3Pe6HI9wjTxPb1P1Ie"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>,
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org,
 Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>,
 Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, open list
 <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?=
 <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>,
 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Message-ID: <98fd2ab2-9b1d-1494-5867-7701780fd471-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
References: <20160625034511.7966-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160625034511.7966-7-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160715152756.db7375a7109fed18c2fbf43a-GANU6spQydw@public.gmane.org>
In-Reply-To: <20160715152756.db7375a7109fed18c2fbf43a-GANU6spQydw@public.gmane.org>

--miiIr03PtmOqRMm3Pe6HI9wjTxPb1P1Ie
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 15.7.2016 15:27, Jean-Francois Moine wrote:
> On Fri, 15 Jul 2016 12:38:54 +0200
> Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
>=20
>>> If so, then yes, trying to switch to the 24MHz oscillator before
>>> applying the factors, and then switching back when the PLL is stable
>>> would be a nice solution.
>>>
>>> I just checked, and all the SoCs we've had so far have that
>>> possibility, so if it works, for now, I'd like to stick to that.
>>
>> It would need to be tested. U-boot does the change only once, while the
>> kernel would be doing it all the time and between various frequencies
>> and PLL settings. So the issues may show up with this solution too.
>=20
> I don't think this is a good idea: the CPU clock may be changed at any
> time with the CPUFreq governor. I don't see the system moving from
> 1008MHz to 24MHz and then to 1200MHz when some computation is needed!

PLL lock time is around 10-20us, I'd guess based on the number of loops
in the PLL lock wait loop. So unless you'll be switching frequencies
many times per second, this should be barely noticeable.

But I'd like a different solution too.

> BTW, Ond=C5=99ej, in my BPi M2+, I tried to change the CPU clock with you=
r
> code at kernel start time from 792MHz to 1008MHz, but the hardware
> (arisc?) set an other value, and the system speed was lower than before
> (the PLL-CPUx register is 0x90031521 on boot, I want to set it to
> xxxx1410 and I read 0x91031f33 - sorry, I did not have a look at the
> CPU SD pattern). Do you know why?

No idea. Arisc shouldn't do anything, unless you load some firmware into
it, and release its reset line.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--miiIr03PtmOqRMm3Pe6HI9wjTxPb1P1Ie--

--KmgnLmkqgdgnO5bMbpkTqKQqxG8nCQ41j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXiOnAAAoJEG5kJsZ3z+/xrzAQAJoyDUll8xflmcvzSA49xaGN
9bZLflgmdzc7fQhN0eb1fgwU1SKQJI0LLHsRBOXE6mG7Vhoa5KuJkCfsCg4fGPYV
LLz92dUUMB9/Rjakv984uJ3I5tU7UI55caf3gmwv+foZ37UlTbN6vRpoA95eUY2C
NqqsSsanPhSDXZSXhThc+UTjfFpETpiCCef0tcGe/w1sjnE/vqblalsFw1FIBIki
HRdqURwTqVmhZZgGJy6jSTleKdR1/LEMk+5BhYRKIWFUEgEgslsu7Zhi2PBPA9Z/
zH2g+m3Q+ubvzkf26KqxywkLQHZWojNU08hHPUgRicNd+Yv7nsvF7WNgT0qryIBX
GhTVmJ7/py1oVtycgYIL3DnMKyUL/d+iZh23nZ74EtKAxDpWdJ0SKDIiCSUvZDCq
0zz7ynpdSlF5nSSMcGqzRRL1/JofQqZP4bxd/xGbn64G5oaUWvlNve+Vd8FHZyDO
//Qg0VJhAcqkS9I5FNfJCysg1mMDZf66qTZcsW5XDy3kBOADR3MQp2uZco2Fut0P
G+5mYwGzX18XnFp6XMEdntqyn3rEOV7RLQSXoxWyuptQz4MiRU3zsQJaGoH5x7U3
qzm4QUNQC8lTtU1iJO27anStLiXUVMqMGf7OCGgp5NgsLZyQHTztedu3OhK3pcjl
/CXubrQdwQO7+um4C8BP
=x2AH
-----END PGP SIGNATURE-----

--KmgnLmkqgdgnO5bMbpkTqKQqxG8nCQ41j--
