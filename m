From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 1/4] clk: at91: sckc: sama5d4 has no bypass support
Date: Wed, 26 Jun 2019 11:34:47 -0700
Message-ID: <20190626183448.2C47B216FD@mail.kernel.org>
References: <1558433454-27971-1-git-send-email-claudiu.beznea@microchip.com> <1558433454-27971-2-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558433454-27971-2-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

Quoting Claudiu.Beznea@microchip.com (2019-05-21 03:11:22)
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
>=20
> The slow clock of SAMA5D4 has no bypass support thus remove it.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next
