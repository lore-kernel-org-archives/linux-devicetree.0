From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: allwinner: a64: add SRAM
 controller device tree node
Date: Thu, 14 Jun 2018 22:39:56 +0530
Message-ID: <CAMty3ZARNpBOQKvS7knH8kWE2+bvjuJoAA4cFGZK8+GzTUQ5zA@mail.gmail.com>
References: <20180614153548.9644-1-wens@csie.org> <20180614153548.9644-5-wens@csie.org>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBZOCRLMQKGQEHAG3W4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180614153548.9644-5-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 14, 2018 at 9:05 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>
> Allwinner A64 has a SRAM controller, and in the device tree currently
> we have a syscon node to enable EMAC driver to access the EMAC clock
> register. As SRAM controller driver can now export regmap for this
> register, replace the syscon node to the SRAM controller device node,
> and let EMAC driver to acquire its EMAC clock regmap.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> [wens-jdAy2FN1RRM@public.gmane.org: Updated compatible string]
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 1b2ef28c42bd..87968dafe1dc 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -169,9 +169,24 @@
>                 ranges;
>
>                 syscon: syscon@1c00000 {
> -                       compatible = "allwinner,sun50i-a64-system-controller",
> -                               "syscon";
> +                       compatible = "allwinner,sun50i-a64-system-control";
>                         reg = <0x01c00000 0x1000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges;
> +
> +                       sram_c: sram@18000 {
> +                               compatible = "mmio-sram";
> +                               reg = <0x00018000 0x28000>;
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               ranges = <0 0x00018000 0x28000>;
> +
> +                               de2_sram: sram-section@0 {

So, this can attach to display-engine node through allwinner,sram and
add support to claim the sram on sun4i/sun4i_drv.c, correct?
