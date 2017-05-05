From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 10/10] arm: dts: genmai: Add ethernet pin group
Date: Fri, 5 May 2017 14:06:01 +0200
Message-ID: <CACRpkdbMpbr_eBnTYA+mBFN4YHUnn2VyuK8PGxz2-Cykv2j83w@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdVHh_40pup1G-1qohS+wEYCFEn6jvOTCnYideQWMxSVLw@mail.gmail.com>
 <SG2PR06MB1165D46E83254B1757C790498A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdU2CvipQQQ8-wxsiniHZJQmUMHv-t52Pw=sHD3YTd7Yug@mail.gmail.com> <SG2PR06MB11650F50D93653212039A4348A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB11650F50D93653212039A4348A130-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 4:48 PM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:

I think this was written by me, not Geert...

>> DT describes hardware, not software limitations.
>
> Describing things is fine, but the kernel code takes the DT and then start configuring things based on it.
>
> For example, on the RSK board, that line is connected to P4_14. P4_14 can be configured as IRQ6...but IRQ6 comes out in 8 different pin choices, and I might want to use one of those other choices, so I don't want to describe P4_14 as an interrupt.
>
> If it was just describing that "pin 15 of the PHY chip is tied to pin Y19 of the RZ/A1H", that's fine because it's hardware connection that's not going to change.
> But...the DT also defines the pin muxing...which is a software decision (do I want to get interrupt or just manually poll or simple ignore it).
> This is the part of the whole "DT is for hardware description only" that doesn't really make sense to me.

OK yeah we do hardware description AND configuration.

And we never do interpreted languages.

And then there is a bunch of grayzone things. For example we have
a linux,input binding for connecting keypresses to certain Linux input
codes. That is really grayzone, but very useful.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
