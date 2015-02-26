From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 00/12] ARM: dts: apq8064 dt patches.
Date: Thu, 26 Feb 2015 12:29:36 -0600
Message-ID: <6ABCEF31-CD4B-4544-8F0B-7654A45C198B@codeaurora.org>
References: <1424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Feb 23, 2015, at 1:53 AM, Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:

> Hi Kumar, 
> Now that the rpm header file dependency is resolved, Could you
> queue these dt patches for rc2.
> 
> 
> Thanks,
> srini
> 
> Nicolas Dechesne (3):
>  ARM: DT: apq8064: add pci support in CM QS600
>  ARM: DT: apq8064: Add usb host support to CM QS-600
>  ARM: DT: apq8064: Add USB OTG support for CM QS-600
> 
> Pramod Gurav (1):
>  ARM: qcom: Add DT alias for serial port
> 
> Rob Clark (1):
>  ARM: dts: APQ8064: Add MDP support
> 
> Srinivas Kandagatla (7):
>  ARM: dts: apq8064: add RPM regulators support
>  ARM: dts: apq8064: Add usb host support.
>  ARM: dts: apq8064: Add USB OTG support
>  ARM: dts: apq8064: Add SATA controller support.
>  ARM: dts: apq8064: Remove incorrect gsbi2 node.
>  ARM: dts: Move i2c1 pinctrl to apq8064.dtsi
>  ARM: dts: apq8064 add i2c3 node for panel.
> 
> arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts |  49 +++
> arch/arm/boot/dts/qcom-apq8064-ifc6410.dts  |  98 +++++-
> arch/arm/boot/dts/qcom-apq8064.dtsi         | 499 +++++++++++++++++++++++++++-
> 3 files changed, 629 insertions(+), 17 deletions(-)

Can you scrub all the patches for interrupt usage such that we use GIC_SPI define and I think any IRQ type of 0 or NONE should really be IRQ_TYPE_LEVEL_HIGH

- k

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
