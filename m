From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 0/5] Qualcomm PCIe driver and designware fixes
Date: Mon, 07 Dec 2015 17:33:43 +0000
Message-ID: <5665C2F7.9060502@linaro.org>
References: <1449149725-27607-1-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1449149725-27607-1-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-pci-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jingoohan1@gmail.com>, Pratyush Anand <pratyush.anand@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org



On 03/12/15 13:35, Stanimir Varbanov wrote:
> Hi,
>
> Here is v4, comments from Bjorn and Rob have been addressed.
> The previous version can be found at [1].
>
> regards,
> Stan
>
> [1] https://lkml.org/lkml/2015/11/23/114
>
> Stanimir Varbanov (5):
>    PCI: designware: add memory barrier after enabling region
>    DT: PCI: qcom: Document PCIe devicetree bindings
>    PCI: qcom: Add Qualcomm PCIe controller driver
>    ARM: dts: apq8064: add pcie devicetree node
>    ARM: dts: ifc6410: enable pcie dt node for this board
>
Thanks for the patches, Tested on IFC6410.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   .../devicetree/bindings/pci/qcom,pcie.txt          |  233 ++++++++
>   MAINTAINERS                                        |    7 +
>   arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |   26 +
>   arch/arm/boot/dts/qcom-apq8064.dtsi                |   36 ++
>   drivers/pci/host/Kconfig                           |   10 +
>   drivers/pci/host/Makefile                          |    1 +
>   drivers/pci/host/pcie-designware.c                 |    5 +
>   drivers/pci/host/pcie-qcom.c                       |  624 ++++++++++++++++++++
>   8 files changed, 942 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie.txt
>   create mode 100644 drivers/pci/host/pcie-qcom.c
>
