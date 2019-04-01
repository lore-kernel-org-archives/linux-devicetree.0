From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: Add Lenovo Miix 630
Date: Mon, 1 Apr 2019 11:51:53 +0100
Message-ID: <20190401105153.GE4187@dell>
References: <20190326185525.20781-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190326185525.20781-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Mar 2019, Jeffrey Hugo wrote:

> This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> functionality includes USB (host), microSD-card, keyboard, and trackpad.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  arch/arm64/boot/dts/qcom/msm8998-cls.dtsi     | 278 ++++++++++++++++++

What is cls?

How much of this will be reusable with the other laptops?

>  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  33 +++
>  3 files changed, 312 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-cls.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
