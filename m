From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] edac: altera: Add SDRAM EDAC support for
 CycloneV/ArriaV
Date: Tue, 8 Apr 2014 17:10:54 +0100
Message-ID: <20140408161054.GA26210@e106331-lin.cambridge.arm.com>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
 <1396907649-20212-4-git-send-email-tthayer@altera.com>
 <20140408100851.GF30077@pd.tnic>
 <1396965459.23349.4.camel@dinh-ubuntu>
 <20140408152406.GI30077@pd.tnic>
 <20140408154017.GF11876@e106331-lin.cambridge.arm.com>
 <20140408160351.GK30077@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140408160351.GK30077-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org" <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 08, 2014 at 05:03:51PM +0100, Borislav Petkov wrote:
> On Tue, Apr 08, 2014 at 04:40:17PM +0100, Mark Rutland wrote:
> > The patches should be in the same series, but for review purposes it's
> > nicer if the bindings are separate patches from the code within that
> > series.
> >
> > I usually look at the drivers implementing bindings and prefer to be
> > Cc'd on the whole series, with both the binding and driver.
> 
> Right, but I got only the 3/3 patch on linux-edac which made me wonder.

Ah. The whole series should've been Cc'd to linux-edac; I didn't realise
that wasn't the case.

> So I'm guessing you or someone else would be picking the whole set once
> I've acked the EDAC part?

Typically the bindings would go with the driver via the appropriate
subsystem maintainer. That way we don't get bindings without drivers or
vice-versa if there's a problem part-way, and we don't end up with every
other driver going via a dt tree.

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
