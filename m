From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 1/4] arm64: dts: marvell: Clean up armada-3720-db
Date: Thu, 07 Apr 2016 12:00:51 -0700
Message-ID: <878u0pjlb0.fsf@free-electrons.com>
References: <1458771861-12392-1-git-send-email-afaerber@suse.de>
	<1458771861-12392-2-git-send-email-afaerber@suse.de>
	<87zitnn9ds.fsf@free-electrons.com> <56F419CA.9010400@suse.de>
	<87oaa3m0qj.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87oaa3m0qj.fsf@free-electrons.com> (Gregory CLEMENT's message of
	"Fri, 25 Mar 2016 09:16:04 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Andreas,
=20
 On ven., mars 25 2016, Gregory CLEMENT <gregory.clement@free-electrons=
=2Ecom> wrote:

> Hi Andreas,
> =20
>  On jeu., mars 24 2016, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>
>> Hi Gregory,
>>
>> Am 24.03.2016 um 17:11 schrieb Gregory CLEMENT:
>>>> +/*
>>>> + * Exported on the micro USB connector CON32
>>>> + * through an FTDI
>>>> + */
>>>=20
>>> As the comment didn't start anymore from the middle of the line, we
>>> could have it an a single line. We don't have to split in 2 lines.
>>
>> Sure. Should I change that along with 4/4 in a v2? It'll be after th=
e
>> Easter holidays.
>
> Yes please and no problem for wiating for after the Easter holidays I
> won't apply the patch on the mvebu branches before the release of the
> v4.6-rc1.

Do you think you could send a v2 of the serie soon?

I would like to have it in the mvebu/dt64 tree as it will impact all th=
e
next patches aimed for these files.

Thanks,

Gregory

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
