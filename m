From: Andrew <andrew@ncrmnt.org>
Subject: Re: Fwd: Re: [PATCH 2/2] ARM: mvebu: dts: Add dts file for DLink  DNS-327L
Date: Sun, 03 May 2015 14:37:59 +0300
Message-ID: <072d4c1171194abcb0bf753ce5a2e776@mail.ncrmnt.org>
References: <b6534b962d2cf9d21cb72d43f19a6574@mail.ncrmnt.org>
 <552A6209.9040903@gmail.com>
 <cd7445f789f1082f464d464f77807f12@mail.ncrmnt.org>
 <20150412145857.GA14038@lunn.ch>
 <b172d775afa24cea69a9490f531c6b37@mail.ncrmnt.org>
 <20150412194735.GA27921@lunn.ch> <552BCFAA.2020109@free-electrons.com>
 <1ec8906f00468ca5a9fa227f8c83fe69@mail.ncrmnt.org>
 <55351569.7000307@free-electrons.com>
 <d28764ea5d0d5f4c2e5d3e9ca1d7217a@mail.ncrmnt.org>
 <55351898.60604@free-electrons.com>
 <4e7e91562aac6a260885bf2d12174060@mail.ncrmnt.org>
 <5545FF6D.9040205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5545FF6D.9040205@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Sebastian Hesselbarth =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 03.05.2015 13:58:
> On 03.05.2015 12:18, Andrew wrote:
> [...]
>> Sorry for the long delay with testing, but here come the results.
>> I've rebased everything to 4.1-rc1
>>=20
>> 1. WFI + DeepIdle =3D> freeze after approx:
>>    * 1 hours and 30 minutes, first test
>>    * 3 hours and 40 minutes, second test
>> 2. WFI only (DeepIdle disabled via sysfs) =3D> Still alive after 13=20
>> hours
>> and counting
>>=20
>> The proper patchset will follow as soon as I figure out what change=20
>> broke
>> dns320l-daemon (The utility that speaks to weltrend mcu on ttyS1)
>> It was working on 3.18.6, on 3.19 and up - it writes data to the por=
t
>> (and mcu acks it),
>> but can't read any responses.
>>=20
>> Same thing happens to the python (pyserial inside) implementation of=
=20
>> the
>> fan-daemon:
>> https://github.com/martignlo/DNS-320L
>=20
> Andrew,
>=20
> did you realize that you request a non-standard UART baudrate in your
> python code above:
>=20
> port =3D serial.Serial("/dev/ttyS1", 115600, 8, "N", 1, 0.1)
>=20
> s/115600/115200/
>=20
> Does that fix your communication issues?
>=20
> Sebastian


If life was that simple ;-)
Unfortunately that's not the issue.
dns320l-daemon ( http://www.aboehler.at/hg/dns320l-daemon ) uses correc=
t=20
115200 baud and
doesn't work either.
Since I can transmit, but can't receive, I will be first checking out=20
mpp settings
If that doesn't help, I guess it's git-bisect time.


--=20
Regards,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
