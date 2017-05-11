From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: add ZTE ZX pinctrl driver support
Date: Thu, 11 May 2017 09:29:38 +0200
Message-ID: <CACRpkdaA6TsQqF1-88R5DJ5VYf6P1wGhsLR8Oee-hxH4sJ0Gng@mail.gmail.com>
References: <1493038873-18354-1-git-send-email-shawnguo@kernel.org> <1493038873-18354-3-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493038873-18354-3-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Xin Zhou <zhou.xin8-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 24, 2017 at 3:01 PM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> The pin controller on ZTE ZX platforms is kinda of hybrid.  It consists
> of a main controller and an auxiliary one.  For example, on ZX296718 SoC,
> the main controller is TOP_PMM and the auxiliary one is AON_IOCFG.  Both
> controllers work together to control pin multiplexing and configuration.
>
> For most of pins, the pinmux function is controlled by main controller
> only, and this type of pins are meant by term 'TOP pins'.  For other
> pins, the pinmux is controlled by both main and auxiliary controllers,
> as the available multiplexing functions for the pin spread in both
> controllers.  This type of pins are called 'AON pins'.  Though pinmux
> implementation is quite different, pinconf is same for both types of
> pins.  Both are controlled by auxiliary controller, i.e. AON_IOCFG on
> ZX296718.
>
> The patch adds the ZTE ZX core pinctrl driver to support this hybrid
> pin controller as well as ZX296718 SoC specific pin data.
>
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Excellent work as usual Shawn.
Patch applied for v4.13.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
