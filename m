From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 8/9] ARM: dts: Add leds support to STM32F429 Discovery
 board
Date: Tue, 27 Oct 2015 22:37:09 +0100
Message-ID: <562FEE85.3010204@suse.de>
References: <1445102604-11502-1-git-send-email-mcoquelin.stm32@gmail.com>
 <1445102604-11502-9-git-send-email-mcoquelin.stm32@gmail.com>
 <CACRpkdYjq9XqKM4imYsaa_HBopS7uFnbb6gf=hRZHGC4baafAg@mail.gmail.com>
 <CALszF6Bo3x4jWnvDc=28s=517YJrv2=3BuuYmxjqP4ciF17fcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALszF6Bo3x4jWnvDc=28s=517YJrv2=3BuuYmxjqP4ciF17fcQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>
List-Id: devicetree@vger.kernel.org

Am 27.10.2015 um 21:31 schrieb Maxime Coquelin:
> 2015-10-26 14:41 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
>> Usually people also want to add a default linux,trigger to these,
>> like linux,default-trigger =3D "heartbeat"; but whatever you prefer.
>=20
> Makes sense, I will add default trigger in next version.

Previously, consensus seemed to be not to use heartbeat as default, but
rather off or on.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
