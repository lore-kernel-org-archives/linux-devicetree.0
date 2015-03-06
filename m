From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/2] pinctrl: Support for IMG Pistachio
Date: Fri, 6 Mar 2015 10:07:40 -0800
Message-ID: <CAL1qeaEqcL24DM=w4jgboAvDRi93AidkC9soXPAV9uF4C18JCg@mail.gmail.com>
References: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
	<CACRpkdbCOHNPs5Y58h--X6pOVvYyxTrgcFhFyk5dWE+JLo=rhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbCOHNPs5Y58h--X6pOVvYyxTrgcFhFyk5dWE+JLo=rhg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 6, 2015 at 3:29 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Feb 24, 2015 at 3:15 AM, Andrew Bresticker
> <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
>>  I'd like this to go through the MIPS tree with
>> Linus'/Alex's ACKs if possible.
>
> Why? It will only help creating merge conflicts.
> There seem to be no compile-related dependencies, just Kconfig
> symbols, so patches using this can go in orthogonally.

Ah, ok.  If the missing Kconfig symbol is not a big deal, then let's
take them through your tree.

-Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
