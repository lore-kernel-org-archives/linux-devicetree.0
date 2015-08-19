From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: [PATCH 0/2] ST PLL fixes for 4.3
Date: Wed, 19 Aug 2015 10:48:12 +0200
Message-ID: <1439974094-32322-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabian Frederick <fabf@skynet.be>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Should be apply with 
commit 5eb26c605909 ("ARM: STi: DT: Rename st_pll3200c32_407_c0_x into st_pll3200c32_cx_x")
to avoid broken compatibility.

Gabriel Fernandez (2):
  dt-bindings: Fix tipo in st,clkgen-pll documentation
  drivers: clk: st: Rename st_pll3200c32_407_c0_x into
    st_pll3200c32_cx_x

 Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt |  4 ++--
 drivers/clk/st/clkgen-fsyn.c                                 |  8 ++++----
 drivers/clk/st/clkgen-pll.c                                  | 12 ++++++------
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.9.1
