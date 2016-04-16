From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [Question] reset controlling
Date: Sat, 16 Apr 2016 21:23:23 +0200
Message-ID: <5910310.IeFB0QAt6Q@wuerfel>
References: <CAK7LNATcVwx1q0Nb2WMSpqW3LcoRkZx3RgpMjmbt2EmffJnFvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNATcVwx1q0Nb2WMSpqW3LcoRkZx3RgpMjmbt2EmffJnFvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 17 April 2016 02:49:40 Masahiro Yamada wrote:
> 
> I grepped "clk_register" and "reset_controller_register".
> 
> I know this does not give us the precise number of
> clk/reset providers, but I think it is enough for a rough estimate.
> 
> masahiro@grover:~/workspace/linux$ git grep clk_register | wc
>    3520   18014  308516
> masahiro@grover:~/workspace/linux$ git grep reset_controller_register | wc
>      31     107    2462
>
> 
> Looks like we support 100 times as many clock providers as
> reset providers.

Better count the files:

$ git grep -wl clk_register | wc -l
179

$ git grep -wl reset_controller_register | wc -l
25

This is more like seven times as many, which seems about right.

> In other words, 99% of SoCs support clock controllers,
> but not reset controllers.
> 
> But, I think most of hardware blocks
> have reset signals as well as clocks.
> At least, it is true on my SoCs.

I think a lot of SoCs don't expose the reset signals to software,
but it also has something to with the history: the reset subsystem
is relatively new, so even on older chips that do require them,
the code to drive the resets may be either in the bootloader or
using local hacks in the device driver rather than going through
a proper subsystem.

> What are recommended strategies for reset signals?
> 
> I came up with some options as follows:
> 
> 
> [1] Reset signals should be de-asserted in a firmware (boot-loader)
>     for all the hardware blocks.  Linux kernel need not touch them at all.
> 
> [2] We should really make effort to support more reset drivers,
>     like we do for clock drivers.
> 
> [3] We can (ab)use clock-gate drivers for controlling reset signals.

I don't see it as a serious problem: new chips that have reset controllers
should generally use them, but for older chips there is not as much to
gain by converting the existing code.

[1] is generally ok if you can trust the bootloader to get it right
and there is no difference to power management. In many cases the folks
that work on the kernel however have no control over the bootloader,
and the loaders that ship with devices often get this wrong.

[2] is probably the normal way to do it, and I'd recommend against [3].

> At first, I chose [3] for my SoCs
> with the analogy clk_enable/clk_disable to
> reset_control_deassert/reset_control_assert.
> (and also because the reset sub-system does not support tree-topology
> or enable-count.)
> 
> Reset signals are sometimes cascaded.
> For example, the UART blocks on my SoCs have a reset for the whole of
> UART blocks
> besides per-channel reset signals.
> 
>                      |---(UART ch0 reset)---> UART0
>                      |
> ----(UART reset)-----|---(UART ch1 reset)---> UART1
>                      |
>                      |---(UART ch2 reset)---> UART2
> 
> I found this works well with clk-gate drivers.
> Even reset_control_reset() can be implemented
> with clk_disable() followed by clk_enable().
> 

Interesting. My feeling from your description is that this is something
that should be added to the reset controller subsystem. It has probably
not been a serious issue for anyone else, but it's also likely that you
are not the only one that would benefit from having support for nested
resets in the API.
> 
> Next, I thought about [2].
> It should not be so hard to implement a reset provider.
> 
> But, as I mentioned above, most of drivers handle clocks,
> but not resets.
> 
> Is it worthwhile to patch drivers around
> with reset_control_get_optional()?
> Hmm...

I think it is. All of the 'generic' drivers for devices that are
licensed from e.g. designware or ARM will sooner or later get it,
and devices that are vendor specific are even easier to change
as needed.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
