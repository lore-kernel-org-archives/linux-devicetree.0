From: "Keiji Hayashibara" <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: RE: [PATCH V2 2/3] watchdog: uniphier: add UniPhier watchdog driver
Date: Thu, 8 Jun 2017 14:51:21 +0900
Message-ID: <000001d2e01b$41b00840$c51018c0$@socionext.com>
References: <1496740294-12653-1-git-send-email-hayashibara.keiji@socionext.com> <1496740294-12653-3-git-send-email-hayashibara.keiji@socionext.com> <CAK7LNARQb3r7fvytCZ86G3iQBpWhu7-06DY9gcJswjH0heUonA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNARQb3r7fvytCZ86G3iQBpWhu7-06DY9gcJswjH0heUonA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: ja
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-2022-jp?B?WWFtYWRhLCBNYXNhaGlyby8bJEI7M0VEGyhCIBskQj8/OTAbKEI=?= <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?iso-2022-jp?B?SGF5YXNoaSwgS3VuaWhpa28vGyRCTlMbKEIgGyRCSy5JJxsoQg==?= <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, =?iso-2022-jp?B?T3dhZGEsIEtpeW9zaGkvGyRCQmdPQkVEGyhCIBskQkA2O1YbKEI=?= <owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Yamada-san,

> > +
> > +#include <linux/module.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/watchdog.h>
> > +#include <linux/bitops.h>
> 
> I think you should have added <linux/bitops.h> on the top
> to keep the includes alphabetically sorted.

Sorry, I will fix in v3 patch.

----------
Best Regards,
Keiji Hayashibara


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
