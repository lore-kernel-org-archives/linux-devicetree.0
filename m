From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] devicetree: Add DTS file to support the Nexus7 2013
 (flo) device.
Date: Fri, 5 Feb 2016 13:01:29 -0600
Message-ID: <CAL_JsqL1koD3OWM4-cqEOJUz-yuZuUeg1tmp6V39mPE0zrNPgg@mail.gmail.com>
References: <1454695578-4053-1-git-send-email-john.stultz@linaro.org> <1454695578-4053-2-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454695578-4053-2-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 5, 2016 at 12:06 PM, John Stultz <john.stultz@linaro.org> wrote:
> This patch adds a dts file to support the Nexus7 2013
> device. Its based off of the qcom-apq8064-ifc6410.dts
> which is similar hardware.
>
> Also includes some comments and context folded in
> from Vinay Simha BN <simhavcs@gmail.com>
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Arnd Bergmann <arnd.bergmann@linaro.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Andy Gross <agross@codeaurora.org>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Stephen Boyd <stephen.boyd@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 276 +++++++++++++++++++++
>  2 files changed, 277 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a4a6d70..5b16715 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -524,6 +524,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>         qcom-apq8064-cm-qs600.dtb \
>         qcom-apq8064-ifc6410.dtb \
>         qcom-apq8064-sony-xperia-yuga.dtb \
> +       qcom-apq8064-asus-nexus7-flo.dts \

s/dts/dtb/

You must not be doing "make dtbs".

Otherwise, for both patches:

Acked-by: Rob Herring <robh@kernel.org>
