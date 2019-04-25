From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: clock: at91: new sckc bindings
Date: Thu, 25 Apr 2019 11:43:24 -0700
Message-ID: <155621780413.15276.1640957113449819563@swboyd.mtv.corp.google.com>
References: <20190219170200.3608-1-alexandre.belloni@bootlin.com> <20190219170200.3608-2-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219170200.3608-2-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Alexandre Belloni (2019-02-19 09:01:54)
> Remove the need for child nodes in the sckc binding to be able to remove
> dtc warnings and have a more modern binding.
>=20
> Also document optional properties.
>=20
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next
