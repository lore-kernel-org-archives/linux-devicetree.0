From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v5 2/2] arm: pxa27x: support for ICP DAS LP-8x4x w/ DT
Date: Sat, 19 Dec 2015 13:27:07 +0100
Message-ID: <87h9jehbdw.fsf@belgarion.home>
References: <1449700088-28076-3-git-send-email-ynvich@gmail.com>
	<7496839.vMjVcqPe8Q@wuerfel> <1450197727.21989.9.camel@gmail.com>
	<1843454.zCnLJtF7B6@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1843454.zCnLJtF7B6@wuerfel> (Arnd Bergmann's message of "Tue, 15
	Dec 2015 18:02:19 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sergei Ianovich <ynvich@gmail.com>, linux-kernel@vger.kernel.org, Daniel Mack <zonque@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Arnaud Ebalard <arno@natisbad.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> I would like those drivers to be enabled in some defconfig, so we get
> compile-time coverage, but we generally stopped having one-config-per-board
> files.
>
> Maybe we can have a pxa_defconfig file that enables lots of boards
> and then we remove the individual configs? We don't have to remove
> them all at once, but it would make me very happy if we could at
> least kill off some of the ones that are not used regularly.

I'll take that part, the pxa_defconfig which covers all pxa boards in
arch/arm/mach-pxa. I have a prototype, which of course doesn't boot on any of my
pxa platforms (breaks in the very early bootstrap code I think, DEBUG_LL is the
next stage).

Actually I've not even looked if a single kernel covering pxa2xx and pxa3xx is
possible (since recently clock handling was a blocker).

Once I have something that at least shows me a sign of life, I'll submit an RFC
patch. This work will be orthogonal to Sergei's one, as it is aimed at having
one defconfig compiling all mach-pxa/*.c files and the drivers referenced by
them. This won't allow removing defconfig files until I have a good idea why my
boards are not booting (lubbock, mainstone, mioa701, zylonite, cm-x300).

Cheers.

-- 
Robert
