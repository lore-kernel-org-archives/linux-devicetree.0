From: Dinh Nguyen <dinh.linux@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add EMAC AXI settings for Arria10
Date: Thu, 2 Feb 2017 13:20:31 -0600
Message-ID: <CADhT+wc=peW0__N-aGm1DM+E=rEWC3MTT-nJvvAX9BCKTDmdTQ@mail.gmail.com>
References: <1486055345-2894-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486055345-2894-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: Dinh Nguyen <dinguyen@opensource.altera.com>, dinh.nguyen@linux.intel.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 2, 2017 at 11:09 AM,  <thor.thayer@linux.intel.com> wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
>
> Add the device tree entries needed to support the EMAC AXI
> bus settings on the Arria10 SoCFPGA chip.
>
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
> index f520cbf..f05dd15 100644
> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
> @@ -400,6 +400,12 @@
>                                 };
>                 };
>
> +               socfpga_axi_setup: stmmac-axi-config {
> +                       snps,wr_osr_lmt = <0xf>;
> +                       snps,rd_osr_lmt = <0xf>;
> +                       snps,blen = <0 0 0 0 16 0 0>;
> +               };
> +
>                 gmac0: ethernet@ff800000 {
>                         compatible = "altr,socfpga-stmmac", "snps,dwmac-3.72a", "snps,dwmac";
>                         altr,sysmgr-syscon = <&sysmgr 0x44 0>;
> @@ -416,6 +422,7 @@
>                         clock-names = "stmmaceth";
>                         resets = <&rst EMAC0_RESET>;
>                         reset-names = "stmmaceth";
> +                       snps,axi-config = <&socfpga_axi_setup>;

What about gmac1 and gmac2? They probably need this entry as well.

Dinh
