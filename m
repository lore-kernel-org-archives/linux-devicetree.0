From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] clk: stm32: Introduce clocks of STM32F769 board
Date: Thu, 25 Apr 2019 11:47:24 -0700
Message-ID: <155621804467.15276.5950117999221628038@swboyd.mtv.corp.google.com>
References: <20190405075332.28530-1-gabriel.fernandez@st.com> <20190405075332.28530-2-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405075332.28530-2-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre torgue <alexandre.torgue@st.com>, mark rutland <mark.rutland@arm.com>, maxime coquelin <mcoquelin.stm32@gmail.com>, michael turquette <mturquette@baylibre.com>, rob herring <robh+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Gabriel Fernandez <gabriel.fernandez@st.com>
List-Id: devicetree@vger.kernel.org

Quoting Gabriel Fernandez (2019-04-05 00:53:31)
> STM32F769 clocks are derived from STM32746 clocks.
> main differences are:
> - new source clock for SAI1 and SAI2 (HSI or HSE)
> - Add DFSDM & DSI clocks
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---

Applied to clk-next
