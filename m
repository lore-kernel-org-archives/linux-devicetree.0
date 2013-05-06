From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [RFC patch 0/8] genirq: Support for irq domains in generic irq
 chip
Date: Mon, 6 May 2013 11:48:51 +0200
Message-ID: <20130506094851.GI23285@pengutronix.de>
References: <alpine.LFD.2.02.1305031514230.2886@ionos>
 <20130503212258.385818955@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130503212258.385818955@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Jean-Francois Moine <moinejf@free.fr>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Gregory Clement <gregory.clement@free-electrons.com>, Gerlando Falauto <gerlando.falauto@keymile.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, May 03, 2013 at 09:50:43PM -0000, Thomas Gleixner wrote:
> The ongoing device tree support for ARM is creating new irq chip
> drivers in drivers/irqchip/ in a frenzy. Quite some of them are
> ripping out the generic irq chip implementation from arch/arm/* and
> just creating the same mess of duplicated code again, which was
> cleaned up with the generic irq chip implementation with a lot of
> effort. Sigh!
>=20
> I already prodded a few people in reviews to tackle that issue with n=
o
> outcome. Even more sigh!
>=20
> Poor Sebastian triggered me into rant mode, but he ad hoc
> volunteered to give it a try. YAY!
>=20
> Though he asked for a bit of kickstart help. So I squeezed out a few
> spare cycles and implemented the basics as far as I think that they
> should work.
>=20
> The following series contains the missing bits and pieces including a
> somehow forgotten and now slightly modified series from Gerlando
> adding support for irq chips which need separate mask caches for
> different chip (control flow) types.
>=20
> At the moment this supports only linear irq domains, but it could be
> extended to other types as well if the need arises. Though the ARM
> chips are pretty much all about linear domains AFAICT.
Is there a tree/set of patches that have already fixed the issues
pointed out by Russell and Sebastian? I'd like to use it to get forward
with my nvic patch and want to avert double work and merging different
approaches.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
