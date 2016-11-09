From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/3] clk: qcom: Add support for SMD-RPM Clocks
Date: Wed, 9 Nov 2016 12:26:46 -0600
Message-ID: <20161109182646.isqpfbiyxjrjqzdp@rob-hp-laptop>
References: <20161102155658.32203-1-georgi.djakov@linaro.org>
 <20161102155658.32203-2-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161102155658.32203-2-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 02, 2016 at 05:56:56PM +0200, Georgi Djakov wrote:
> This adds initial support for clocks controlled by the Resource
> Power Manager (RPM) processor on some Qualcomm SoCs, which use
> the qcom_smd_rpm driver to communicate with RPM.
> Such platforms are msm8916, apq8084 and msm8974.
> 
> The RPM is a dedicated hardware engine for managing the shared
> SoC resources in order to keep the lowest power profile. It
> communicates with other hardware subsystems via shared memory
> and accepts clock requests, aggregates the requests and turns
> the clocks on/off or scales them on demand.
> 
> This driver is based on the codeaurora.org driver:
> https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/clk/qcom/clock-rpm.c
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.txt       |  36 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/qcom/Kconfig                           |  16 +
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/clk-smd-rpm.c                     | 571 +++++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h             |  45 ++
>  5 files changed, 669 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
>  create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
>  create mode 100644 include/dt-bindings/clock/qcom,rpmcc.h
