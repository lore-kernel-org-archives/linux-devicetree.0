From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 1/3] ARM: l2c: add pl310-no-sideband option
Date: Thu, 16 Feb 2017 02:48:59 +0000
Message-ID: <PS1PR06MB1162C067E31C504C865AB7C08A5A0@PS1PR06MB1162.apcprd06.prod.outlook.com>
References: <20170207170929.29525-1-chris.brandt@renesas.com>
 <20170207170929.29525-2-chris.brandt@renesas.com>
 <20170215221426.e3dk4zzmhgfuplti@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170215221426.e3dk4zzmhgfuplti@rob-hp-laptop>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Brad Mouring <brad.mouring@ni.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Cochran <rcochran@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, February 15, 2017, Rob Herring wrote:
> On Tue, Feb 07, 2017 at 12:09:27PM -0500, Chris Brandt wrote:
> > If a PL310 is added to a system, but the sideband signals are not
> > connected, some Cortex A9 optimizations cannot be used. In particular,
> > enabling Full Line Zeros in the CA9 without sidebands connected will
> > crash the system since the CA9 will expect the L2C to perform
> > operations, yet the L2C never gets the commands.
>=20
> I assume you are talking about just the AxUSER signals, not the AxCACHE
> signals too. That would be really broken. IIRC, the other AxUSER signals
> are just hints and no connection would not be a problem. This is the only
> one that requires coordination with enabling/disabling in the core.

Yes, just the AxUSER, hence none of the "2.5.5 Cortex-A9 optimizations" wor=
k.
Well, except "Store buffer device limitation" because that doesn't use side=
band
signals.

Like you mentioned, having 'Early BRESP' enabled but not used doesn't hurt
anything. I was just blocking that so it would print out that it was enable=
d
and give users false hope (not that they are looking at the boot log that c=
losely
anyway.) FLZ is the killer.


> I think this should follow existing feature properties and explicitly
> disable the specific properties rather than have this indirection.

I can change the code to:

  "arm,early-bresp-disable"
  "arm,fill-line-zero-disable"


As I said, blocking BRESP is only for keeping the log message from coming o=
ut.
If it's preferred to not block anything that doesn't break anything, I can =
just
add "arm,fill-line-zero-disable" only. Just let me know.


Chris
