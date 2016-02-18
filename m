From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/8] arm64: dts: add Allwinner A64 SoC .dtsi
Date: Thu, 18 Feb 2016 08:36:01 -0600
Message-ID: <20160218143601.GE9654@rob-hp-laptop>
References: <1455709440-8668-1-git-send-email-andre.przywara@arm.com>
 <1455709440-8668-6-git-send-email-andre.przywara@arm.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBV5NS63AKGQEHFW3KRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455709440-8668-6-git-send-email-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 11:43:57AM +0000, Andre Przywara wrote:
> The Allwinner A64 SoC is a low-cost chip with 4 ARM Cortex-A53 cores
> and the typical tablet / TV box peripherals.
> The SoC is based on the (32-bit) Allwinner H3 chip, sharing most of
> the peripherals and the memory map.
> Although the cores are proper 64-bit ones, the whole SoC is actually
> limited to 4GB (including all the supported DRAM), so we use 32-bit
> address and size cells. This has the nice feature of us being able to
> reuse the DT for 32-bit kernels as well.
> This .dtsi lists the hardware that we support so far.
> 
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.txt   |   1 +
>  Documentation/devicetree/bindings/clock/sunxi.txt |   1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi     | 642 ++++++++++++++++++++++
>  3 files changed, 644 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi

[...]

> +	memory {
> +		device_type = "memory";
> +		reg = <0x40000000 0>;
> +	};
> +
> +	gic: interrupt-controller@01c81000 {

Remove the numerous leading 0s on the unit addresses.

With that:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
