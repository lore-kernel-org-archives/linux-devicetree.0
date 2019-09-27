From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] ARM: dts: stm32: Enable high resolution timer
Date: Fri, 27 Sep 2019 12:22:13 +0100
Message-ID: <da48ce9633441cd0186518fa7ce1d528@www.loen.fr>
References: <20190927084819.645-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190927084819.645-1-benjamin.gaignard@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alexandre.torgue@st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2019-09-27 09:48, Benjamin Gaignard wrote:
> Adding always-on makes arm arch_timer claim to be an high resolution 
> timer.
> That is possible because power mode won't stop clocking the timer.

The "always-on" is not about the clock. It is about the comparator.
The clock itself is *guaranteed* to always tick. If it didn't, that'd 
be
an integration bug, and a pretty bad one.

What you're claiming here is that your CPU never enters a low-power 
mode?
Ever? I find this very hard to believe.

Furthermore, claiming that always-on is the way to force the arch-timer
to be an hrtimer is factually wrong. This is what happens *if* this is
the only timer in the system. The only case this is true is for virtual
machines. Anything else has a global timer somewhere that will allow
the arch timers to be used as an hrtimer.

I'm pretty sure you too have a global timer somewhere in your system.
Enable it, and enjoy hrtimers without having to lie about the 
properties
of your system! ;-)

         M.

>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  arch/arm/boot/dts/stm32mp157c.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi
> b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 9b11654a0a39..74f64745d60d 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -50,6 +50,7 @@
>  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  		interrupt-parent = <&intc>;
> +		always-on;
>  	};
>
>  	clocks {

-- 
Jazz is not dead. It just smells funny...
