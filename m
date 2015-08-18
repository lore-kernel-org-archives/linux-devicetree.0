From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv2] arm64: dts: Add base stratix 10 dtsi
Date: Tue, 18 Aug 2015 11:04:32 -0500
Message-ID: <alpine.DEB.2.02.1508181103230.23339@linux-builds1>
References: <1439308127-7412-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439308127-7412-1-git-send-email-dinguyen@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: dinh.linux@gmail.com, jszhang@marvell.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Aug 2015, dinguyen@opensource.altera.com wrote:

> From: Dinh Nguyen <dinguyen@opensource.altera.com>
> 
> Add the base DTS for Altera's SoCFPGA Stratix 10 platform.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> ---
> v2: use interrupt-affinity for pmu node
> ---
>  arch/arm64/Kconfig                                 |   5 +
>  arch/arm64/boot/dts/Makefile                       |   1 +
>  arch/arm64/boot/dts/altera/Makefile                |   5 +
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  | 358 +++++++++++++++++++++
>  .../boot/dts/altera/socfpga_stratix10_socdk.dts    |  38 +++
>  arch/arm64/configs/defconfig                       |   1 +
>  6 files changed, 408 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/altera/Makefile
>  create mode 100644 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>  create mode 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> 

Soft ping on this pach?

BR,
Dinh
