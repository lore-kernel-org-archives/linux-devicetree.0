From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v6 4/5] ARM: BCM: Add SMP support for Broadcom NSP
Date: Sun, 6 Dec 2015 19:50:44 -0800
Message-ID: <56650214.6090401@gmail.com>
References: <1449316424-14549-1-git-send-email-kapilh@broadcom.com>
 <1449316424-14549-5-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449316424-14549-5-git-send-email-kapilh@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kapil Hali <kapilh@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Le 05/12/2015 03:53, Kapil Hali a =C3=A9crit :
> Add SMP support for Broadcom's Northstar Plus SoC
> cpu enable method. This changes also consolidates
> iProc family's - BCM NSP and BCM Kona, platform
> SMP handling in a common file.
>=20
> Northstar Plus SoC is based on ARM Cortex-A9
> revision r3p0 which requires configuration for ARM
> Errata 764369 for SMP. This change adds the needed
> configuration option.
>=20
> Signed-off-by: Kapil Hali <kapilh@broadcom.com>

Applied to soc/next, thanks!
--=20
=46lorian
