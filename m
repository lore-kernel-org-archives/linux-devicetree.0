From: Local user for Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 3/3] arm64: dts: juno: Remove Motherboard USB node
Date: Wed, 18 Jan 2017 12:38:02 +0000
Message-ID: <20170118123802.GE995@e110455-lin.cambridge.arm.com>
References: <74595d6d866518db7cfabc39b4cf9b54d3be9bde.1484741104.git.robin.murphy@arm.com>
 <39868e0d327456be61aa9ac318fc2d958523a696.1484741104.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <39868e0d327456be61aa9ac318fc2d958523a696.1484741104.git.robin.murphy@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com
List-Id: devicetree@vger.kernel.org

Hi Robin,

On Wed, Jan 18, 2017 at 12:12:52PM +0000, Robin Murphy wrote:
> The first batch of Juno boards included a discrete USB controller chip
> as a contingency in case of issues with the USB 2.0 IP integrated into
> the SoC. As it turned out, the latter was fine, and to the best of my
> knowledge the motherboard USB was never even brought up and validated.
> 
> Since this also isn't present on later boards, and uses a compatible
> string undocumented and unmatched by any driver in the kernel, let's
> just tidy it away for ever to avoid any confusion.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

For all 3 patches:

Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

Thanks,
Liviu

> ---
>  arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> index 3ad4c3000611..098601657f82 100644
> --- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> @@ -131,13 +131,6 @@
>  				vddvario-supply = <&mb_fixed_3v3>;
>  			};
>  
> -			usb@5,00000000 {
> -				compatible = "nxp,usb-isp1763";
> -				reg = <5 0x00000000 0x20000>;
> -				bus-width = <16>;
> -				interrupts = <4>;
> -			};
> -
>  			iofpga@3,00000000 {
>  				compatible = "simple-bus";
>  				#address-cells = <1>;
> -- 
> 2.11.0.dirty
> 
