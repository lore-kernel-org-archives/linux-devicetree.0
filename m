Return-Path: <SRS0=dKdi=SG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:14464 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726888AbfDDOrk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Apr 2019 10:47:40 -0400
Subject: Re: [PATCH v2 8/8] arm64: tegra: Add NVIDIA Jetson Nano Developer Kit
 support
References: <20190404112511.28118-1-thierry.reding@gmail.com>
 <20190404112511.28118-8-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <80c8da2c-799f-64e6-5c95-5e90a1327430@nvidia.com>
Date: Thu, 4 Apr 2019 15:47:36 +0100
MIME-Version: 1.0
In-Reply-To: <20190404112511.28118-8-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 04/04/2019 12:25, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Jetson Nano Developer Kit is a Tegra X1 based development board. It
> is similar to Jetson TX1 but it is not pin compatible. It features 4 GB
> of LPDDR4, an SPI NOR flash for early boot firmware and an SD card slot
> used for storage.
> 
> HDMI 2.0 or DP 1.2 are available for display, four USB ports (3 USB 2.0
> and 1 USB 3.0) can be used to attach a variety of peripherals and a PCI
> Ethernet controller provides onboard network connectivity.
> 
> A 40-pin header on the board can be used to extend the capabilities and
> exposed interfaces of the Jetson Nano.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add obsolete PCIe and XUSB power supplies for backwards compatibility
> - remove pinmux node
> 
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 648 ++++++++++++++++++
>  2 files changed, 649 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts

...

> +	hda@70030000 {
> +		status = "okay";

Do you mind adding the following here ...

		nvidia,model = "jetson-nano-hda";

This will be consistent with what Sameer has added for Jetson TX1, TX2
and Xavier. Probably not so important for Tegra210 because there is only
one output stream but nonetheless consistent.

Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
