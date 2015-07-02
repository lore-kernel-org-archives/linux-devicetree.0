From: "Chalamarla, Tirumalesh" <Tirumalesh.Chalamarla@caviumnetworks.com>
Subject: Re: [PATCH] GICv3: Add ITS entry to THUNDER dts
Date: Thu, 2 Jul 2015 20:26:02 +0000
Message-ID: <D2BD6D7B-E4B2-46B8-A324-9261DCFA2642@caviumnetworks.com>
References: <1435345943-31833-1-git-send-email-tchalamarla@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1435345943-31833-1-git-send-email-tchalamarla@caviumnetworks.com>
Content-Language: en-US
Content-ID: <AABFBB0E399B244BA2EE1BE0D2A7B722@namprd07.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>, "Will.Deacon@arm.com" <Will.Deacon@arm.com>
Cc: "rrichter@cavium.com" <rrichter@cavium.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tirumalesh Chalamarla <tchalamarla@cavium.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Catalin,

is it possible to pull this for 4.2?

Thanks,
Tirumalesh.  
> On Jun 26, 2015, at 12:12 PM, Tirumalesh Chalamarla <tchalamarla@caviumnetworks.com> wrote:
> 
> From: Tirumalesh Chalamarla <tchalamarla@cavium.com>
> 
> The PCIe host controller uses MSIs provided by GICv3 ITS. Enable it on
> Thunder SoCs by adding an entry to DT.
> 
> Signed-off-by: Tirumalesh Chalamarla <tchalamarla@cavium.com>
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
> arch/arm64/boot/dts/cavium/thunder-88xx.dtsi | 9 +++++++++
> 1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
> index d8c0bdc..9cb7cf9 100644
> --- a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
> +++ b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
> @@ -376,10 +376,19 @@
> 		gic0: interrupt-controller@8010,00000000 {
> 			compatible = "arm,gic-v3";
> 			#interrupt-cells = <3>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> 			interrupt-controller;
> 			reg = <0x8010 0x00000000 0x0 0x010000>, /* GICD */
> 			      <0x8010 0x80000000 0x0 0x600000>; /* GICR */
> 			interrupts = <1 9 0xf04>;
> +
> +			its: gic-its@8010,00020000 {
> +				compatible = "arm,gic-v3-its";
> +				msi-controller;
> +				reg = <0x8010 0x20000 0x0 0x200000>;
> +			};
> 		};
> 
> 		uaa0: serial@87e0,24000000 {
> -- 
> 2.1.0
> 
