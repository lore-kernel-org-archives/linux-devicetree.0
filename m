From: Emmanuel Vadot <manu@bidouilliste.com>
Subject: Re: [PATCH] ARM: dts: sun7i: Add A20 LCD0 RGB888 pins
Date: Mon, 26 Jun 2017 14:45:40 +0200
Message-ID: <20170626144540.9af644d8ab6140f7f4718d06@bidouilliste.com>
References: <20170626124249.9475-1-net147@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170626124249.9475-1-net147@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Liu <net147@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 26 Jun 2017 22:42:49 +1000
Jonathan Liu <net147@gmail.com> wrote:

> The LCD0 controller on the A20 can do RGB output up to 8 bits per
> channel. Add the pins for RGB888 output.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index 96bee776e145..09a0e89bed11 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -1183,6 +1183,17 @@
>  				function = "ir1";
>  			};
>  
> +			lcd0_rgb888_pins: lcd0_rgb888@0 {
> +				allwinner,pins = "PD0", "PD1", "PD2", "PD3",
> +						 "PD4", "PD5", "PD6", "PD7",
> +						 "PD8", "PD9", "PD10", "PD11",
> +						 "PD12", "PD13", "PD14", "PD15",
> +						 "PD16", "PD17", "PD18", "PD19",
> +						 "PD20", "PD21", "PD22", "PD23",
> +						 "PD24", "PD25", "PD26", "PD27";
> +				allwinner,function = "lcd0";
> +			};
> +

 We switch to standard pinctrl bindings so you need to use 'pins' and
'function' (i.e. without the 'allwinner,' prefix).

>  			mmc0_pins_a: mmc0@0 {
>  				pins = "PF0", "PF1", "PF2",
>  				       "PF3", "PF4", "PF5";
> -- 
> 2.13.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- 
Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>
