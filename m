From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 4/6] ARM: dts: imx7s: add node and supplies for vdd1p2
Date: Sun, 10 Dec 2017 13:20:21 -0200
Message-ID: <CAOMZO5DDFA+8J9tB_jPLqp5fe7RdxV6nUznSh6rDyhMB1c=YZA@mail.gmail.com>
References: <20171205222707.11302-1-tyler@opensourcefoundries.com> <20171205222707.11302-5-tyler@opensourcefoundries.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205222707.11302-5-tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 5, 2017 at 8:27 PM,  <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org> wrote:
> From: Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
>
> Add the regulator nodes and supplies for vdd1p2. This regulator is
> used to power the GPC and USB HSIC PHY.
>
> Signed-off-by: Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx7s.dtsi | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 7b85659..151ab34 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -522,6 +522,20 @@
>                                         anatop-max-voltage = <1200000>;
>                                         anatop-enable-bit = <0>;
>                                 };
> +
> +                               reg_1p2: regulator-vdd1p2@220 {

Using a unit address without a corresponding reg would give you a
warning with W=1.

Please see the patch I sent with Subject:
ARM: dts: imx7s: Add unit address and reg for the anatop nodes
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
