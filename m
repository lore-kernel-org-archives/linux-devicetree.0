From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [RFC PATCH] edac: add support for ARM PL310 L2 cache parity
Date: Wed, 9 Apr 2014 19:47:01 +0200
Message-ID: <20140409174701.GO6529@pd.tnic>
References: <1393770760-32550-1-git-send-email-punnaia@xilinx.com>
 <a1a9e47a-069c-4285-9899-d5a58cf532c2@CO9EHSMHS003.ehs.local>
 <20140409113246.GA8778@pd.tnic>
 <CAL_Jsq+gszc+R_BrLtHKEBGYd=3T+sE1d+-HoF9aYZt6C2k5-g@mail.gmail.com>
 <20140409151932.GK6529@pd.tnic>
 <CAHLkNHJTA5bGD1zAfzE2JrDFAWvmgYyYjir+4vR-d9Fe2-E48g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHLkNHJTA5bGD1zAfzE2JrDFAWvmgYyYjir+4vR-d9Fe2-E48g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary <kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, punnaiah choudary kalluri <kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 09, 2014 at 10:59:49PM +0530, Punnaiah Choudary wrote:
> There is a driver file cache-l2x0.c under arch/arm/mm for pl310 cache
> configuration and management. Russel king had suggested to use
> single driver file for both pl310 edac implementation and cache-l2x0.c
> Here is the thread
> http://www.spinics.net/lists/arm-kernel/msg320407.html
> 
> please provide your inputs

Well, it is very simple - you don't really need an EDAC compilation unit
just so that you can report errors - you can very well do that in your
cache-l2x0.c and boom, problem solved.

Simply move the irq handler and the parity error checker to that file.

:-)

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
