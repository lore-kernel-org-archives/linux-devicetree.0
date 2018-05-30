Return-Path: <SRS0=7PqC=IR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:39516 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750905AbeE3PyD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 May 2018 11:54:03 -0400
Received: by mail-ua0-f194.google.com with SMTP id v17-v6so12819421uak.6
        for <devicetree@vger.kernel.org>; Wed, 30 May 2018 08:54:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180530110400.30710-1-mgautam@codeaurora.org>
References: <20180530110400.30710-1-mgautam@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 May 2018 08:54:01 -0700
Message-ID: <CAD=FV=U4L=OjBTc5xUPpjU6iTM4NR=NGeCia8FDgmADZcGsdbA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: msm8996: Use dwc3-qcom glue driver for USB
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

On Wed, May 30, 2018 at 4:04 AM, Manu Gautam <mgautam@codeaurora.org> wrote:
> Move from dwc3-of-simple to dwc3-qcom glue driver to
> support peripheral mode which requires qscratch wrapper
> programming on VBUS event.

Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")

> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/msm8996.dtsi        | 6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> index f45a0ab30d30..83bc1b9ff6ef 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -108,6 +108,7 @@
>
>                 usb@6a00000 {
>                         status = "okay";
> +                       extcon = <&usb3_id>;
>
>                         dwc3@6a00000 {
>                                 extcon = <&usb3_id>;
> @@ -124,6 +125,7 @@
>
>                 usb@7600000 {
>                         status = "okay";
> +                       extcon = <&usb2_id>;
>
>                         dwc3@7600000 {
>                                 extcon = <&usb2_id>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 26292027ba9b..d30516c0db87 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -777,7 +777,8 @@
>                 };
>
>                 usb2: usb@7600000 {

Please update the unit address, which should match the new value for the "reg".

> -                       compatible = "qcom,dwc3";
> +                       compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
> +                       reg = <0x76f8800 0x400>;
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>                         ranges;
> @@ -805,7 +806,8 @@
>                 };
>
>                 usb3: usb@6a00000 {
> -                       compatible = "qcom,dwc3";
> +                       compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
> +                       reg = <0x6af8800 0x400>;
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>                         ranges;

This patch is a little bit unfortunate since it demonstrates that a
patch that already landed (specifically commit a4333c3a6ba9 ("usb:
dwc3: Add Qualcomm DWC3 glue driver")) broke device tree backward
compatibility.  Specifically if you get a kernel with that commit in
it but not this device tree change then you'll end up with broken USB.
Also if anyone happened to have a device tree stored somewhere out of
tree based on the old binding then they will of course be broken.

I will leave it to people more familiar with msm8996 to decide if this
issue is important to them and if we need to change the bindings to
maintain backward compatibility or if we should instead just land this
patch ASAP.

-Doug
