From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun6i: a31: Add DAI nodes
Date: Sun, 3 Sep 2017 17:11:20 +0200
Message-ID: <CAEKpxBn6jyh2RF-z040h-H74Z59jeg7yy-4wqbK3uAGc1VO1Dg@mail.gmail.com>
References: <20170903150852.3548-1-codekipper@gmail.com>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBGNXWDGQKGQETFNYDRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170903150852.3548-1-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3 September 2017 at 17:08,  <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Add the new DAI blocks to the device tree.
>
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Hi all,
I haven't got a dev board for this SoC but was able to confirm that
this worked by setting the loopback bit and recording the playback.
BR,
CK
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
> index b147cb0dc14b..f3d74dc5b292 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -662,6 +662,32 @@
>                         status = "disabled";
>                 };
>
> +               i2s0: i2s@01c22000 {
> +                       #sound-dai-cells = <0>;
> +                       compatible = "allwinner,sun6i-a31-i2s";
> +                       reg = <0x01c22000 0x400>;
> +                       interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_APB1_DAUDIO0>, <&ccu CLK_DAUDIO0>;
> +                       resets = <&ccu RST_APB1_DAUDIO0>;
> +                       clock-names = "apb", "mod";
> +                       dmas = <&dma 3>, <&dma 3>;
> +                       dma-names = "rx", "tx";
> +                       status = "disabled";
> +               };
> +
> +               i2s1: i2s@01c22400 {
> +                       #sound-dai-cells = <0>;
> +                       compatible = "allwinner,sun6i-a31-i2s";
> +                       reg = <0x01c22400 0x400>;
> +                       interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_APB1_DAUDIO1>, <&ccu CLK_DAUDIO1>;
> +                       resets = <&ccu RST_APB1_DAUDIO1>;
> +                       clock-names = "apb", "mod";
> +                       dmas = <&dma 4>, <&dma 4>;
> +                       dma-names = "rx", "tx";
> +                       status = "disabled";
> +               };
> +
>                 lradc: lradc@01c22800 {
>                         compatible = "allwinner,sun4i-a10-lradc-keys";
>                         reg = <0x01c22800 0x100>;
> --
> 2.14.1
>
