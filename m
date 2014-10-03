From: Benoit Masson <benoitm@perenite.com>
Subject: Re: [PATCH 0/8] Armada XP pinctrl consolidation and ix4-300d fixes
Date: Fri, 3 Oct 2014 17:29:21 +0200
Message-ID: <A9781A2E-F3CA-4E8A-833C-D167B456D9F7@perenite.com>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com> <-7443282711873112734@unknownmsgid> <20141003141102.GJ3895@titan.lakedaemon.net> <542EBB93.108@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <542EBB93.108@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Benoit Masson <yahoo@perenite.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Le 3 oct. 2014 =E0 17:06, Sebastian Hesselbarth <sebastian.hesselbarth@=
gmail.com> a =E9crit :

> On 10/03/2014 04:11 PM, Jason Cooper wrote:
>> On Sun, Sep 21, 2014 at 04:11:23PM +0200, Benoit Masson wrote:
>>>> Le 19 sept. 2014 =E0 22:14, Sebastian Hesselbarth <sebastian.hesse=
lbarth@gmail.com> a =E9crit :
>>>> this is a patch set preparing barebox support for ix4-300d. As usu=
al,
>>>> I stumbled upon a few nice-to-haves before actually touching ix4-3=
00d
>>>> dts. As it is a mach-mvebu thing, I just added the related mailing
>>>> lists instead of each of the DT maintainers.
>>>>=20
>>>> First 5 patches consolidate SoC-specific pinctrl nodes to one comm=
on
>>>> node in armada-xp.dtsi, compatible overwrites for each SoC, and no=
de
>>>> alias usage for each board. Also, ge{0,1} pinctrl settings are mov=
ed
>>>> to the common node from one board specific node.
>>>>=20
>>>> Last 3 patches then use that ge{0,1} pinctrl settings on ix4-300d =
which
>>>> is vital for bootloader init. During exploration of ix4-300d, I al=
so
>>>> found a i2c eeprom that has not been added to the dts, yet. Finall=
y,
>>>> there is only one 74hc595 on ix4 mainboard while dts property is s=
et
>>>> for two.
>>>>=20
>>>> I cannot recall in detail what is on that eeprom, but IIRC it is n=
othing
>>>> important. Some reg,addr pairs for some init stuff that should hav=
e
>>>> already been done by stock u-boot. Anyway, adding the node will do=
 no
>>>> harm.
>>>>=20
>>>> Patches are based on v3.17-rc1 and intended for v3.18 but I am not=
 in
>>>> a hurry. I only compile tested this, so a formal Tested-by from Be=
noit
>>>> for the ix4 and any other Armada XP board would be great.
>>>=20
>>> I'm not sure what to test since I only receive some patch from the
>>> series of 8. Should I get all 8 or only those you sent me. I'll be
>>> able to test during next week.
>>=20
>> Did you ever get a chance to test this series?
>=20
> Uhm, I never prepared a branch for Benoit to test. I have pushed the
> patches with Thomas Acked-by's and renamed eeprom node based on
> v3.17-rc1 to
>=20
> https://github.com/shesselba/linux-dove.git devel/mvebu-ix4
>=20
Hi tahnks, that was my last question, because I was lost about which to=
 apply from the list of 8.

Also I've noted you did some other patch for Armada XP not related to i=
x-4-300d, are they included here or should I get them too ?

I'll test those over Sunday night.

Benoit
> Sebastian
