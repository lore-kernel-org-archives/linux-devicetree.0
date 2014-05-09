From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCHv3 3/3] edac: altera: Add EDAC support for Altera SDRAM
Date: Fri, 9 May 2014 22:52:18 +0200
Message-ID: <20140509205218.GA16051@pd.tnic>
References: <1399330337-16748-1-git-send-email-tthayer@altera.com>
 <1399330337-16748-4-git-send-email-tthayer@altera.com>
 <20140508120524.GF12548@pd.tnic>
 <CAF03EBecxtMr1670ktQKTAZX_kHeZWz1SwuEk373B99BoVjbDw@mail.gmail.com>
 <20140509135259.GC16260@pd.tnic>
 <CAF03EBeKbXr-7+qeARkBRXjystMjs4yEWnmw7q8tgJv9-SPgXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF03EBeKbXr-7+qeARkBRXjystMjs4yEWnmw7q8tgJv9-SPgXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thor Thayer <tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 09, 2014 at 03:31:53PM -0500, Thor Thayer wrote:
> Yes, good point. Our hardware can't recover from Double Bit Errors so
> I'll go back to the panic() in that path. I like the flexibility of
> the command line parameter though...

Like to panic by default when the machine is booted normally but to be
able to turn off the panicking with a module parameter?

If so, then you could probably implement a trivial setter called

edac_mc_set_panic_on_ue() in a separate patch.

Then, you call it at the end of altr_sdram_probe().

If you want to turn it off again, you do

echo "0" > /sys/module/edac_core/parameters/edac_mc_panic_on_ue

Something like that...

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
