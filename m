From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v4 0/6] MSM8998 Multimedia Clock Controller
Date: Tue, 21 May 2019 08:52:28 -0600
Message-ID: <933023a0-10fd-fedf-6715-381dae174ad9@codeaurora.org>
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org
Cc: david.brown@linaro.org, agross@kernel.org, bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/21/2019 8:44 AM, Jeffrey Hugo wrote:
> The multimedia clock controller (mmcc) is the main clock controller for
> the multimedia subsystem and is required to enable things like display and
> camera.

Stephen, I think this series is good to go, and I have display/gpu stuff 
I'm polishing that will depend on this.  Would you kindly pickup patches 
1, 3, 4, and 5 for 5.3?  I can work with Bjorn to pick up patches 2 and 6.

> 
> v4:
> -fix makefile to use correct config item
> -pick up tags
> -fix ordering of clocks and clock-names in dt
> -drop MODULE_ALIAS
> -wait for xo in mmcc since that was found to be useful in some debug configs
> 
> v3:
> -Rebase onto linux-next to get the final version of the clk parent rewrite
> series
> -Moved the bindings header to the bindings patch per Rob
> -Made xo manditory for GCC to work around the lack of clk orphan probe defer
> to avoid the uart console glitch
> 
> v2:
> -Rebased on the "Rewrite clk parent handling" series and updated to the clk init
> mechanisms introduced there.
> -Marked XO clk as CLK_IGNORE_UNUSED to avoid the concern about the XO going away
> "incorrectly" during late init
> -Corrected the name of the XO clock to "xo"
> -Dropped the fake XO clock in GCC to prevent a namespace conflict
> -Fully enumerated the external clocks (DSI PLLs, etc) in the DT binding
> -Cleaned up the weird newlines in the added DT node
> -Added DT header file to msm8998 DT for future clients
> 
> Jeffrey Hugo (6):
>    dt-bindings: clock: Document external clocks for MSM8998 gcc
>    arm64: dts: msm8998: Add xo clock to gcc node
>    clk: qcom: smd: Add XO clock for MSM8998
>    dt-bindings: clock: Add support for the MSM8998 mmcc
>    clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver
>    arm64: dts: qcom: msm8998: Add mmcc node
> 
>   .../devicetree/bindings/clock/qcom,gcc.txt    |   10 +
>   .../devicetree/bindings/clock/qcom,mmcc.txt   |   21 +
>   arch/arm64/boot/dts/qcom/msm8998.dtsi         |   16 +
>   drivers/clk/qcom/Kconfig                      |    9 +
>   drivers/clk/qcom/Makefile                     |    1 +
>   drivers/clk/qcom/clk-smd-rpm.c                |   24 +-
>   drivers/clk/qcom/gcc-msm8998.c                |   29 +-
>   drivers/clk/qcom/mmcc-msm8998.c               | 2915 +++++++++++++++++
>   include/dt-bindings/clock/qcom,mmcc-msm8998.h |  210 ++
>   9 files changed, 3214 insertions(+), 21 deletions(-)
>   create mode 100644 drivers/clk/qcom/mmcc-msm8998.c
>   create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
