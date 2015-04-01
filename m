From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 2/7] ARM: dts: qcom: Add PM8941 functions device nodes
Date: Wed, 1 Apr 2015 14:58:09 -0500
Message-ID: <D62DD8DE-C642-46D8-8BC6-EDB2FC69B666@codeaurora.org>
References: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org> <1427900715-26273-3-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427900715-26273-3-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Apr 1, 2015, at 10:05 AM, Ivan T. Ivanov <ivan.ivanov@linaro.org> wrote:

> Add configuration nodes for following devices:
> 
> * GPIO block, with 36 pins
> * MPP block, with 8 pins
> * Current ADC (IADC)
> * Volatage ADC (VADC), with multiple inputs
> * Thermal sensor device, which is using on chip VADC
>  channel report PMIC die temperature
> * Power key device, which is responsible for clean system
>  reboot or shutdown
> * White LED device
> * RTC device
> 
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
> ---
> arch/arm/boot/dts/qcom-pm8941.dtsi | 98 ++++++++++++++++++++++++++++++++++++++
> 1 file changed, 98 insertions(+)

please cleanup level/edge cell values to use defines

- k

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
