From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/7] clk: at91: sckc: handle different RC startup time
Date: Thu, 25 Apr 2019 11:43:31 -0700
Message-ID: <155621781143.15276.4599145179300992228@swboyd.mtv.corp.google.com>
References: <20190219170200.3608-1-alexandre.belloni@bootlin.com> <20190219170200.3608-4-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219170200.3608-4-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Quoting Alexandre Belloni (2019-02-19 09:01:56)
> The sama5d3 slow RC oscillator as a different startup time than all the
> previous SoCs. Handle that using its own compatible.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next
