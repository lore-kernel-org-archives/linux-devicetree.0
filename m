From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v3 2/3] usb: dwc3: qcom: Add support for MSM8998
Date: Tue, 22 Jan 2019 15:15:58 -0600
Message-ID: <20190122211558.GB30582@hector.attlocal.net>
References: <1548106307-4762-1-git-send-email-jhugo@codeaurora.org>
 <1548106388-5079-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548106388-5079-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: mark.rutland@arm.com, balbi@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 02:33:08PM -0700, Jeffrey Hugo wrote:
> Add a MSM8998 specific DT compatible so that we can properly bind to the
> device and enable the USB controller.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index a6d0203..184df4d 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -595,6 +595,7 @@ static int __maybe_unused dwc3_qcom_runtime_resume(struct device *dev)
>  static const struct of_device_id dwc3_qcom_of_match[] = {
>  	{ .compatible = "qcom,dwc3" },
>  	{ .compatible = "qcom,msm8996-dwc3" },
> +	{ .compatible = "qcom,msm8998-dwc3" },
>  	{ .compatible = "qcom,sdm845-dwc3" },
>  	{ }

Reviewed-by: Andy Gross <andy.gross@linaro.org>
