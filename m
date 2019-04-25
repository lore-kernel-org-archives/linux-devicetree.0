From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/7] clk: at91: modernize sckc binding
Date: Thu, 25 Apr 2019 11:43:28 -0700
Message-ID: <155621780833.15276.15655289006758205903@swboyd.mtv.corp.google.com>
References: <20190219170200.3608-1-alexandre.belloni@bootlin.com> <20190219170200.3608-3-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219170200.3608-3-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Quoting Alexandre Belloni (2019-02-19 09:01:55)
> Remove the need for child nodes in the sckc binding and register the whole
> sckc tree (3 clocks in total) from the sckc node.
>=20
> DT backward compatibility is kept by looking for properties in child nodes
> when they are not present in the sckc node.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next
