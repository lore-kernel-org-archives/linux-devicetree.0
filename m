From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v2 00/11] ARM: dts: zynq: Prepare Parallella
Date: Tue, 21 Oct 2014 23:07:58 +0200
Message-ID: <5446CB2E.4080503@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>	<CAOesGMjAb5oXjauhbqjDhJXWct7qoXxy3XpA1=DioK7vPTwetA@mail.gmail.com>	<5446C775.3030707@suse.de> <CAOesGMhSuvbWpM5CC_5Hy6BskM6sbrw0SCR90aKHvfk1Qm1_Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMhSuvbWpM5CC_5Hy6BskM6sbrw0SCR90aKHvfk1Qm1_Ng@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: devicetree@vger.kernel.org

Am 21.10.2014 um 23:01 schrieb Olof Johansson:
> On Tue, Oct 21, 2014 at 1:52 PM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>> Am 18.10.2014 um 06:28 schrieb Olof Johansson:
>>> I did a test run with yesterday's -next It looks like networking is=
n't
>>> working there at the moment, clock related. Same happens with 3.17 =
and
>>> latest mainline, config multi_v7_defconfig:
>>>
>>> [WARN] [    7.943648] macb e000b000.ethernet eth0: unable to genera=
te
>>> target frequency: 125000000 Hz
>>> [WARN] [   10.948681] macb e000b000.ethernet eth0: unable to genera=
te
>>> target frequency: 125000000 Hz
>>
>> I am unable to reproduce this in my setup - at Linus' tip
>> c2661b806092d8ea2dccb7b02b65776555e0ee47 (v3.18-rc1-68-gc2661b8), ma=
ke
>> oldconfig'ing my /proc/config.gz.
>>
>> S=C3=B6ren, in light of your explanations, should I be expecting pro=
blems
>> with 1GbE or with 100MbE? My board is connected to a 1GbE switch.
>=20
> My board might have old firmware/bitstream on it? It reports as:
>=20
> U-Boot 2012.10-00003-g792c31c (Jan 03 2014 - 12:24:08)

Mine reports the same version.

sha512sum of non-headless bitstream:
decb37222a7da0de39b1c1eb95714500cc006506cc86d85ed9c6c7b30c7cd7b91ef3592=
b886311f4285b5ce0079b4ffcd83f91ae275435ac15cefefe7db00b08
 /mnt/parallella.bit.bin

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
