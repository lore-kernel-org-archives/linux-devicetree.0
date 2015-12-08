From: Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 2/3] nvmem: mediatek: Add Mediatek EFUSE driver
Date: Tue, 8 Dec 2015 12:52:33 +0800
Message-ID: <CANMq1KBKfO6pP4nZ4XBSpeG8b1AHd9Co9KqxW3CRbtZvfJJNDg@mail.gmail.com>
References: <1447930014-19579-1-git-send-email-andrew-ct.chen@mediatek.com>
	<1447930014-19579-3-git-send-email-andrew-ct.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447930014-19579-3-git-send-email-andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 19, 2015 at 6:46 PM, Andrew-CT Chen
<andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Add Mediatek EFUSE driver to access hardware data like
> thermal sensor calibration or HDMI impedance.
>
> Signed-off-by: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/nvmem/Kconfig     | 11 ++++++
>  drivers/nvmem/Makefile    |  2 ++
>  drivers/nvmem/mtk-efuse.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 102 insertions(+)
>  create mode 100644 drivers/nvmem/mtk-efuse.c
>
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index bc4ea58..ea7ec17 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -36,6 +36,17 @@ config NVMEM_MXS_OCOTP
>           This driver can also be built as a module. If so, the module
>           will be called nvmem-mxs-ocotp.
>
> +config MTK_EFUSE

Nit: I think this entry should be between NVMEM_IMX_OCOTP and
NVMEM_MXS_OCOTP (looks like NVMEM_ prefix is ignored in the ordering).

> [snip]

The rest looks good.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
