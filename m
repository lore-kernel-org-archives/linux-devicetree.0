Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190710134346.30239-3-gregory.clement@bootlin.com>
References: <20190710134346.30239-1-gregory.clement@bootlin.com> <20190710134346.30239-3-gregory.clement@bootlin.com>
Subject: Re: [PATCH v7 2/6] clk: mvebu: add helper file for Armada AP and CP clocks
From: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 08 Aug 2019 09:12:12 -0700
Message-Id: <20190808161213.735072184E@mail.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Gregory CLEMENT (2019-07-10 06:43:42)
> Clock drivers for Armada AP and Armada CP use the same function to
> generate unique clock name. A third drivers is coming with the same
> need, so it's time to move this function in a common file.
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---

Applied to clk-next
