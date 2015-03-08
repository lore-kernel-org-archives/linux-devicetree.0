From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: dts: sun7i: Enable cap-sdio-irq
 for bananapro sdio wifi
Date: Sun, 8 Mar 2015 10:42:30 +0800
Message-ID: <CAGb2v65tcCrg3njNN0owLrM-MUepRBwjxpU46dpXkLhy9mceEA@mail.gmail.com>
References: <1425754884-7875-1-git-send-email-hdegoede@redhat.com> <1425754884-7875-7-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBLXO52TQKGQENUGI5VY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1425754884-7875-7-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 8, 2015 at 3:01 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> The sdio wifi on the Banana Pro does not appear to have an oob irq hooked
> up, so enable sdio-irq support to avoid unnecessary polling.

I wonder if this is stable enough to put back into the mmc driver, i.e.
declare the capability in the driver itself? IIRC at one point it did.

ChenYu

> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-bananapro.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
> index fb89fe7..d0cd78f 100644
> --- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
> @@ -164,6 +164,7 @@
>         vmmc-supply = <&reg_vmmc3>;
>         bus-width = <4>;
>         non-removable;
> +       cap-sdio-irq;
>         status = "okay";
>  };
>
> --
> 2.3.1
