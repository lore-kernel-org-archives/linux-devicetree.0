From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Make USB1 peripheral
Date: Fri, 26 Apr 2019 13:26:34 -0600
Message-ID: <CAOCk7NqmNYDzyTSXnMUdDyAcbzHjzL-aSO9r_+V-5o-8oOMPPg@mail.gmail.com>
References: <20190426191025.16131-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426191025.16131-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2019 at 1:10 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The MTP is a "mobile reference device", as such the default operation is
> to use fastboot to boot/flash software onto it and the common case is
> thereby that we boot with a USB cable connected downstream from a PC or
> a hub.  And without support for the PMI8998 charger block VBUS will not
> be driven by the device.
>
> Switch to peripheral until we can enable OTG.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Makes sense to me.

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 02b8357c8ce8..2e78638eb73b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -404,8 +404,8 @@
>  };
>
>  &usb_1_dwc3 {
> -       /* Until we have Type C hooked up we'll force this as host. */
> -       dr_mode = "host";
> +       /* Until we have Type C hooked up we'll force this as peripheral. */
> +       dr_mode = "peripheral";
>  };
>
>  &usb_1_hsphy {
> --
> 2.18.0
>
