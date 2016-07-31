From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: Changed: sunxi-ng clock code - NKMP clock
 implementation is wrong
Date: Mon, 1 Aug 2016 00:01:39 +0200
Message-ID: <9175af7e-e1b1-df88-de2b-16f0e8d719c1@megous.com>
References: <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160721094852.GI5993@lukather>
 <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
 <20160726063253.GW7419@lukather>
 <e1b8127f-c422-46ab-384b-aeee85aa940b@megous.com>
 <20160728210011.GJ6682@lukather>
 <7c5f2835-f044-7c18-def9-52af5ce4afc3@megous.com>
 <20160731103114.GY6215@lukather>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JWaS5ruaG9vNv4hWMkfGISRGo3KRbiw2p"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBS7K7G6AKGQETVVLYZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160731103114.GY6215@lukather>
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
--JWaS5ruaG9vNv4hWMkfGISRGo3KRbiw2p
Content-Type: multipart/mixed; boundary="wGiGXrNbW19ioja3tDbj0dl0i2IBCnLob"
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
Message-ID: <9175af7e-e1b1-df88-de2b-16f0e8d719c1-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: Changed: sunxi-ng clock code - NKMP clock implementation is wrong
References: <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160721094852.GI5993@lukather>
 <c46d1af5-9410-402a-7144-48b396ef6da7-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160726063253.GW7419@lukather>
 <e1b8127f-c422-46ab-384b-aeee85aa940b-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160728210011.GJ6682@lukather>
 <7c5f2835-f044-7c18-def9-52af5ce4afc3-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160731103114.GY6215@lukather>
In-Reply-To: <20160731103114.GY6215@lukather>

--wGiGXrNbW19ioja3tDbj0dl0i2IBCnLob
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 31.7.2016 12:31, Maxime Ripard wrote:
> Hi,
>=20
> On Fri, Jul 29, 2016 at 12:01:09AM +0200, Ond=C5=99ej Jirman wrote:
>> On 28.7.2016 23:00, Maxime Ripard wrote:
>>> Hi Ondrej,
>>>
>>> On Thu, Jul 28, 2016 at 01:27:05PM +0200, Ond=C5=99ej Jirman wrote:
>>>> Hi Maxime,
>>>>
>>>> I don't have your sunxi-ng clock patches in my mailbox, so I'm replyin=
g
>>>> to this.
>>>
>>> You can find it in the clock maintainers tree:
>>> https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git/log/?h=3Dclk=
-sunxi-ng
>>>
>>>> On 26.7.2016 08:32, Maxime Ripard wrote:
>>>>> On Thu, Jul 21, 2016 at 11:52:15AM +0200, Ond=C5=99ej Jirman wrote:
>>>>>>>>> If so, then yes, trying to switch to the 24MHz oscillator before
>>>>>>>>> applying the factors, and then switching back when the PLL is sta=
ble
>>>>>>>>> would be a nice solution.
>>>>>>>>>
>>>>>>>>> I just checked, and all the SoCs we've had so far have that
>>>>>>>>> possibility, so if it works, for now, I'd like to stick to that.
>>>>>>>>
>>>>>>>> It would need to be tested. U-boot does the change only once, whil=
e the
>>>>>>>> kernel would be doing it all the time and between various frequenc=
ies
>>>>>>>> and PLL settings. So the issues may show up with this solution too=
.
>>>>>>>
>>>>>>> That would have the benefit of being quite easy to document, not be=
 a
>>>>>>> huge amount of code and it would work on all the CPUs PLLs we have =
so
>>>>>>> far, so still, a pretty big win. If it doesn't, of course, we don't
>>>>>>> really have the choice.
>>>>>>
>>>>>> It's probably more code though. It has to access different register =
from
>>>>>> the one that is already defined in dts, which would add a lot of cod=
e
>>>>>> and require dts changes. The original patch I sent is simpler than t=
hat.
>>>>>
>>>>> Why?
>>>>>
>>>>> You can use container_of to retrieve the parent structure of the cloc=
k
>>>>> notifier, and then you get a ccu_common structure pointer, with the
>>>>> CCU base address, the clock register, its lock, etc.
>>>>>
>>>>> Look at what is done in drivers/clk/meson/clk-cpu.c. It's like 20 LoC=
.
>>>>>
>>>>> I don't really get why anything should be changed in the DT, or why i=
t
>>>>> would add a lot of code. Or maybe we're not talking about the same
>>>>> thing?
>>>>
>>>> I've looked at the new CCU code, particularly ccu_nkmp.c, and found th=
at
>>>> it very liberally uses divider parameters, even in situations that are
>>>> out of spec compared to the current code in the kernel.
>>>>
>>>> In the current code and especially in the original vendor code, divide=
r
>>>> parameters are used as last resort only. Presumably because, of the
>>>> inherent trouble in changing them, as I described to you in other emai=
l.
>>>>
>>>> The new ccu code uses dividers often and even at very high frequencies=
,
>>>> which goes against the spec.
>>>>
>>>> In the vendor code M is never anything else but 0, and P is used only
>>>> for frequencies below 288MHz, which matches the H3 datasheet, which sa=
ys:
>>>
>>> In the vendor code, P is never used either. All the boards we had so
>>> far don't go that low, so we cannot make any of these assumptions,
>>> especially since the vendor code has had the bad habit of doing
>>> something wrong and / or useless in the past.
>>
>> P is used in the arisc firmware according to the spec for the lower
>> frequencies.
>=20
> Yes, but has anyone actually tested those frequencies? Judging from
> the FEX files I could gather, cpufreq never actually goes lower than
> 480 MHz.
>=20

