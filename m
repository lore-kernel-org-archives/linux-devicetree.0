From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/5] usb: dwc3: add dis_u2_freeclk_exists_quirk
Date: Thu, 30 Jun 2016 21:32:37 -0500
Message-ID: <20160701023237.GA18701@rob-hp-laptop>
References: <1467285176-25222-1-git-send-email-william.wu@rock-chips.com>
 <1467285176-25222-3-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467285176-25222-3-git-send-email-william.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Wu <william.wu@rock-chips.com>
Cc: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 30, 2016 at 07:12:53PM +0800, William Wu wrote:
> Add a quirk to clear the GUSB2PHYCFG.U2_FREECLK_EXISTS bit,
> which specifies whether the USB2.0 PHY provides a free-running
> PHY clock, which is active when the clock control input is active.
> 
> Signed-off-by: William Wu <william.wu@rock-chips.com>
> ---
> Changes in v5:
> - None
> 
> Changes in v4:
> - rebase on top of balbi testing/next, remove pdata (balbi)
> 
> Changes in v3:
> - None
> 
> Changes in v2:
> - None
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
>  drivers/usb/dwc3/core.c                        | 5 +++++
>  drivers/usb/dwc3/core.h                        | 5 +++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 7d7ce08..1ada121 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -39,6 +39,9 @@ Optional properties:
>  			disabling the suspend signal to the PHY.
>   - snps,dis_rxdet_inp3_quirk: when set core will disable receiver detection
>  			in PHY P3 power state.
> + - snps,dis_u2_freeclk_exists_quirk: when set, clear the u2_freeclk_exists

Use '-', not '_'.

> +			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
> +			a free-running PHY clock.
>   - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
>  			utmi_l1_suspend_n, false when asserts utmi_sleep_n
>   - snps,hird-threshold: HIRD threshold
