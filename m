From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] firmware: qcom: scm: Expose download-mode control
Date: Fri, 24 Mar 2017 10:06:33 -0500
Message-ID: <20170324150633.2s3o3kiecnoeo4qt@rob-hp-laptop>
References: <20170318041523.29757-1-bjorn.andersson@linaro.org>
 <20170318041523.29757-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170318041523.29757-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 17, 2017 at 09:15:22PM -0700, Bjorn Andersson wrote:
> In order to aid post-mortem debugging the Qualcomm platforms provides a
> "memory download mode", where the boot loader will provide an interface
> for custom tools to "download" the content of RAM to a host machine.
> 
> The mode is triggered by writing a magic value somehwere in RAM, that is
> read in the boot code path after a warm-restart. Two mechanism for
> setting this magic value are supported in modern platforms; a direct SCM
> call to enable the mode or through a secure io write of a magic value.
> 
> In order for a normal reboot not to trigger "download mode" the magic
> must be cleared during a clean reboot.
> 
> Download mode has to be enabled by including qcom_scm.download_mode=1 on
> the command line.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/firmware/qcom,scm.txt      |  1 +
>  drivers/firmware/qcom_scm-32.c                     |  6 ++++
>  drivers/firmware/qcom_scm-64.c                     | 16 +++++++++
>  drivers/firmware/qcom_scm.c                        | 42 ++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h                        |  2 ++
>  5 files changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> index 20f26fbce875..8467a181f22c 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> @@ -18,6 +18,7 @@ Required properties:
>   * Core, iface, and bus clocks required for "qcom,scm"
>  - clock-names: Must contain "core" for the core clock, "iface" for the interface
>    clock and "bus" for the bus clock per the requirements of the compatible.
> +- qcom,dload-mode-addr: Specifies the address for the download mode magic (optional)

Size? 1 cell, 2 cell(, red cell, blue cell) or follows #addr-cells?

Rob
