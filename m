From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [RFC] [PATCH 0/2] clock helper for determining flags properties
Date: Tue, 13 May 2014 13:57:31 +0200
Message-ID: <1399982253-21079-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

The first patch provides a helper to get flags properties of a clock node.
This patch is limited to CLK_SET_RATE_PARENT flag for e.g.

The second patch provides an example of use of this clock helper.

Gabriel Fernandez (2):
  clk: of: helper for determining flags properties
  drivers: clk: st: authorize propagate rate change for clockgenD0

 arch/arm/boot/dts/stih407-clock.dtsi |  1 +
 drivers/clk/clk.c                    | 11 +++++++++++
 drivers/clk/st/clk-flexgen.c         |  2 ++
 include/linux/clk-provider.h         |  6 ++++++
 4 files changed, 20 insertions(+)

-- 
1.9.1

