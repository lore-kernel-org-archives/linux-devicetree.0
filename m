From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] of/irq: do irq resolution in platform_get_irq_byname()
Date: Wed, 28 May 2014 10:03:23 +0100
Message-ID: <CACxGe6ts-TcSKk2F0-XSxAxeTxVCiyDHgh-O12v+F2OjHUsPyg@mail.gmail.com>
References: <1400582523-22684-1-git-send-email-grygorii.strashko@ti.com>
 <20140523080333.66720C4176E@trevor.secretlab.ca> <CAGa+x85mOHtNAj-UHgK2_z8zWAF=qwFcRcUgHTR-byNiX7heHA@mail.gmail.com>
 <CAL_JsqLm3wfVS+au+JUbhBhxz=LuVpepH6GxabCQhPowhbw77g@mail.gmail.com>
 <20140528071855.GJ4227@lee--X1> <CACRpkdYgkEOjLamYu5uKSgs3iTNJ-w5XkbeygKjRdR-bNdETfg@mail.gmail.com>
 <CAGb2v64f8Wju6dtVuVN2x=9YVGA-=RXozzhpJZNspKZ05f=jtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v64f8Wju6dtVuVN2x=9YVGA-=RXozzhpJZNspKZ05f=jtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 28, 2014 at 9:49 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> On Wed, May 28, 2014 at 4:25 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Wed, May 28, 2014 at 9:18 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> On Tue, 27 May 2014, Rob Herring wrote:
>>>
>>>> On Tue, May 27, 2014 at 3:23 PM, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>> > On Fri, May 23, 2014 at 1:03 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>> >> On Tue, 20 May 2014 13:42:02 +0300, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org> wrote:
>>>> >>> The commit 9ec36cafe43bf835f8f29273597a5b0cbc8267ef
>>>> >>> "of/irq: do irq resolution in platform_get_irq" from Rob Herring -
>>>> >>> moves resolving of the interrupt resources in platform_get_irq().
>>>> >>> But this solution isn't complete because platform_get_irq_byname()
>>>> >>> need to be modified the same way.
>>>> >>>
>>>> >>> Hence, fix it by adding interrupt resolution code at the
>>>> >>> platform_get_irq_byname() function too.
>>>> >>>
>>>> >>> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>>>> >>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> >>> Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
>>>> >>> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> >>> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> >>>
>>>> >>> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>>>> >>
>>>> >> Applied, Thanks.
>>>> >
>>>> > As of next-20150526, the ST u8500 Snowball board has been failing boot
>>>> > in linux-next, and was bisected down to this patch (commit
>>>> > ad69674e73a1 in -next).   Full boot failure attached.
>>>> >
>>>> > I have not dug any deeper, but can confirm that next-20140526 with
>>>> > this patch reverted boots again on the snowball board.
>>>>
>>>> There's a patch on the list which fixes it. The problem is stmmac
>>>> driver was expecting only one error code.
>>>
>>> Does Snowball even use stmmac?
>>
>> No.
>>
>> I don't get this...
>
> Log says musb is wrestling control over some pins with some other driver:
>
> [    1.441497] pinctrl-nomadik soc:pinctrl: pin GPIO256_AF28 already
> requested by a03e0000.usb_per5; cannot claim for musb-hdrc.0.auto
> [    1.453369] pinctrl-nomadik soc:pinctrl: pin-256 (musb-hdrc.0.auto)
> status -22
> [    1.460571] pinctrl-nomadik soc:pinctrl: could not request pin 256
> (GPIO256_AF28) from group usb_a_1  on device pinctrl-nomadik
> [    1.472076] musb-hdrc musb-hdrc.0.auto: Error applying setting,
> reverse things back
> [    1.479827] HS USB OTG: no transceiver configured
> [    1.484558] musb-hdrc musb-hdrc.0.auto: musb_init_controller failed
> with status -517
> [    1.492309] platform musb-hdrc.0.auto: Driver musb-hdrc requests
> probe deferral
> [    1.500183] pinctrl-nomadik soc:pinctrl: pin GPIO256_AF28 already
> requested by a03e0000.usb_per5; cannot claim for musb-hdrc.0.auto
> [    1.512023] pinctrl-nomadik soc:pinctrl: pin-256 (musb-hdrc.0.auto)
> status -22
> [    1.519226] pinctrl-nomadik soc:pinctrl: could not request pin 256
> (GPIO256_AF28) from group usb_a_1  on device pinctrl-nomadik
> [    1.530731] musb-ux500 musb-hdrc.0.auto: Error applying setting,
> reverse things back
> [    1.539184] pinctrl-nomadik soc:pinctrl: pin GPIO256_AF28 already
> requested by a03e0000.usb_per5; cannot claim for musb-hdrc.1.auto
> [    1.551025] pinctrl-nomadik soc:pinctrl: pin-256 (musb-hdrc.1.auto)
> status -22
> [    1.558258] pinctrl-nomadik soc:pinctrl: could not request pin 256
> (GPIO256_AF28) from group usb_a_1  on device pinctrl-nomadik
> [    1.569732] musb-hdrc musb-hdrc.1.auto: Error applying setting,
> reverse things back
> [    1.577453] HS USB OTG: no transceiver configured
>
> [ .. repeats until the end .. ]
>
> I think this is not related to this patch.

The bisected patch causes platform_get_irq() to always parse the
devicetree to obtain the irq instead of using a precalculated value in
the platform_device. There are two possible scenarios for this problem
that I can think of:
1) Platform_get_irq() is getting called multiple times (which would
happen on a deferred probe) but the setup code isn't handling it
properly, like trying to request the GPIO more than once
2) the platform_device was preloaded with an irq number that differs
from what is determined when parsing the tree. This would happen if a
platform_device was created manually.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
