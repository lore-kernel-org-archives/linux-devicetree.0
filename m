From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v6 03/11] ARM: dts: sun8i: Add R_CPUCFG device node for
 the A83T dtsi
Date: Tue, 17 Apr 2018 11:13:12 +0800
Message-ID: <CAGb2v67b_-RTF2HyNE5NoWTiHy9BDPR95sxvOYzGbz7=qP_ewA@mail.gmail.com>
References: <20180416215032.5023-1-mylene.josserand@bootlin.com> <20180416215032.5023-4-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180416215032.5023-4-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Simon <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, "open list:ARM/SHMOBILE ARM..." <linux-renesas-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, Quentin Schulz <quentin.schulz@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 17, 2018 at 5:50 AM, Mylène Josserand
<mylene.josserand@bootlin.com> wrote:
> The R_CPUCFG is a collection of registers needed for SMP bringup
> on clusters and cluster's reset.
> For the moment, documentation about this register is found in
> Allwinner's code only.
>
> Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
