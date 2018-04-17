From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: add QCOM RPMh regulator bindings
Date: Tue, 17 Apr 2018 13:06:57 -0700
Message-ID: <CAD=FV=UxabaHPa-pkGBvQDcmh7e+bqMRX4WdMS8xfhAQSKD9gg@mail.gmail.com>
References: <cover.1523673467.git.collinsd@codeaurora.org> <39b676d2ba7dac2436196cc5a090c6f151498dc8.1523673467.git.collinsd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <39b676d2ba7dac2436196cc5a090c6f151498dc8.1523673467.git.collinsd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Apr 13, 2018 at 7:50 PM, David Collins <collinsd@codeaurora.org> wrote:
> Introduce bindings for RPMh regulator devices found on some
> Qualcomm Technlogies, Inc. SoCs.  These devices allow a given
> processor within the SoC to make PMIC regulator requests which
> are aggregated within the RPMh hardware block along with requests
> from other processors in the SoC to determine the final PMIC
> regulator hardware state.
>
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> ---
>  .../bindings/regulator/qcom,rpmh-regulator.txt     | 207 +++++++++++++++++++++
>  .../dt-bindings/regulator/qcom,rpmh-regulator.h    |  36 ++++
>  2 files changed, 243 insertions(+)

I noticed that "qcom,rpmh-resource-type" is now gone.  Not needed
anymore?  Oh, I see.  Stephen said to add it when it's needed.  OK,
fine.


> +===============================
> +Second Level Nodes - Regulators
> +===============================
> +
> +- qcom,regulator-initial-voltage

nit: regulator framework tends to include "microvolt" in the name to
make it really obvious in the device tree what the units are.  Can you
do that too?


> +- qcom,drms-mode-threshold-currents

Could use microamp in the name of the property too...


> +                       qcom,allowed-drms-modes =
> +                               <RPMH_REGULATOR_MODE_LPM
> +                                RPMH_REGULATOR_MODE_HPM>;
> +                       qcom,drms-mode-threshold-currents = <10000 1000000>;

optional nit: to make it match downstream drivers, does it make sense
to change this to:

  <9999 999999>

...so if a driver used to request exactly 10000 mA that it will end up
with the same mode (no idea if drivers actually do that).


-Doug
