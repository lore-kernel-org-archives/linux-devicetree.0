From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 6/8] ARM: at91: pm: add ULP1 support for SAM9X60
Date: Fri, 15 Feb 2019 16:23:17 -0800
Message-ID: <155027659793.115909.12085192701261043595@swboyd.mtv.corp.google.com>
References: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com> <1550159642-26878-7-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550159642-26878-7-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, linux@armlinux.org.uk, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

Quoting Claudiu.Beznea@microchip.com (2019-02-14 07:54:57)
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
>=20
> Add ULP1 support for SAM9X60. In pm_suspend.S enable RC oscillator in
> PMC if it is not enabled. At resume the state before suspend is
> restored.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  include/linux/clk/at91_pmc.h    |  1 +

Acked-by: Stephen Boyd <sboyd@kernel.org>
