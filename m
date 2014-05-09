From: Thor Thayer <tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv3 3/3] edac: altera: Add EDAC support for Altera SDRAM
Date: Fri, 9 May 2014 15:31:53 -0500
Message-ID: <CAF03EBeKbXr-7+qeARkBRXjystMjs4yEWnmw7q8tgJv9-SPgXA@mail.gmail.com>
References: <1399330337-16748-1-git-send-email-tthayer@altera.com>
	<1399330337-16748-4-git-send-email-tthayer@altera.com>
	<20140508120524.GF12548@pd.tnic>
	<CAF03EBecxtMr1670ktQKTAZX_kHeZWz1SwuEk373B99BoVjbDw@mail.gmail.com>
	<20140509135259.GC16260@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140509135259.GC16260-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 9, 2014 at 8:52 AM, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org> wrote:
> On Thu, May 08, 2014 at 03:37:19PM -0500, Thor Thayer wrote:
>> Yes. Their reasoning is that they want to retain the rights and
>> warranty language with the file (just in case the COPYING file
>> changes).
>
> Ok, thanks for checking up on this.
>
>> Yes. I tested using edac_core.edac_mc_panic_on_ue=1 from the command
>> line and it worked fine. I'll add a comment to clarify. BTW, thanks
>> for your help on that.
>
> Sure, but the question still remains: do you want to panic on
> uncorrectable errors by default or want the user to decide? I guess this
> is something you can answer for your hardware...

Yes, good point. Our hardware can't recover from Double Bit Errors so
I'll go back to the panic() in that path. I like the flexibility of
the command line parameter though...

>
>> I considered using "volatile" variables, but decided against it after
>> I read Documentation/volatile-considered-harmful.txt and my situation
>> doesn't fit into the exemptions. Is there a better way to handle this?
>
> Off the top of my head, I'd first look at compiler asm output to
> check what my compiler does with those writes and then take a look at
> employing the ACCESS_ONCE macro or something similar where we use the
> asm volatile() as an optimization stop for the compiler, among others.
>
> And then I'll look at asm again to make sure it does what it is supposed
> to do. Something to that effect, in any case...
>
> HTH.

The reads aren't optimized out now but I'd like to protect against
future optimization changes. I implemented ACCESS_ONCE and checked the
resulting asm output - it looks clean. Thanks.

>
> --
> Regards/Gruss,
>     Boris.
>
> Sent from a fat crate under my desk. Formatting is fine.
> --
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
