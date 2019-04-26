From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: add driver for the SiFive FU540 PRCI and PLLs it controls
Date: Thu, 25 Apr 2019 18:38:38 -0700
Message-ID: <155624271876.15276.8637203698438742304@swboyd.mtv.corp.google.com>
References: <20190411082618.3502-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411082618.3502-1-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mturquette@baylibre.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>
List-Id: devicetree@vger.kernel.org

Quoting Paul Walmsley (2019-04-11 01:26:16)
> clk: add driver for the SiFive FU540 PRCI and PLLs it controls
>=20
> Add a driver for the SiFive FU540 PRCI IP block, which handles clock and
> some device reset control for the SiFive FU540 chip.  Also add a driver-
> independent library for the Analog Bits Wide-Range PLL (WRPLL), used by
> the PRCI driver to monitor and control the WRPLL instances on the FU540
> chip.
>=20
> Boot-tested on a SiFive HiFive Unleashed board, using BBL and the
> open-source FSBL with a mainline-focused DTB.
>=20
> This third version incorporates changes requested by Stephen Boyd
> <sboyd@kernel.org> and Rob Herring <robh@kernel.org>.
>=20
> This patch series is also available, along with the DT macro prerequisite
> patch, at:

Can you please send the dt macro patch along with the rest of the
patches? I can't apply these patches and build them without it.
Typically the macro patch is part of the binding patch and Rob
acks/reviews it as one change. Then I pick that up and the clk driver
parts and they get pulled into whatever SoC tree is using the bindings
header with and those defines get merged up through some other path..

>=20
> https://github.com/sifive/riscv-linux/tree/dev/paulw/prci-v5.1-rc4
>=20

I suppose I'll go and fetch it from here manually.