I tested it. It works well down to 60MHz. You can even run on 24MHz if
you run directly from 24mhz osc. It's terribly slow, but it works ok.

I've rebased my working branch over the mainline kernel, which now
contains the sunxi-ng, and tested it. Cpufreq seems to work on orange pi
pc without any changes discussed in this thread. I didn't do any
extensive testing though. But it doesn't hang on boot or cpufreq config
changes.

You can see it here:

https://github.com/megous/linux/commits/orange-pi-4.8

>>> However, this implementation is a new thing, and it was using the H3
>>> precisely because of its early stage of support to use it as a testbed
>>> for the more established.
>>>
>>> If you feel like we should use a different formula to favour the
>>> multipliers over the dividers (or want to change the class of the CPU
>>> PLL to an NKM or something else, this is totally doable.
>>
>> I think the original formula that's currently in the mainline kernel is
>> better and avoids fiddling with dividers too much.
>=20
> Yeah, but the older formula is not generic at all. The whole rework
> was precisely to avoid doing the whole one driver per clock that was
> just becoming a nightmare to maintain, and a pain to add support for
> new SoCs. That code will be used for A10's CPU and VE PLLs too for
> example. And they probably have the same constraints, but with
> different variations (available values of each factors for example).

Fair enough.

>>>> "The P factor only use in the condition that PLL output less than 288
>>>> MHz."
>>>
>>> And the datasheet also had some issues, either misleading or wrong
>>> comments in the past. Don't get me wrong, I'm not saying that this is
>>> wrong, just that we should not follow it religiously, and that we
>>> should trust more the experiments than the datasheet.
>>
>> I can believe that. :) Regardless, I think the reasons given for
>> avoiding dividers are quite reasonable. It's based on how PLL block
>> works, not what manual says.
>=20
> Yes, indeed.
>=20
> Would replacing the current factors computation function by something
> like:
>=20
> for (m =3D 1; m < max_m; m++)
>     for (p =3D 1; p < max_p; p++)
>         for (n =3D 1; n < max_n; n++)
> 	     for (k =3D 1; k < max_k; k++)
> 	         if rate =3D=3D computed rate
> 		     break;
>=20
> work for you?

This would be better.

thank you and regards,
  Ondrej

> That way, we will favor the multipliers over the dividers, and we can
> always "blacklist" p or m (or both) by setting their maximum to 1
> (this would need an extra field in _ccu_div though).
>=20
>>>> Also other datasheets of similar socs from Allwinner state that M shou=
ld
>>>> not be used in production code.
>>>
>>> Which ones specifically?
>>
>> A83T for example. You can search for "only for test" phrase.
>>
>> https://github.com/allwinner-zh/documents/blob/master/A83T/A83T_User_Man=
ual_v1.5.1_20150513.pdf
>>
>> Those PLLs are a bit different though.
>=20
> Thanks,
> Maxime
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--wGiGXrNbW19ioja3tDbj0dl0i2IBCnLob--

--JWaS5ruaG9vNv4hWMkfGISRGo3KRbiw2p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXnnVHAAoJEG5kJsZ3z+/xHCIP/i1giaKN025CVSjHQP+nlJJN
+JNs8LZZx9m7RDqrm3dlFQLU7FMXtIoIZN8JFuo1dnNnGu35+IpQJegHtYcYyBlN
uO88kauL8E5WuB3ERqygZWkv8/nVtZqUI6tVtkPfFrm3LFPwc4FlwN5w3GSVCybh
DXi9TGpAJWcmniu8SulG+WNg1g+RByv2nGMXWrPNC3HDhVnoZc0+Jl5YRI4BZr2i
OnMXV1VJ4sC/sABpTdTKCzP3Dzvul4XeC1QU3UoerQjhiN+6XuEyhZVYDcXLWjPS
gPd3q9c7bBX0i1aoDMJe94srrJsbbJ3Qqsstqbk1lt7CYTQdcmTMyP+MQ1WoUu8K
Og/tVa67t2VZbkFbtPk9nGM4phux/VQ6xUYXoYFUfNkkUOT9rOcoXQbDeEg3luj1
5PMkAG+tvY87v61+xch0Y3AzoY+/+Xi7QlMAnRIEMUmXz/SSo67ihs4yzWa7v3fl
E+D5rvueqxY9aYNEXs3egNGrPFKvyFURWfddUn83lIhgmbQUi5PyOGW0iLQJD2qA
L96noHg/A5wwcqZF8VaD7NTEAPaQR24kXFSQdmmPrpq9eENyhaYcLTqGxKQ+Ie9P
vpBjR2pCil8/Fv0vgSJQHNVxwA87OKeasfCK/KLjPdd1MEgSDKuhiGN6/FIuODc6
GiTcdeJEAVfyAHi1OhWt
=tg/u
-----END PGP SIGNATURE-----

--JWaS5ruaG9vNv4hWMkfGISRGo3KRbiw2p--
