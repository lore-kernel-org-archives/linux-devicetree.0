From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/2] MIPS: BMIPS: Add support SPI device nodes
Date: Tue, 27 Dec 2016 14:12:12 -0800
Message-ID: <0dffeca2-68bf-bacd-7eff-8b966c721dde@gmail.com>
References: <20161227015923.882-1-jaedon.shin@gmail.com>
 <20161227015923.882-3-jaedon.shin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20161227015923.882-3-jaedon.shin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jaedon Shin <jaedon.shin@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: Kevin Cernekee <cernekee@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mips@linux-mips.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/26/2016 05:59 PM, Jaedon Shin wrote:
> Adds SPI device nodes to BCM7xxx MIPS based SoCs.
> 
> Signed-off-by: Jaedon Shin <jaedon.shin@gmail.com>
> ---
>  arch/mips/boot/dts/brcm/bcm7125.dtsi      | 55 +++++++++++++++++++++++++++++--
>  arch/mips/boot/dts/brcm/bcm7346.dtsi      | 49 +++++++++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm7358.dtsi      | 49 +++++++++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm7360.dtsi      | 49 +++++++++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm7362.dtsi      | 49 +++++++++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm7420.dtsi      | 55 +++++++++++++++++++++++++++++--
>  arch/mips/boot/dts/brcm/bcm7425.dtsi      | 49 +++++++++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm7435.dtsi      | 49 +++++++++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm97125cbmb.dts  |  4 +++
>  arch/mips/boot/dts/brcm/bcm97346dbsmb.dts |  4 +++
>  arch/mips/boot/dts/brcm/bcm97358svmb.dts  | 36 ++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm97360svmb.dts  | 36 ++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm97362svmb.dts  |  4 +++
>  arch/mips/boot/dts/brcm/bcm97420c.dts     |  4 +++
>  arch/mips/boot/dts/brcm/bcm97425svmb.dts  | 36 ++++++++++++++++++++
>  arch/mips/boot/dts/brcm/bcm97435svmb.dts  |  4 +++
>  16 files changed, 526 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/brcm/bcm7125.dtsi b/arch/mips/boot/dts/brcm/bcm7125.dtsi
> index bbd00f65ce39..c1e19e57f64a 100644
> --- a/arch/mips/boot/dts/brcm/bcm7125.dtsi
> +++ b/arch/mips/boot/dts/brcm/bcm7125.dtsi
> @@ -46,6 +46,12 @@
>  			#clock-cells = <0>;
>  			clock-frequency = <27000000>;
>  		};
> +
> +		spi_clk: spi_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <27000000>;
> +		};

Nit, this should actually be upg_clk, since this is the clock that the
SPI controller uses, and it is a fixed-clock with a 27Mhz frequency.

Other than that, the rest looks good to me, thanks!
-- 
Florian
