From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: at91: fix masterck name
Date: Wed, 20 Feb 2019 11:43:40 -0800
Message-ID: <155069182090.77512.6031671349879787129@swboyd.mtv.corp.google.com>
References: <20190208144059.29861-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208144059.29861-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Quoting Alexandre Belloni (2019-02-08 06:40:59)
> The master clock is actually named masterck earlier in the driver. Having
> "mck" in the parent list means that it can never be selected.
>=20
> Fixes: 1eabdc2f9dd8 ("clk: at91: add at91sam9x5 PMCs driver")
> Fixes: a2038077de9a ("clk: at91: add sama5d2 PMC driver")
> Fixes: 084b696bb509 ("clk: at91: add sama5d4 pmc driver")
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-fixes
