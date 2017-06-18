From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] watchdog: meson-wdt: add support for the watchdog on
 Meson8 and Meson8m2
Date: Sun, 18 Jun 2017 09:04:39 -0500
Message-ID: <20170616180009.h66dwnnhfwrjpui6@rob-hp-laptop>
References: <20170611095219.22095-1-martin.blumenstingl@googlemail.com>
 <20170615172510.GA7549@roeck-us.net>
 <CAFBinCCyqX=TGwTyhxXZPP2noUvJ1v=xNs+Vs17Gg4z2uDgjEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFBinCCyqX=TGwTyhxXZPP2noUvJ1v=xNs+Vs17Gg4z2uDgjEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 11:13:07PM +0200, Martin Blumenstingl wrote:
> On Thu, Jun 15, 2017 at 7:25 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> > On Sun, Jun 11, 2017 at 11:52:19AM +0200, Martin Blumenstingl wrote:
> >> The watchdog IP block on Meson8 and Meson8m2 is already supported by the
> >> existing meson-wdt driver. Meson8 uses the same register bits as Meson6,
> >> while the newer Meson8m2 SoC uses the same register bits as Meson8b.
> >>
> >> Currently watchdog support on Meson8 SoC already works because
> >> meson8.dtsi simply uses the "amlogic,meson6-wdt" compatible. Adding a
> >> separate compatible for Meson8 makes this more explicit though.
> >>
> >> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> >
> > Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> thank you!
> is there anything holding you up from taking this patch (for example:
> are you still missing any specific Signed-off-by / Acked-by)?
> 
> > In general, changes like this are not necessary, though. The dts file
> > is supposed to reference both generic and specific compatible strings.
> I thought about skipping this patch, but I find that it looks strange without.
> 
> the hierarchy and the corresponding compatible strings would be:
> meson.dtsi / compatible = "amlogic,meson6-wdt";
> |- meson8.dtsi / compatible = "amlogic,meson8-wdt", "amlogic,meson6-wdt";
>    |- meson8m2.dtsi (upcoming) / compatible = "amlogic,meson8m2-wdt",
> "amlogic,meson8b-wdt";
> |- meson8b.dtsi / compatible = "amlogic,meson8b-wdt";
> 
> instead of this seemingly random mixup of compatible strings I decided
> to introduce separate ones for each SoC.

But if the block is backwards compatible, you should also provide a 
fallback compatible string.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
