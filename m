From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 2/8] ARM: dts :sun7i: Add SPDIF TX pin to
 the A20
Date: Wed, 23 Mar 2016 18:28:09 +0800
Message-ID: <CAGb2v64VRrM-_AAt5Xbgxc4y+-3-=mPWvuQubrHjmufUAKUA+w@mail.gmail.com>
References: <1458590466-12572-1-git-send-email-codekipper@gmail.com> <1458590466-12572-3-git-send-email-codekipper@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBU67ZG3QKGQENVSWGAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1458590466-12572-3-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 22, 2016 at 4:01 AM,  <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

nit: space should be after colon, not after dts, in subject.
Same for the RX pin patch.

ChenYu

> Add the SPDIF TX pin to the A20 dtsi.
>
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index 0940a78..0c207d0 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -1193,6 +1193,13 @@
>                                 allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>                                 allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>                         };
> +
> +                       spdif_tx_pins_a: spdif@0 {
> +                               allwinner,pins = "PB13";
> +                               allwinner,function = "spdif";
> +                               allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +                               allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
> +                       };
>                 };
>
>                 timer@01c20c00 {
> --
> 2.7.4
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
