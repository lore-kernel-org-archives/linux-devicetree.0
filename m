From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/7] pinctrl: Renesas RZ/A1 pin and gpio controller
Date: Wed, 29 Mar 2017 03:43:48 +0200
Message-ID: <CACRpkdb48JqghacTsJfiPWHZdpfD1cg1Z7rVWQJO+BmVpVbKHg@mail.gmail.com>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-2-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdYjZJ7e0tJy6_jfpRT+UDFWqnu8ZX18-gaAHVZLgW-prA@mail.gmail.com> <20170324164559.GA15925@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324164559.GA15925@w540>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jacopo <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 5:45 PM, jacopo <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:

> I initially created a whole new sub-directory where all the Renesas
> devices with this kind of pin controller would have gone
> (drivers/pinctrl/rz-pfc) but since as of now the only available
> hardware of that type is RZ/A1 and some of its variants, we decided to go
> with a single driver supporting that platform only.
> If more will come, we'll think about supporting them through this
> driver if possible, or create a dedicated directory.
>
> Are you ok with this?

Yep it's OK. It's no big deal to move it into a new subdir if many
new drivers start popping in anyway.

Right now I see the use of renesas,pins as the only big blocker,
I would much like it to use just pins = <>;

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
