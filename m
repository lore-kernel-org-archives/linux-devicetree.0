Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190710134346.30239-4-gregory.clement@bootlin.com>
References: <20190710134346.30239-1-gregory.clement@bootlin.com> <20190710134346.30239-4-gregory.clement@bootlin.com>
Subject: Re: [PATCH v7 3/6] clk: mvebu: add CPU clock driver for Armada 7K/8K
From: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 08 Aug 2019 09:12:16 -0700
Message-Id: <20190808161217.6280721743@mail.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Gregory CLEMENT (2019-07-10 06:43:43)
> The CPU frequency is managed at the AP level for the Armada 7K/8K. The
> CPU frequency is modified by cluster: the CPUs of the same cluster have
> the same frequency.
>=20
> This patch adds the clock driver that will be used by CPUFreq, it is
> based on the work of Omri Itach <omrii@marvell.com>.
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---

Applied to clk-next
