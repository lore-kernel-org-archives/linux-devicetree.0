From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] of/irq: do irq resolution in
 platform_get_irq_byname()
Date: Wed, 28 May 2014 09:39:45 +0100
Message-ID: <20140528083945.7C86CC4089D@trevor.secretlab.ca>
References: <1400582523-22684-1-git-send-email-grygorii.strashko@ti.com>
	<20140523080333.66720C4176E@trevor.secretlab.ca>
	<CAGa+x85mOHtNAj-UHgK2_z8zWAF=qwFcRcUgHTR-byNiX7heHA@mail.gmail.com>
	<CAL_JsqLm3wfVS+au+JUbhBhxz=LuVpepH6GxabCQhPowhbw77g@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLm3wfVS+au+JUbhBhxz=LuVpepH6GxabCQhPowhbw77g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 27 May 2014 19:37:00 -0500, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, May 27, 2014 at 3:23 PM, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Fri, May 23, 2014 at 1:03 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >> On Tue, 20 May 2014 13:42:02 +0300, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org> wrote:
> >>> The commit 9ec36cafe43bf835f8f29273597a5b0cbc8267ef
> >>> "of/irq: do irq resolution in platform_get_irq" from Rob Herring -
> >>> moves resolving of the interrupt resources in platform_get_irq().
> >>> But this solution isn't complete because platform_get_irq_byname()
> >>> need to be modified the same way.
> >>>
> >>> Hence, fix it by adding interrupt resolution code at the
> >>> platform_get_irq_byname() function too.
> >>>
> >>> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> >>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>> Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
> >>> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>>
> >>> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> >>
> >> Applied, Thanks.
> >
> > As of next-20150526, the ST u8500 Snowball board has been failing boot
> > in linux-next, and was bisected down to this patch (commit
> > ad69674e73a1 in -next).   Full boot failure attached.
> >
> > I have not dug any deeper, but can confirm that next-20140526 with
> > this patch reverted boots again on the snowball board.
> 
> There's a patch on the list which fixes it. The problem is stmmac
> driver was expecting only one error code.

Can you send me a link to this patch? I cannot find it in my inbox.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
