From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 0/3] arm64: dts: qcom: pm8998: Add ADC node and die temperature channel
Date: Wed,  8 Aug 2018 12:13:36 -0700
Message-ID: <20180808191339.16875-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Siddartha Mohanadoss <smohanad@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

This series adds the DT node for the QCOM SPMI PMIC5 ADC and a channel
for the die temperature.

The die temperature is going to be used by the temperature alarm driver
(https://lore.kernel.org/patchwork/project/lkml/list/?series=361416).

My understanding is that some of the ADC channels are/can be universally
useful on devices with a pm8998, while the use of others is device specific
(e.g. AMUX). Siddartha / QCA folks, are there other generally useful ADC
channels that should be added here?

The driver for the QCOM SPMI PMIC5 ADC landed in the 'testing' branch of the
'iio' tree:

https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=2c909be15f45c96d3dc6a84e56a76e5c3c7a60ae

(This series has a trivial conflict with the temp alarm series mentioned
above, if desired I can rebase it on that, I wasn't sure whether it's a
good idea to create a dependency on it)

Matthias Kaehlcke (3):
  dt-bindings: iio: vadc: Fix documentation of 'reg'
  arm64: dts: qcom: pm8998: Add adc node
  arm64: dts: qcom: pm8998: Add die temperature channel node to the ADC

 .../bindings/iio/adc/qcom,spmi-vadc.txt        |  4 ++--
 arch/arm64/boot/dts/qcom/pm8998.dtsi           | 18 +++++++++++++++++-
 2 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.18.0.597.ga71716f1ad-goog
