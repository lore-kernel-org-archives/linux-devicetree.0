From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] usb: dwc3: core: Add quirk for enabling AutoRetry
 feature in the controller
Date: Wed, 25 Jul 2018 14:03:25 -0600
Message-ID: <20180725200325.GA21007@rob-hp-laptop>
References: <1532168920-3269-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532168920-3269-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, balbi@kernel.org, v.anuragkumar@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 21, 2018 at 03:58:40PM +0530, Anurag Kumar Vulisha wrote:
> By default when core sees any transaction error(CRC or overflow)
> it replies with terminating retry ACK (Retry=1 and Nump == 0).
> Enabling this Auto Retry feature in controller, on seeing any
> transaction errors makes the core to send an non-terminating ACK
> transaction packet (that is, ACK TP with Retry=1 and Nump != 0).
> Doing so will give controller a chance to recover from the error
> condition.
> 
> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt |  5 +++++
>  drivers/usb/dwc3/core.c                        | 16 ++++++++++++++++
>  drivers/usb/dwc3/core.h                        |  6 ++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 7f13ebe..2ba2bc2 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -94,6 +94,11 @@ Optional properties:
>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>  			enable periodic ESS TX threshold.
> + - snps,enable_auto_retry: Set to enable Auto retry Feature to make the

s/_/-/

> +			controller operating in Host mode on seeing transaction
> +			errors(CRC errors or internal overrun scenerios) on IN
> +			transfers to reply to the device with a non-terminating
> +			retry ACK (i.e, an ACK TP with Retry=1 & Nump != 0)

Seems like the property is unnecessary. When would you not want this 
retry behavior? Why not just enable unconditionally in the driver?

Rob
