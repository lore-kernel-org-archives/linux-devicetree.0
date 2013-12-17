From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v3 3/6] pinctrl: Make PINCTRL selectable by
 defconfig/menuconfig
Date: Mon, 16 Dec 2013 16:18:43 -0800
Message-ID: <20131217001842.GB3840@sonymobile.com>
References: <1381174108-25168-1-git-send-email-syin@broadcom.com>
 <1386787041-6035-1-git-send-email-syin@broadcom.com>
 <1386787041-6035-4-git-send-email-syin@broadcom.com>
 <CACRpkdauqYNiby-ta3c_he2ovG__0e6ubmzZ8Bx1cP_OzK4=LQ@mail.gmail.com>
 <CAEPRUYpsp_FVobY_DeEQU2+rCD7q7T=p7k++XvG-22x-OWHY8Q@mail.gmail.com>
 <CACRpkdY2BExGiL6HBg7zn_szJQMnSNsxOSuo7RyrRmrz=cVe2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdY2BExGiL6HBg7zn_szJQMnSNsxOSuo7RyrRmrz=cVe2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Heiko St?bner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon 16 Dec 02:01 PST 2013, Linus Walleij wrote:

> On Thu, Dec 12, 2013 at 10:35 PM, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org> wrote:
> 
> >  I had requested this from Sherman. The reason is so that pinctrl can
> > be selectable through defconfig, instead of through SoC select
> > statements. And the reason for that is so that, in the future, some of
> > these can be switched into loadable modules (which can't be done from
> > Kconfig). This will become necessary with the move to multiplatform -
> > we won't be able to have everything static anymore.
> 
> Isn't it sufficient to make the pin controller entry tristate rather
> than bool?
> 
> And as mentioned elsewhere this does not at all solve the issue
> that we still need to have all basic IRQchips and timer drivers
> compiled into the kernel.

No matter how we build the individual pinctrl drivers we will always
need the pinctrl framework in a multi-soc zImage; so I can't see that
we gain anything from being able to compile PINCTRL as a module.

I don't like compiling the individual pinctrl drivers as modules, as
it leaves us with a waterfall of PROBE_DEFERRs.

Regards,
Bjorn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
