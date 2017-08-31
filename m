From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v5 1/3] pinctrl: Add sleep related state to
 indicate sleep related configs
Date: Thu, 31 Aug 2017 09:16:28 +0200
Message-ID: <CACRpkdZPeRpBSWFe88NA0NkV_Thiq7FSrwiCSyado7xBhEAhgg@mail.gmail.com>
References: <eb7925c9642efb8a1ee5804a9b06f06d9f082089.1500018536.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eb7925c9642efb8a1ee5804a9b06f06d9f082089.1500018536.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 17, 2017 at 8:50 AM, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:

> In some scenarios, we should set some pins as input/output/pullup/pulldown
> when the specified system goes into deep sleep mode, then when the system
> goes into deep sleep mode, these pins will be set automatically by hardware.
>
> That means some pins are not controlled by any specific driver in the OS, but
> need to be controlled when entering sleep mode. Thus we introduce one sleep
> state config into pinconf-generic for users to configure.
>
> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
> Changes since v4:
>  - Add sleep-hardware-state config to indicate sleep related configs.

No reactions and I can certainly not think of anything better (I even
suggested this) so patch applied.

Sorry for taking so long to look at this, I've been choked :/

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
