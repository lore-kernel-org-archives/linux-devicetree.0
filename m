From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: Fwd: [PATCH] x86/devicetree: Fix compile warnings on AMD64
Date: Thu, 28 Aug 2014 15:34:34 +0200
Message-ID: <53FF2FEA.8070302@linutronix.de>
References: <1407230388-14211-1-git-send-email-ricardo.ribalda@gmail.com> <CAPybu_39pLQ6gvKOPuLNCnn46Y50QU36C5thJmxrNmCzGN+MAQ@mail.gmail.com> <53FF2B17.4030600@linutronix.de> <CAPybu_2shGr+OROg=QkQwmXW4wmNEVzKypKOJRyiZxZh37bp3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_2shGr+OROg=QkQwmXW4wmNEVzKypKOJRyiZxZh37bp3g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/28/2014 03:23 PM, Ricardo Ribalda Delgado wrote:
> The problem is that it is a fwd message?  I did send it first the 5th
Yes.

> of August and did not get any feedback, this is why I tried to
> different destinations. Shall I just resend it?

Usually you just add a RESEND / REPOST before the patch tag. The
forward header makes the submission useless (unless the TIP team has
time to manually edit the patch).

> I am working on an fpga camera (http://qtec.com) connected via pcie to
> an amd fusion APU (64 bits). The hardware of the fpga is described
> with devicetrees.

So you are telling me that there is (or will be) 64bit x86 hardware
which is using the device tree instead EFI, SFI or something like that.
Is that so?
If so it is worth mentioning that in the patch description that this
code is used on x86 hard which is not yet part of the kernel.
Either way, the x86 team + lkml is the destination that should apply
that patch so a proper repost (with the altered description I
mentioned) would be nice.

> Thanks!

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
