Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190710134346.30239-5-gregory.clement@bootlin.com>
References: <20190710134346.30239-1-gregory.clement@bootlin.com> <20190710134346.30239-5-gregory.clement@bootlin.com>
Subject: Re: [PATCH v7 4/6] clk: mvebu: ap806: Fix clock name for the cluster
From: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 08 Aug 2019 09:12:21 -0700
Message-Id: <20190808161221.DDFF921743@mail.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Gregory CLEMENT (2019-07-10 06:43:44)
> Actually, the clocks exposed for the cluster are not the CPU clocks, but
> the PLL clock used as entry clock for the CPU clocks. The CPU clock will
> be managed by a driver submitting in the following patches.
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---

Applied to clk-next
