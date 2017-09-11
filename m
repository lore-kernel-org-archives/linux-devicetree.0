From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/6] ARM: dts: imx6dl-icore: Add LVDS support
Date: Mon, 11 Sep 2017 08:25:31 -0300
Message-ID: <CAOMZO5B0RAjdupLSe=S+tDEA-hpf-Si_4qjkcKC_ECX86PLScQ@mail.gmail.com>
References: <1505121145-9507-1-git-send-email-jteki@openedev.com> <1505121145-9507-4-git-send-email-jteki@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505121145-9507-4-git-send-email-jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jagan,

On Mon, Sep 11, 2017 at 6:12 AM, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> +&ldb {
> +       status = "okay";
> +
> +       lvds-channel@0 {
> +               fsl,data-mapping = "spwg";
> +               fsl,data-width = <18>;
> +               status = "okay";
> +
> +               display-timings {
> +                       native-mode = <&timing0>;
> +                       timing0: timing0 {
> +                               clock-frequency = <60000000>;
> +                               hactive = <800>;
> +                               vactive = <480>;
> +                               hback-porch = <30>;
> +                               hfront-porch = <30>;
> +                               vback-porch = <5>;
> +                               vfront-porch = <5>;
> +                               hsync-len = <64>;
> +                               vsync-len = <20>;

Please add the support of this panel to drivers/gpu/drm/panel/panel-simple.c.

Then you can refer its compatible in your board dts.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
