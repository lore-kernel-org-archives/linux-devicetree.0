From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/8] pinctrl-rockchip: Change wrong initial assumptions
Date: Fri, 9 May 2014 11:19:10 +0200
Message-ID: <CACRpkdbhfVj2-aW2-mJa0c6uq52EKgKJEFy=BJoiqR98F52RaA@mail.gmail.com>
References: <11862890.WUjscWaP3U@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <11862890.WUjscWaP3U@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 5, 2014 at 1:57 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:

> Initially due to lack of documentation and (personal) understanding
> I assumed that the area holding the iomux settings would be separate
> from everything else, while in fact the grf registers contain not onl=
y
> pinctrl stuff but also dma, usb-phy and general soc-status settings.
> Also things like drive-strength we do not support currently are inter=
mixed.
>
> The same is true for the pmu, which does not only contain power domai=
ns
> but also the system reset as well as well as general registers surviv=
ing
> system-resets. Additionally the rk3188 moved parts of the pull-settin=
g
> registers into the pmu space.
>
> While this wasn't a problem until now, the upcoming rk3288 introduces
> additional changes to both the grf and pmu areas. On it even part of
> the pinmux registers move into the pmu space.
>
> The code in it's current form supports both the old as well as the
> changed bindings.
>
> As stated in the v1 thread, this is also a first step to deprecate th=
e
> wrongly included gpio-controllers which now duplicate the recently ad=
ded
> gpio-dwapb, that should be used instead.

Patched 1 thru 7 applied to the pin control tree.

We knew this would be a bumpy ride when the merging started so this
is all expected.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
