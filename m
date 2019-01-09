From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: Add Fixed MMIO clock driver
Date: Wed, 09 Jan 2019 11:42:34 -0800
Message-ID: <154706295457.15366.6974721928926110954@swboyd.mtv.corp.google.com>
References: <20181213124929.32736-1-jank@cadence.com> <20181213124929.32736-3-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213124929.32736-3-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

Quoting Jan Kotas (2018-12-13 04:49:29)
> This patch adds a driver for Fixed MMIO clock.
> The driver reads a clock frequency value from a single 32-bit memory
> mapped register and registers it as a fixed rate clock.
>=20
> It can be enabled with COMMON_CLK_FIXED_MMIO Kconfig option.
>=20
> Signed-off-by: Jan Kotas <jank@cadence.com>

This needed to use the clk_hw based APIs and add a static. I made the
changes myself. Let me know if you have any problems with what's in
clk-next and it can be fixed.
