From: Benoit Masson <benoitm@perenite.com>
Subject: Re: [PATCH 0/8] Armada XP pinctrl consolidation and ix4-300d fixes
Date: Wed, 15 Oct 2014 17:35:13 +0200
Message-ID: <B4E62BBB-856D-48E9-B694-C6149DB0E864@perenite.com>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com> <-7443282711873112734@unknownmsgid> <20141003141102.GJ3895@titan.lakedaemon.net> <542EBB93.108@gmail.com> <A9781A2E-F3CA-4E8A-833C-D167B456D9F7@perenite.com> <542EC3A3.1060605@gmail.com> <1ACB5318-863E-40D8-8B27-41F1C0D0A4B8@perenite.com> <5432BFB1.2060300@gmail.com> <CE7A9795-C2AF-451A-8018-3A0B8788BF60@perenite.com> <1CDF8F6B-42FF-4D6A-B52F-6DB270F2673C@perenite.com> <20141015144123.GA18413@lunn.ch>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141015144123.GA18413@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Benoit Masson <yahoo@perenite.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Le 15 oct. 2014 =E0 16:41, Andrew Lunn <andrew@lunn.ch> a =E9crit :

>>> All the 3 branch works WHEN APPLYING A0 patch (below), with both my=
 custom kernel config and the arch/arm/configs/mvebu_v7_defconfig
>> Just one thing though, one of my cron behavior change with 3.17, whe=
n I use the cmd  "/sbin/hwclock --adjust -f /dev/rtc1" I get this new e=
rror I never had before:
>> "hwclock: select() to /dev/rtc1 to wait for clock tick timed out: Su=
ccess"
>>=20
>> where rtc1 if the i2c rtc connected to the i2C bus, can this be rela=
ted to the i2c patch that would slow down i2c operation or somthing ?=20
>=20
> Hi Benoit
>=20
> It won't fix your problem, but if the built in RTC is not usable, it
> would be good to disable it in the .dts file. The i2c RTC will then
> become RTC0.
>=20
>=20
> The actual "error" message is odd:
> "hwclock: select() to /dev/rtc1 to wait for clock tick timed out: Suc=
cess"
>=20
Yes this is the wired thing is that everything works, even getting the =
date via "cat /sys/class/i2c-adapter/i2c-0/0-0051/rtc/rtc1/time" is ok
reading the rtc driver code it seems this message is shown when multipl=
e resources try to access shared rtc... but why now and not before ?

So I was wondering if the i2c_quirk() applied by the batch has any effe=
ct with this ?

Anyhow I'll handle the message for now and see if there are performance=
 impact on this...

Benoit

> Success means it actually worked, not an error. Does the RTC contain
> the correct time afterwards?
>=20
>    Andrew
