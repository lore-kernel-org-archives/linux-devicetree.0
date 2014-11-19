From: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5.5] of/fdt: export fdt blob as /sys/firmware/fdt
Date: Wed, 19 Nov 2014 13:09:36 +0000
Message-ID: <1416402576.29243.35.camel@citrix.com>
References: <1415984735-32388-1-git-send-email-ard.biesheuvel@linaro.org>
	 <20141118165145.4F6A8C40966@trevor.secretlab.ca>
	 <20141118172545.GC14323@leverpostej>
	 <20141118221103.4ECB3C40966@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141118221103.4ECB3C40966-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "geoff.levand-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <geoff.levand-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-11-18 at 22:11 +0000, Grant Likely wrote:
> > > * It also helps with exposing the reserved map to userspace, but kexec
> > >   has done without that feature for years, and it is in the process of
> > >   being deprecated in favour of /reserved-memory anyway.
> > 
> > This is the first I'd heard of the reserve map being deprecated, and
> > we're going to have DTs with reserved map entries for a long time going
> > forwards.
> 
> Deprecated, not removed or disabled. It will still work pretty much
> forever, but users should be encouraged to move to the reserve-memory
> tree.

I'm curious why that should be for the "OS should never touch this, here
be dragons" type memory, what are the benefits of the new scheme in that
case?

I can see it for e.g. framebuffer or cma which the OS might actually use
under special circumstances and therefore need more info than just
"don't use this".

It looks like as well as observing the requested reservations Xen might
also need to somehow reflect them to dom0, I need to think on this. If
there are any useful references over and above
Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
then I'd be glad to see them.

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
