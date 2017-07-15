From: Marcus Wolf <marcus.wolf-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
Subject: Re: Submit of a driver for Pi433 - a radio module for Raspberry Pi
Date: Sat, 15 Jul 2017 14:59:25 +0200 (CEST)
Message-ID: <89433969.66090.1500123565835@ox.hosteurope.de>
References: <281067739.16216.1499788929736@ox.hosteurope.de>
 <20170712074305.GA20198@kroah.com>
 <197075499.65628.1500117344413@ox.hosteurope.de>
 <20170715112454.GB1753@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170715112454.GB1753-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!
 
It's me again. Seems like I also need help on sending the email :-/
 
I checked the whitespace/line wrap problem, but couldn't find any suspicious
lines.
 
What I did:
* Looked into my outbox - the copy of my mail to you seems to be okay...
* I sent the patch once again (just to me) - result: Seems to be fine, too.
 
Maybe you can bounce back my mail? Maybe I'll get an idea what went wrong, if I
see the smashed code...
 
Cheers,
 
Marcus
 

> Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> hat am 15. Juli 2017 um 13:24
> geschrieben:
>
>
> On Sat, Jul 15, 2017 at 01:15:43PM +0200, Marcus Wolf wrote:
> > Hi Greg,
> >
> > thanks for your reply :-)
> >
> > Today I moved the documentation and header files to drivers/staging/pi433
> > and
> > fromated it as a single patch.
> >
> > Cheers,
> >
> > Marcus
>
> I still need it in a format I can apply it in (i.e. proper subject,
> changelog text, signed-off-by, etc.) Can you do that?
>
> Also, for staging drivers, I need a TODO file, much like the existing
> drivers/staging/*/TODO files saying what needs to be done with the code
> in order to get it out of staging.
>
> And finally, your patch seemed to have the whitespace corrupted and was
> line-wrapped, making it impossible to apply even if I could have :(
>
> thanks,
>
> greg k-h
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
