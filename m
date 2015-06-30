From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: mt8173: Add I2C device node
Date: Tue, 30 Jun 2015 08:26:45 +0200
Message-ID: <CACRpkdY4=SSZQRQY_ydcsv-S8ezrYbzp2rdD4qRuHkF8oowOEw@mail.gmail.com>
References: <1434101229-32695-1-git-send-email-eddie.huang@mediatek.com>
	<1434101229-32695-3-git-send-email-eddie.huang@mediatek.com>
	<CAGS+omB1UadXeKZLmMdhSamsPpipQLmoH_PhbUPvszrYTq68fA@mail.gmail.com>
	<1863259.t4daGE7nbQ@ubix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1863259.t4daGE7nbQ@ubix>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 12, 2015 at 7:13 PM, Matthias Brugger
<matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> In the future when all the device drivers are implemented, this gets you a
> really huge dtsi. AFAIK this can cause a somewhat long parsing time of the dtb
> when booting the system.

Boot time claims need to be backed up with ftrace logs or something. One of
the arguments against device tree in the beginning was parse time and then
we made measurements and it proved moot.

However being unable to manage the dts[i] sources is a valid argument for
simplifying and splitting up stuff.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
