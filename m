From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v12 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Mon, 19 Nov 2018 17:38:09 +0530
Message-ID: <CAMty3ZAprBAxAm+=1kpFsbhV3XGvmQ8XEW+6mOcsV5iaR3xNyQ@mail.gmail.com>
References: <1540887490-28316-1-git-send-email-yong.deng@magewell.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBNWPZLPQKGQE5QSUVCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1540887490-28316-1-git-send-email-yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-media <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 30, 2018 at 1:49 PM Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org> wrote:
>
> Allwinner V3s SoC features a CSI module with parallel interface.
>
> This patch implement a v4l2 framework driver for it.
>
> Reviewed-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Tested-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> ---
>  MAINTAINERS                                        |   8 +
>  drivers/media/platform/Kconfig                     |   1 +
>  drivers/media/platform/Makefile                    |   2 +
>  drivers/media/platform/sunxi/sun6i-csi/Kconfig     |   9 +
>  drivers/media/platform/sunxi/sun6i-csi/Makefile    |   3 +
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 915 +++++++++++++++=
++++++
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h | 135 +++
>  .../media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h | 196 +++++
>  .../media/platform/sunxi/sun6i-csi/sun6i_video.c   | 678 +++++++++++++++
>  .../media/platform/sunxi/sun6i-csi/sun6i_video.h   |  38 +
>  10 files changed, 1985 insertions(+)
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/Kconfig
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/Makefile
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.=
h
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
>  create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 23021e0df5d7..42d73b35ed3e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3900,6 +3900,14 @@ M:       Jaya Kumar <jayakumar.alsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  S:     Maintained
>  F:     sound/pci/cs5535audio/
>
> +CSI DRIVERS FOR ALLWINNER V3s
> +M:     Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> +L:     linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +T:     git git://linuxtv.org/media_tree.git
> +S:     Maintained
> +F:     drivers/media/platform/sunxi/sun6i-csi/
> +F:     Documentation/devicetree/bindings/media/sun6i-csi.txt
> +
>  CW1200 WLAN driver
>  M:     Solomon Peachy <pizza-pCgMCH4qpMRg9hUCZPvPmw@public.gmane.org>
>  S:     Maintained
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kcon=
fig
> index 0edacfb01f3a..be6626ed0ec8 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -138,6 +138,7 @@ source "drivers/media/platform/am437x/Kconfig"
>  source "drivers/media/platform/xilinx/Kconfig"
>  source "drivers/media/platform/rcar-vin/Kconfig"
>  source "drivers/media/platform/atmel/Kconfig"
> +source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"

[snip]

> +
> +       return 0;
> +}
> +
> +static int sun6i_subdev_notify_complete(struct v4l2_async_notifier *noti=
fier)
> +{
> +       struct sun6i_csi *csi =3D container_of(notifier, struct sun6i_csi=
,
> +                                            notifier);
> +       struct v4l2_device *v4l2_dev =3D &csi->v4l2_dev;
> +       struct v4l2_subdev *sd;
> +       int ret;
> +
> +       dev_dbg(csi->dev, "notify complete, all subdevs registered\n");
> +
> +       if (notifier->num_subdevs !=3D 1)

drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c: In function
=E2=80=98sun6i_subdev_notify_complete=E2=80=99:
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:646:14: error:
=E2=80=98struct v4l2_async_notifier=E2=80=99 has no member named =E2=80=98n=
um_subdevs=E2=80=99

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
