From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: dts: OMAP3-N900: Fix offset for smc91x ethernet
Date: Fri, 20 Feb 2015 10:24:35 +0100
Message-ID: <7411731.0J5JRAOyMm@wuerfel>
References: <1424364590-14603-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1424364590-14603-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: =?ISO-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 19 February 2015 17:49:50 Pali Roh=E1r wrote:
> Offset for smc91x must be zero otherwise smc91x linux kernel driver d=
oes not
> detect smc91x ethernet hardware in qemu N900 machine.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
>=20

Is that the same offset on real hardware, or could this be a mistake in=
 the
qemu model?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-omap" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
