From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: vf610: fix missing irqs
Date: Thu, 26 Mar 2015 09:12:38 +0100
Message-ID: <20150326081238.GK32677@pengutronix.de>
References: <1427354645-16629-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427354645-16629-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: shawn.guo@linaro.org, kernel@pengutronix.de, maitysanchayan@gmail.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Stefan,

On Thu, Mar 26, 2015 at 08:24:05AM +0100, Stefan Agner wrote:
> While adding the MSCM interrupt router, all interrupts have been move=
d
> to vfxxx.dtsi again. However, some properties got lost. Readd the
> missing interrupt properties.
>=20
> Offending commit:
> 97e6466ab9 ("ARM: dts: vf610: add Miscellaneous System Control Module=
 (MSCM)"
Usually this is written as:

	Fixes: 97e6466ab9 ("ARM: dts: vf610: add Miscellaneous System Control =
Module (MSCM)")

and there is no Sign-off.

Best regards
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
