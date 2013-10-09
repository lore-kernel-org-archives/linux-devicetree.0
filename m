From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: phandle entries will be applied sequentially
Date: Wed, 9 Oct 2013 14:40:49 +0200
Message-ID: <CACRpkdazPK6SNg9PdWCrjB8nwho1rCueumJWAN=STXdN1zNnMA@mail.gmail.com>
References: <1381297324-19006-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381297324-19006-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 9, 2013 at 7:42 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> It's naturally expected that when there are multiple phandle entries
> specified in pinctrl-* property, these entries will be applied
> sequentially.  And this is how Linux kernel works.  So let's define
> this behavior in the binding doc.

NAK this this a Linux kernel implementation detail. Sherman Yin
fixed this up so the drivers does not have to imply any sequence
semantic for this.

Study commit 03b054e9696c3cbd3d5905ec96da15acd0a2fe8d
"pinctrl: Pass all configs to driver on pin_config_set()"

It is perfectly legal for a driver to accumulate the settings into
e.g. a single register write if it can, e.g.:

u32 val = 0;

for (i = 0; i < num_configs; i++) {
  switch() {
  FOO:
     val |= 1;
     break;
   BAR:
     val |= 2:
     break;
   BAZ:
     val |=4;
     break;
};

writel(val, base+pinreg);

I.e. the driver may choose to apply configs sequentially, but that is
not at all necessary.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
