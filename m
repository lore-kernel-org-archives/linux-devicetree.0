From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 2/2] ARM: pxa: dts: add pin definitions for extended GPIOs
Date: Tue, 22 May 2018 21:34:16 +0200
Message-ID: <87tvqzxz5z.fsf@belgarion.home>
References: <20180521220044.821-1-daniel@zonque.org>
 <20180521220044.821-2-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180521220044.821-2-daniel@zonque.org> (Daniel Mack's message
 of "Tue, 22 May 2018 00:00:44 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Mack <daniel@zonque.org>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, haojian.zhuang@gmail.com
List-Id: devicetree@vger.kernel.org

Daniel Mack <daniel@zonque.org> writes:

> The PXA3xx series features some extended GPIO banks which are named GPIO0_2,
> GPIO1_2 etc. The PXA300, PXA310 and PXA320 have different numbers of such
> pins, and they also have variant-specific register offsets.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  arch/arm/boot/dts/pxa3xx.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
> index a13ac52e4fd2..446e612688c0 100644
> --- a/arch/arm/boot/dts/pxa3xx.dtsi
> +++ b/arch/arm/boot/dts/pxa3xx.dtsi
> @@ -8,6 +8,13 @@
>  	 (gpio <= 98) ? (0x0400 + 4 * (gpio - 27)) :	\
>  	 (gpio <= 127) ? (0x0600 + 4 * (gpio - 99)) :	\
>  	 0)
> +#define MFP_PIN_PXA300_0_2	0x674
> +#define MFP_PIN_PXA300_1_2	0x678
> +#define MFP_PIN_PXA300_2_2	0x2dc
> +#define MFP_PIN_PXA300_3_2	0x2e0
> +#define MFP_PIN_PXA300_4_2	0x2e4
> +#define MFP_PIN_PXA300_5_2	0x2e8
> +#define MFP_PIN_PXA300_6_2	0x2ec

To be consistent with the previous items, could it be something like :
#define MFP_PIN_PXA300_2(gpio) \
  ... etc ...

And so on for the others.

Cheers.

-- 
Robert
