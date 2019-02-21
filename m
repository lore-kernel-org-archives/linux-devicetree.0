From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clock: remove unused definition for stm32mp1
Date: Thu, 21 Feb 2019 14:16:54 -0800
Message-ID: <155078741430.77512.14260216742704556101@swboyd.mtv.corp.google.com>
References: <20190214104242.1491-1-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214104242.1491-1-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting gabriel.fernandez@st.com (2019-02-14 02:42:42)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>=20
> A copy of LTDC_PX and ETHCK_K (LTDC_K and ETHMAC_K) was introduced in
> stm32mp1 dt-bindings file by mistake.
> These bindings are not used and shouldn't be use to be conform with
> convention name of the stm32mp1 clock IP.
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---

Applied to clk-next
