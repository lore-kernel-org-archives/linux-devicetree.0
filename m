From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 4/6] slim: qcom: Add Qualcomm Slimbus controller driver
Date: Mon, 8 Feb 2016 14:26:18 -0600
Message-ID: <20160208202618.GA32330@rob-hp-laptop>
References: <1454784265-5194-1-git-send-email-sdharia@codeaurora.org>
 <1454784265-5194-5-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454784265-5194-5-git-send-email-sdharia@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 06, 2016 at 11:44:23AM -0700, Sagar Dharia wrote:
> This controller driver programs manager, interface, and framer
> devices for Qualcomm's slimbus HW block.
> Manager component currently implements logical address setting,
> and messaging interface.
> Interface device reports bus synchronization information, and framer
> device clocks the bus from the time it's woken up, until clock-pause
> is executed by the manager device.
> 
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> ---
>  .../devicetree/bindings/slimbus/slim-qcom-ctrl.txt |  43 ++
>  drivers/slimbus/Kconfig                            |  10 +
>  drivers/slimbus/Makefile                           |   1 +
>  drivers/slimbus/slim-qcom-ctrl.c                   | 556 +++++++++++++++++++++
>  drivers/slimbus/slim-qcom.h                        |  63 +++
>  5 files changed, 673 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
>  create mode 100644 drivers/slimbus/slim-qcom-ctrl.c
>  create mode 100644 drivers/slimbus/slim-qcom.h
> 
> diff --git a/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt b/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
> new file mode 100644
> index 0000000..7b6c366
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
> @@ -0,0 +1,43 @@
> +Qualcomm SLIMBUS controller
> +"qcom,slim-msm": This controller is used if applications processor

This should be more specific and include the soc name(s).

> +	driver is controlling slimbus master component. This driver is
> +	responsible for communicating with slave HW directly using
> +	messaging interface, and doing data channel management.
> +
