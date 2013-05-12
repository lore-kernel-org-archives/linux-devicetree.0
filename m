From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [patch 8/8] irqchip: sun4i: Convert to generic irq chip
Date: Sun, 12 May 2013 16:14:19 +0200
Message-ID: <518FA3BB.7060806@free-electrons.com>
References: <20130503212258.385818955@linutronix.de> <20130506142348.321859745@linutronix.de> <20130506142539.523110430@linutronix.de> <518FA24D.80203@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <518FA24D.80203@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Arnd Bergmann <arnd@arndb.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, Gerlando Falauto <gerlando.falauto@keymile.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Le 12/05/2013 16:08, Maxime Ripard a =E9crit :
> Hi Thomas,
>=20
> Le 06/05/2013 16:30, Thomas Gleixner a =E9crit :
>> Proof of concept patch to demonstrate the new irqdomain support for
>> the generic irq chip. Untested !!
>>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> I just tested it, and with the minor patch I sent, it's working fine.
>=20
> You can add my
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

After addressing the comments RobH already made that is.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
