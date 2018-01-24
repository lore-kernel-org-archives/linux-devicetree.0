From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH 4/5] arm64: allwinner: a64: Add SPDIF to the Pine64
Date: Wed, 24 Jan 2018 13:10:58 +0100
Message-ID: <CAEKpxB=xB=2nJ1KjiDG=VoMT0TBdOO=rbBypWBr-o2Mag_fXew@mail.gmail.com>
References: <20180124103943.2062-1-codekipper@gmail.com> <20180124103943.2062-5-codekipper@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180124103943.2062-5-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24 January 2018 at 11:39,  <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
NACK.....just noticed the lack of commit message...mmmm
BR,
CK
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> index 604cdaedac38..70e8ff9a1f38 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> @@ -230,6 +230,13 @@
>         regulator-name = "vcc-rtc";
>  };
>
> +/* On Euler connector */
> +&spdif {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&spdif_tx_pins_a>;
> +       status = "disabled";
> +};
> +
>  /* On Exp and Euler connectors */
>  &uart0 {
>         pinctrl-names = "default";
> --
> 2.16.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
