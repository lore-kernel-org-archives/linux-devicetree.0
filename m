From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 2/4] clk: at91: sckc: add support to specify registers bit offsets
Date: Wed, 26 Jun 2019 11:34:51 -0700
Message-ID: <20190626183451.F33B421738@mail.kernel.org>
References: <1558433454-27971-1-git-send-email-claudiu.beznea@microchip.com> <1558433454-27971-3-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558433454-27971-3-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

Quoting Claudiu.Beznea@microchip.com (2019-05-21 03:11:26)
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
>=20
> Different IPs uses different bit offsets in registers for the same
> functionality, thus adapt the driver to support this.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---

Applied to clk-next
