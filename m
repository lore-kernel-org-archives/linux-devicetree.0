From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v7 2/2] regulator: add QCOM RPMh regulator driver
Date: Mon, 11 Jun 2018 10:19:22 -0700
Message-ID: <20180611171922.GG88063@google.com>
References: <cover.1528498807.git.collinsd@codeaurora.org>
 <36e91ad9edeeee2adfe7a4d92675a1d6950f5002.1528498807.git.collinsd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <36e91ad9edeeee2adfe7a4d92675a1d6950f5002.1528498807.git.collinsd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 08, 2018 at 04:44:15PM -0700, David Collins wrote:
> Add the QCOM RPMh regulator driver to manage PMIC regulators
> which are controlled via RPMh on some Qualcomm Technologies, Inc.
> SoCs.  RPMh is a hardware block which contains several
> accelerators which are used to manage various hardware resources
> that are shared between the processors of the SoC.  The final
> hardware state of a regulator is determined within RPMh by
> performing max aggregation of the requests made by all of the
> processors.
> 
> Add support for PMIC regulator control via the voltage regulator
> manager (VRM) and oscillator buffer (XOB) RPMh accelerators.
> VRM supports manipulation of enable state, voltage, and mode.
> XOB supports manipulation of enable state.
> 
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/regulator/Kconfig               |   9 +
>  drivers/regulator/Makefile              |   1 +
>  drivers/regulator/qcom-rpmh-regulator.c | 753 ++++++++++++++++++++++++++++++++
>  3 files changed, 763 insertions(+)
>  create mode 100644 drivers/regulator/qcom-rpmh-regulator.c

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
