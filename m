From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: arm64: ls1028a-qds: correct bus of rtc
Date: Sun, 6 Oct 2019 09:01:24 +0800
Message-ID: <20191006010123.GF7150@dragon>
References: <20190904085104.44709-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190904085104.44709-1-biwen.li@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Biwen Li <biwen.li@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 04, 2019 at 04:51:04PM +0800, Biwen Li wrote:
> The rtc is on i2c2 bus(hardware), not on i2c1 channel 3,
> so correct it
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>

This looks a like a fix.  Do we need a Fixes tag for it?

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> index de6ef39f3118..6c0540ad9c59 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> @@ -133,11 +133,6 @@
>  				vcc-supply = <&sb_3v3>;
>  			};
>  
> -			rtc@51 {
> -				compatible = "nxp,pcf2129";
> -				reg = <0x51>;
> -			};
> -
>  			eeprom@56 {
>  				compatible = "atmel,24c512";
>  				reg = <0x56>;
> @@ -166,6 +161,14 @@
>  	};
>  };
>  
> +&i2c1 {
> +	status = "okay";

Please have a newline between properties and child node.

Shawn

> +	rtc@51 {
> +		compatible = "nxp,pcf2129";
> +		reg = <0x51>;
> +	};
> +};
> +
>  &sai1 {
>  	status = "okay";
>  };
> -- 
> 2.17.1
> 
