From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH] ARM: dts: da850: Add power-domains to CPPI 4.1 node
Date: Fri, 6 Jul 2018 12:02:41 -0500
Message-ID: <e0fc938e-36f9-655f-4d4a-910527a2cc08@lechnology.com>
References: <20180704094432.5424-1-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180704094432.5424-1-nsekhar@ti.com>
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
To: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/04/2018 04:44 AM, Sekhar Nori wrote:
> This adds the power-domains property to CPPI 4.1 node.
> 
> The CPPI 4.1 DMA driver uses pm_runtime to manage the clocks,
> so it needs this property in order to find and enable the clock
> properly.
> 
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---
> Applies for v4.19/dt branch of my tree.
> 
>   arch/arm/boot/dts/da850.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 9e05a5a709c0..07f215e7e5b8 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -637,6 +637,7 @@
>   				interrupts = <58>;
>   				#dma-cells = <2>;
>   				#dma-channels = <4>;
> +				power-domains = <&psc1 1>;
>   				status = "okay";
>   			};
>   		};
> 

Reviewed-by: David Lechner <david@lechnology.com>


Although this has me wondering if we can now remove the clock-ranges
property in the parent node.
