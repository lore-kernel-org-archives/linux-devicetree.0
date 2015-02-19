From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/4] arm: am33xx: DT quirks for am33xx based beaglebone
 variants
Date: Thu, 19 Feb 2015 10:57:56 -0800
Message-ID: <20150219185756.GA8611@roeck-us.net>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1424271576-1952-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20150219181656.GF32521@atomide.com>
 <9C7BFC7C-0751-4233-927F-D01AF078704B@antoniou-consulting.com>
 <20150219183600.GG32521@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150219183600.GG32521@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Pantelis Antoniou <panto@antoniou-consulting.com>, Grant Likely <grant.likely@secretlab.ca>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Ludovic Desroches <ludovic.desroches@atmel.com>, Rob Herring <robherring2@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 19, 2015 at 10:36:00AM -0800, Tony Lindgren wrote:
> * Pantelis Antoniou <panto@antoniou-consulting.com> [150219 10:32]:
> > > On Feb 19, 2015, at 20:16 , Tony Lindgren <tony@atomide.com> wrot=
e:
> > >=20
> > > Uhh I don't like the idea of duplicating the i2c-omap.c driver un=
der
> > > arch/arm.. And in general we should initialize things later rathe=
r
> > > than earlier.
> > >=20
> > > What's stopping doing these quirk checks later on time with just
> > > a regular device driver, something like drivers/misc/bbone-quirks=
=2Ec?
> > >=20
> >=20
> > We have no choice; we are way early in the boot process, right afte=
r
> > the device tree unflattening step.
>=20
> To me it seems the dt patching part should be done with minimal
> code before any driver like features..
> =20
> > I=E2=80=99ve toyed with the idea of using early platform devices bu=
t the omap-i2c driver
> > would need some tender love and care to make it work, and I didn=E2=
=80=99t want to get
> > bogged down with i2c driver details at this point.
>=20
> ..so how about just parse a kernel cmdline for the quirks to apply
> based on a version string or similar? That can be easily populated
> by u-boot or set manually with setenv.
>=20
That would not work for my use case. Again, this is a CPU card
plugged into a carrier card, of which there are several variants.
The CPU card is similar to a Com Express card (not exactly the same,
but the same idea), so it may even be manufactured by a third party.
Actually, in some cases it is. Modifying the kernel command line
based on the carrier card it is connected to is simply not possible.

Guenter
