From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: Device probing proceeds even when the default pinctrl state is
 invalid
Date: Fri, 19 Feb 2016 14:54:33 +0100
Message-ID: <20160219135433.GY2607@odux.rfo.atmel.com>
References: <CAGkQfmOHgOoFrVyKtB+vpmwqs5s2DnLay9zjaksFj5Rbn+4h0g@mail.gmail.com>
 <CACRpkdamPh3pLetWs_S6b_BFWKDgZwiyTaOTQCJsm3cC=ZzLAA@mail.gmail.com>
 <CAGkQfmN7vu6G6Ky3fBhg3_1HmrmUCAGVLokbapS1r7KgyaaKew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGkQfmN7vu6G6Ky3fBhg3_1HmrmUCAGVLokbapS1r7KgyaaKew@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: romain izard <romain.izard@mobile-devices.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Romain,

On Fri, Feb 19, 2016 at 02:30:49PM +0100, romain izard wrote:
> 2016-02-18 21:07 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
> > On Thu, Feb 18, 2016 at 11:37 AM, Romain Izard
> > <romain.izard.pro@gmail.com> wrote:
> >
> >> The current code for device probing tries to map the default pinctrl
> >> state (in pinctrl_bind_pins), but is returning 0 or -EDEFER. If there
> >> is an other error, it is not reported. This means that devices that
> >> do not have any specified pinctrl state can be probed, which is a
> >> correct behaviour that should be conserved, but it can also be an
> >> issue, as it will fail to report any other issue with the specified
> >> pinctrl state.
> >>
> >> Did I miss something that would explain why all other errors are
> >> ignored ?
> >
> > Yeah we should probably respect a few errors and let some pass. Please
> > make a patch!
> >
> 
> I have a hard time choosing which errors should be ignored. For my
> tests, I simply removed the error filtering at the end of
> pinctrl_bind_pins, which works because devices with no pinctrl info are
> already handled in the body of the function. It worked with my board,
> but I am not sure that it covers all use cases. There are no hogs in
> there, for example.
> 
> 8<----------------------------------------------------------------------
> 
> diff --git a/drivers/base/pinctrl.c b/drivers/base/pinctrl.c
> index 076297592754..2d876103fa29 100644
> --- a/drivers/base/pinctrl.c
> +++ b/drivers/base/pinctrl.c
> @@ -91,9 +91,5 @@ cleanup_alloc:
>         devm_kfree(dev, dev->pins);
>         dev->pins = NULL;
> 
> -       /* Only return deferrals */
> -       if (ret != -EPROBE_DEFER)
> -               ret = 0;
> -
>         return ret;
>  }
> 
> 8<----------------------------------------------------------------------
> 

For debug purpose, I think a message to say that a configuration is
needed should be useful in pinconf_validate_map or at higher level such
as dt_node_to_map. It is not obvious for someone who want the default
pin configuration to set it in the device tree.

> >> This also leads to a larger problem, as currently the device tree for
> >> existing boards may specify invalid pinctrl configurations, but the
> >> boards look like they work correctly, as long as nothing else tries
> >> to use the same pins.
> >
> > Well I guess if you look in the debugfs files it looks crazy does it
> > not? That is how I verify that the pins get bound right.  Especially
> > in the file pinmux-pins
> >
> >> Correcting the issue may require a new 'strict-mapping' property in
> >> the pinctrl node in the device tree, otherwise this correction would
> >> be an ABI regression.
> >
> > Bah if the device tree is wrong it is wrong, we certainly do not
> > expect erroneous device trees that just "happen to work" to keep
> > working.
> >
> >> Is this pattern really a good one ? We're moving away from describing
> >> hardware in here.
> >
> > I don't understand.
> >
> I wanted to have your opinion about the using a "strict-mapping"
> property, as this property does not describe the hardware, but describes
> the status of the device tree iself. From the rest of your mail, I
> understand that your point of view is that it's not really needed.
> 

I don't see it as a regression, something is missing in the device tree
so a fix is needed.

> >> For an existing example, in the device tree for Atmel's
> >> SAMA5D2_Xplained board,
> >
> > Where is this device tree, so I can look at it?
> >
> >> the mapping for the Ethernet transceiver's IRQ line was missing it
> >> bias configuration, and thus the pins were not reserved for the
> >> Ethernet use. I've just send a patch to correct it, but breaking
> >> Ethernet on kernel upgrade for the boards using the previous
> >> revisions would be an issue.
> >
> > Hm, ask the Atmel DT maintainers what to do about this...  Nicolas:
> > how real is this ABI issue?
> 
> I've sent the patch to Nicolas and the ARM mailing list, with cc to you.
> See http://permalink.gmane.org/gmane.linux.kernel/2155589
> 
> In this precise case, the mapping for the ethernel interrupt is invalid
> and skipped. It does not lead to a problem, because the line is mapped
> later during the probe sequence to install the interrupt handler.
> 
> When I integrate mapping validation, the probing stops as soon as the
> invalid mapping is detected, and the ethernet controller remains
> unbound, without any loaded driver. As a result, the network interface
> has disappeared. For someone who uses NFS for its rootfs, or anyone
> using relying on the network to use the board, it is broken.
> 
> 
> What I fear is that among the 300+ existing dts files that have a
> "pinctrl-0" property, a fair proportion has an "invalid but working"
> device tree, and the change of behaviour of the pinctrl driver will
> break them. Hence my proposition to mark in the device trees those that
> are known to work correctly.

If we consider device tree as an ABI that shouldn't be broken, it is
difficult to improve things, fix bugs.

Nicolas will be back on Monday.


Regards

Ludovic
