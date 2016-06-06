From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH 0/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
Date: Mon, 6 Jun 2016 07:47:59 +0200
Message-ID: <alpine.DEB.2.02.1606060742210.23377@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020944180.19416@lnxricardw1.se.axis.com> <20160602180059.11928d40@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160602180059.11928d40@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org


On Thu, 2 Jun 2016, Boris Brezillon wrote:

> Hi Ricard,
>=20
> I was not in Cc of this series, so you're either developing an old
> kernel version, or you didn't check the MAINTAINERS file (or didn't r=
un
> get_maintainer.pl on your series).

The patch is intended to apply to the mtd l2 tree, and I did check=20
MAINTAINERS, however, for whatever reason I failed to notice that the N=
AND=20
flash subsystem has its own entry (going for the general MTD entry), so=
=20
both you and Richard got left off the CC list. Sorry about that. I'll=20
rectify it on subsequent patch submissions.

> And please, next time make sure patches 1 to X are sent in replies to=
=20
> your cover letter.

Ok. Will do.

> I'll to review the driver soon.

Much appreciated.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
