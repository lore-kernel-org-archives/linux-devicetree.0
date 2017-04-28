From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 02/30] pinctrl: mediatek: reuse pinctrl driver for mt7623
Date: Fri, 28 Apr 2017 10:01:52 +0200
Message-ID: <CACRpkdbR-k3wgD+7KoV6d7yg1uduXpa9MO0+woEibQYPeYzgYw@mail.gmail.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com> <1493198774-4478-3-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493198774-4478-3-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 26, 2017 at 11:25 AM,  <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> mt7623 pinctrl driver can be compatible with mt2701 one,
> so the patch reuses the driver and deletes those redundant
> ones.
>
> Cc: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Partly correct.

>         "mediatek,mt6397-pinctrl", compatible with mt6397 pinctrl.
> -       "mediatek,mt7623-pinctrl", compatible with mt7623 pinctrl.

NO don't do this.

"compatible" means exactly this: this hardware is compatible with
this driver. That is why we have it!

So instead of mt7623 pretending to be mt2701, let the mt2701 driver
list that it is compatible with mt7623, simple.

So patch pinctrl-mt2701.c mt2701_pctrl_match[] instead.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
