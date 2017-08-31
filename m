From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v5 3/3] pinctrl: sprd: Add Spreadtrum pin control driver
Date: Thu, 31 Aug 2017 09:25:43 +0200
Message-ID: <CACRpkdZ=mHqGX0sdjWaOOvib9O-bW5tJoO1fJ4_-hxKODBusjw@mail.gmail.com>
References: <eb7925c9642efb8a1ee5804a9b06f06d9f082089.1500018536.git.baolin.wang@spreadtrum.com>
 <f41270ddc53d11b746c2cc7c66b323e11381938f.1500018536.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f41270ddc53d11b746c2cc7c66b323e11381938f.1500018536.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 17, 2017 at 8:50 AM, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:

> This patch adds the pin control driver for Spreadtrum SC9860 platform.
>
> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
> Changes since v4:
>  - Remove sleep configs.
>  - Use one standard sleep hardware state config to indicate sleep configs.

Patch applied.

AFAICT this is a fine driver and you did a good job.

Thanks for standing out to my slowness.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
