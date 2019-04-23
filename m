Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190319133700.23878-2-ckeepax@opensource.cirrus.com>
References: <20190319133700.23878-1-ckeepax@opensource.cirrus.com> <20190319133700.23878-2-ckeepax@opensource.cirrus.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v7 RESEND 2/2] clk: lochnagar: Add support for the Cirrus Logic Lochnagar
Message-ID: <155605698860.15276.671362216532944829@swboyd.mtv.corp.google.com>
Date: Tue, 23 Apr 2019 15:03:08 -0700
To: Charles Keepax <ckeepax@opensource.cirrus.com>, mturquette@baylibre.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Quoting Charles Keepax (2019-03-19 06:37:00)
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
>=20
> The Lochnagar can take several input clocks from the host system,
> provides several of its own clock sources, and provides extensive
> routing options for those clocks to be supplied to the attached
> CODEC/Amp device.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Applied to clk-next

You may want to take a look at the clk-parent-rewrite-1 branch on
clk.git and see if you can convert this driver to use that method
instead of of_clk_get_parent_name(). It may simplify some of the driver.
