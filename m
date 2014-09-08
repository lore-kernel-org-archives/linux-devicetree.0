From: robert.jarzmik@free.fr
Subject: =?utf-8?Q?Re=C2=A0:_Re:_[PATCH_]_ARM:_pxa:_fix_section_?=
 =?utf-8?Q?mismatch_warning_for_pxa=5Ftimer=5Fnodt=5Finit?=
Date: Mon, 8 Sep 2014 04:21:59 +0200 (CEST)
Message-ID: <2043099673.69233100.1410142919959.JavaMail.root@zimbra1-e1.priv.proxad.net>
References: <3188925.pjYA4K7kjn@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3188925.pjYA4K7kjn@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, arm@kernel.org
List-Id: devicetree@vger.kernel.org

Yes please Arnd, I'm still out for 1.5 week, so it would be great if yo=
u take that through your tree with my ack. Thanks.

Robert

PS: I know, top-posting is madness, but I'm really limited by technolog=
y right now.

----- Mail d'origine -----
De: Arnd Bergmann <arnd@arndb.de>
=C3=80: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Lezcano <daniel.l=
ezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@=
vger.kernel.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linu=
tronix.de>, arm@kernel.org
Envoy=C3=A9: Sun, 07 Sep 2014 23:06:05 +0200 (CEST)
Objet: Re: [PATCH ] ARM: pxa: fix section mismatch warning for pxa_time=
r_nodt_init

On Saturday 26 July 2014 20:50:36 Arnd Bergmann wrote:
> commit a38b1f60b5245a3 ("ARM: pxa: Add non device-tree timer link to
> clocksource") introduced a harmless section mismatch warning for
> all pxa platforms, by introducing a new pxa_timer_init() function
> that is not marked __init but that calls pxa_timer_nodt_init(),
> which is. The function is only called at init time, so it is safe
> to also annotate it this way.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20

Apparently this is not merged yet, should we take it through arm-soc?

diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index 630fa916bbc6..04b013fbc98f 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -61,7 +61,7 @@ EXPORT_SYMBOL(get_clock_tick_rate);
 /*
 * For non device-tree builds, keep legacy timer init
 */
-void pxa_timer_init(void)
+void __init pxa_timer_init(void)
 {
 pxa_timer_nodt_init(IRQ_OST0, io_p2v(0x40a00000),
 get_clock_tick_rate());
