From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [RESEND PATCH 3/4] usb: dwc2: assert phy reset when waking up in rk3288 platform
Date: Mon, 29 Aug 2016 10:51:15 +0300
Message-ID: <87fupodnd8.fsf@linux.intel.com>
References: <4c931176-a09a-546c-d2b6-ea74028c78a2@cogentembedded.com> <1471807905-11323-1-git-send-email-ayaka@soulik.info> <49d2baf7-5f81-fc20-a805-f7a378d67a5e@synopsys.com> <76f0ffdb-a3c6-f1e6-8177-b254ff5badaa@rock-chips.com> <f6bbd88b-5d80-c30d-36c1-5b95763ae4bb@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f6bbd88b-5d80-c30d-36c1-5b95763ae4bb@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <John.Youn@synopsys.com>, Randy Li <randy.li@rock-chips.com>John Youn <John.Youn@synopsys.com>, Randy Li <ayaka@soulik.info>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>, "kishon@ti.com" <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <John.Youn@synopsys.com> writes:

[...]

>>>> +			 */
>>>> +			if (of_device_is_compatible(np, "rockchip,rk3288-usb"))
>>>> +				hsotg->phy->ops->reset(hsotg->phy);
>>>> +
>>>
>>> You should probably check for NULL before calling the reset()
>>> callback.
>> Sure.
>>>
>>> Also, I'd rather see a generic quirk property that you set for your
>>> platform.
>>>
>>> Something like "phy_reset_on_wakeup_quirk".
>> But Rob Herring want me to implied by the SoC specific compatible=20
>> string. I agree with him. It is certainly bug in RK3288 platform.
>> It is no found no the other platform.
>
> Ok, I missed that before.
>
> Based on the drivers I'm familiar with (like dwc3), you would
> typically add a "quirk" anyways.
>
> Felipe,
>
> Do you have some policy or preference on this?

if it's not a dwc2-generic feature, then let's do it via compatible
flag, sure. What we don't want is for things like:

if (is_compatible('synopsys') || is_compatible('rockchip') ||
	is_compatible('foobar') ... )

For that, we'd be better of adding a generic quirk flag which several
can use.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJXw+lzAAoJEIaOsuA1yqRE4SUP/A3MJ1Yw79yme/0ZA7j6z8Qg
qD6RTfAH8MWzWs1WLEEQcrrJxsJqqORE11umYRnUyXryuwD3M+s0cDE/+OF3h/D8
PfgIJHY5eVF69NpPp9XM954ZeKHCvrFVknKcaBDyAO6obFxTRPj+oJ++his1NZml
bkzGJBoyjp4Pb9QeuSC8zM1NnPbQ0JZs5aI97QEGPhHySDOhWe/L+J+DY7m1gsU3
ELvLBChwDhCs0azU5hiQ+lHCuZcCiOtygaWr0kKtDxxMWQ4PU2R8gguBRrtYUTEm
lGAypkq8okLlsVZRqNa9uyeakh7rua1tM0EhZN+OQcRHUpfWGdvXqhjk4IDkWH4X
5ku06bwjX5AQ13JFF1Rv9uwz9H8clBIR/hbity++2jjGATwZpAwzQnAzpklrw+Ys
e4eXgpBMox5AC5+8SaWm/mkXJWq7f7ZTZMKVxcSUXzewaEgZMUVlcwbpS7caMc9s
OAN18VqFbggGHZYYRmaekUZGe8TAQcPEne2jFdGKzua9Oq9SpWWkd2TEKWnlF5uc
FLY6cQ74LSJeTb5UWXTbaH3Ttr3pg2ZaDfq/w82VDbIBQJBCispTQsZpK6C1er2t
Dj57RYgdJe7Z0fkSTvErtwuo6pIqchg2NP5leC2GnT1Uj6QqusaH+mmmlRss6dM4
E4wiVX7oQf2KAArNjjsX
=RJOM
-----END PGP SIGNATURE-----
--=-=-=--
