From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v5 2/2] arm: pxa27x: support for ICP DAS LP-8x4x w/ DT
Date: Tue, 15 Dec 2015 21:01:35 +0100
Message-ID: <8760zziiqo.fsf@belgarion.home>
References: <1449700088-28076-3-git-send-email-ynvich@gmail.com>
	<87a8pbio2u.fsf@belgarion.home> <1450205413.21989.44.camel@gmail.com>
	<4511402.o53nMsg37l@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4511402.o53nMsg37l@wuerfel> (Arnd Bergmann's message of "Tue, 15
	Dec 2015 20:21:31 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sergei Ianovich <ynvich@gmail.com>, linux-kernel@vger.kernel.org, Daniel Mack <zonque@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Arnaud Ebalard <arno@natisbad.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> On Tuesday 15 December 2015 21:50:13 Sergei Ianovich wrote:
>> On Tue, 2015-12-15 at 19:06 +0100, Robert Jarzmik wrote:
>> Updated plan:
>> 1. MACH_PXA27X_DT
>> 2. PXA_FB and 8250_PXA to enable console
What about gpio-pxa ? And maybe pinctrl-pxa27x (only in linux-next by now) ? Can
a pxafb work without gpio-pxa ? Also usually for pxafb you have pwm and pwm_bl
to see something.

>> 3. MMC, MMC_PXA and EXT4_FS to enable boot from MMC
>> 3.1. MTD, MTD_CFI, MTD_PHYSMAP_OF and JFFS2_FS to enable boot from MTD
Ok. Is pxa2xx-pcmcia out of scope ? I seem to remember we have several boards
where pcmcia is the rootfs (even if that is a small mess right now I still have
to work on). Or do we consider pcmcia as obsolete ?

>> 4. all optional pxa stuff as modules
>> 5. all stuff on supported pxa boards as modules
>> 6. supported boards should boot the kernel built with
>> `pxa27x-dt_defconfig` after `make olddefconfig`
>> 
>> It is probably a good idea to put this plan somewhere in Documentation/
>> and to have a comment about that in the defconfig itself.
>> 
>> Is the plan acceptable?
>
> Sounds good to me.
Sounds good to me too.

Cheers.

-- 
Robert
