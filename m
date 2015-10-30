From: Stuart Yoder <stuart.yoder@freescale.com>
Subject: RE: [PATCH v3] arm64: dts: Added syscon-reboot node for FSL's LS2085A
 SoC
Date: Fri, 30 Oct 2015 18:22:58 +0000
Message-ID: <CY1PR0301MB0748FFB9490DB247C389330C872F0@CY1PR0301MB0748.namprd03.prod.outlook.com>
References: <1446224892-29407-1-git-send-email-German.Rivera@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1446224892-29407-1-git-send-email-German.Rivera@freescale.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Sharma Bhupesh <bhupesh.sharma@freescale.com>, Jose Rivera <German.Rivera@freescale.com>, Li Leo <LeoLi@freescale.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: J. German Rivera [mailto:German.Rivera@freescale.com]
> Sent: Friday, October 30, 2015 12:08 PM
> To: robh+dt@kernel.org; mark.rutland@arm.com; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: Sharma Bhupesh-B45370; Yoder Stuart-B08248; Li Yang-Leo-R58472; Rivera Jose-B46482
> Subject: [PATCH v3] arm64: dts: Added syscon-reboot node for FSL's LS2085A SoC
> 
> Added sys-reboot node to the FSL's LS2085A SoC DT to leverage
> the ARM-generic reboot mechanism for this SoC. This mechanism
> is enabled through CONFIG_POWER_RESET_SYSCON.
> 
> Signed-off-by: J. German Rivera <German.Rivera@freescale.com>
> ---
> CHANGE HISTORY:
> 
> Changes in v2:
> - Addressed comment form Stuart Yoder:
>   * Removed "@<address>" from reboot node
> 
> Changes in v3:
> - Addressed comment form Stuart Yoder:
>   * Expose only the reset register
> 
>  arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> index e281ceb..5e3d894 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> @@ -131,6 +131,18 @@
>  		interrupts = <1 9 0x4>;
>  	};
> 
> +	rstcr: rstcr@1E60000 {
> +		compatible = "syscon";
> +		reg = <0x0 0x1E60000 0x0 0x4>;
> +	};
> +
> +	reboot {
> +		compatible ="syscon-reboot";
> +		regmap = <&rstcr>;
> +		offset = <0x0>;
> +		mask = <0x2>;
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts = <1 13 0x8>, /* Physical Secure PPI, active-low */

German, the other thing I just noticed that I had mentioned on 
v1 of the patch was that the device tree has been renamed, so
fsl-ls2085a.dtsi no longer exists.

You need to rebase this on top of:
git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git

branch: for-next

Thanks,
Stuart
