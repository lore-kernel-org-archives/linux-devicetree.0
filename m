From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] net: phy: add amlogic g12a mdio mux support
Date: Fri, 29 Mar 2019 15:49:06 -0700
Message-ID: <155389974643.20095.8059052762611235333@swboyd.mtv.corp.google.com>
References: <20190329141512.29867-1-jbrunet@baylibre.com> <20190329141512.29867-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329141512.29867-3-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Quoting Jerome Brunet (2019-03-29 07:15:11)
> Add support for the mdio mux and internal phy glue of the g12a SoC family
>=20
> [for the clock part]
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

I think you should write it like:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com> # clk parts
