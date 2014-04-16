From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 1/2] ARM: berlin: add scu and chipctrl device nodes for
 BG2/BG2Q
Date: Wed, 16 Apr 2014 21:03:54 +0200
Message-ID: <534ED41A.3000202@gmail.com>
References: <1395347986-30203-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1395347986-30203-2-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395347986-30203-2-git-send-email-sebastian.hesselbarth@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/20/2014 09:39 PM, Sebastian Hesselbarth wrote:
> This adds scu and general purpose registers device nodes required for
> SMP on Berlin BG2 and BG2Q SoCs. The secondary CPUs will pick their jump
> address from general purpose (SW generic) register 1.
> 
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Applied to berlin/dt.

> ---
>  arch/arm/boot/dts/berlin2.dtsi  | 10 ++++++++++
>  arch/arm/boot/dts/berlin2q.dtsi | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2.dtsi
> index 56a1af2f1052..4d85312dc17a 100644
> --- a/arch/arm/boot/dts/berlin2.dtsi
> +++ b/arch/arm/boot/dts/berlin2.dtsi
> @@ -72,6 +72,11 @@
>  			cache-level = <2>;
>  		};
>  
> +		scu: snoop-control-unit@ad0000 {
> +			compatible = "arm,cortex-a9-scu";
> +			reg = <0xad0000 0x58>;
> +		};
> +
>  		gic: interrupt-controller@ad1000 {
>  			compatible = "arm,cortex-a9-gic";
>  			reg = <0xad1000 0x1000>, <0xad0100 0x0100>;
> @@ -176,6 +181,11 @@
>  			};
>  		};
>  
> +		generic-regs@ea0184 {
> +			compatible = "marvell,berlin-generic-regs", "syscon";
> +			reg = <0xea0184 0x10>;
> +		};
> +
>  		apb@fc0000 {
>  			compatible = "simple-bus";
>  			#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
> index 07452a7483fa..86d8a2c49f38 100644
> --- a/arch/arm/boot/dts/berlin2q.dtsi
> +++ b/arch/arm/boot/dts/berlin2q.dtsi
> @@ -87,6 +87,11 @@
>  			cache-level = <2>;
>  		};
>  
> +		scu: snoop-control-unit@ad0000 {
> +			compatible = "arm,cortex-a9-scu";
> +			reg = <0xad0000 0x58>;
> +		};
> +
>  		local-timer@ad0600 {
>  			compatible = "arm,cortex-a9-twd-timer";
>  			reg = <0xad0600 0x20>;
> @@ -183,6 +188,11 @@
>  			};
>  		};
>  
> +		generic-regs@ea0110 {
> +			compatible = "marvell,berlin-generic-regs", "syscon";
> +			reg = <0xea0110 0x10>;
> +		};
> +
>  		apb@fc0000 {
>  			compatible = "simple-bus";
>  			#address-cells = <1>;
> 
