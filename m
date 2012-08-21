From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 04/11] pinctrl: mvebu: add pinctrl driver for Armada 370
Date: Tue, 21 Aug 2012 09:12:41 +0200
Message-ID: <503334E9.508@free-electrons.com>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com> <1344689809-6223-5-git-send-email-sebastian.hesselbarth@gmail.com> <CACRpkdYNZar7865-T12J37h3AWA9-8R1R5tymuOhaB0b3ddEAA@mail.gmail.com> <50326A60.1070007@gmail.com> <20120820193622.4e539451@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120820193622.4e539451@skate>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Ben Dooks <ben.dooks@codethink.co.uk>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/20/2012 07:36 PM, Thomas Petazzoni wrote:
> Le Mon, 20 Aug 2012 18:48:32 +0200,
> Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> a =C3=A9crit =
:
>=20
>> this is really difficult here ;) I thought I could just add PINCTRL_=
DOVE
>> to MACH_DOVE inside ARCH_MVEBU, PINCTRL_KIRKWOOD to MACH_KIRKWOOD, a=
so.
>> But there is a common MACH_ARMADA_370_XP for both 370 and XP obvious=
ly.
>>
>> If it is ok for you I will add both PINCTRL_ stubs to the Kconfig an=
d
>> you work it out if you ever have two distinct MACHs? Or it could rem=
ain
>> selectable in pinctrl/Kconfig but that will then be different with t=
he
>> other stubs.
>=20
> In order to keep the consistency with other SoC families, maybe we ca=
n
> split the 370 and XP options in two separate MACH_ARMADA_370 and
> MACH_ARMADA_XP. So, in the ideal world, once all Marvell EBU SoCs are
> converted to DT+mach-mvebu, we should have:
>=20
>  *) arch/arm/Kconfig defines MACH_MVEBU
>=20
>  *) arch/arm/mach-mvebu/Kconfig defines MACH_KIRKWOOD, MACH_DOVE,
>     MACH_MX78X00, MACH_ARMADA_370, MACH_ARMADA_XP, MACH_ORION5X
>=20
> Then, an user is free to build a single kernel image that supports al=
l,
> or a selection of the supported Marvell EBU SoCs.

I agree with Thomas

>=20
> Thomas
>=20


--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
