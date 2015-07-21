From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: Add dts files for Marvell Berlin4CT SoC
Date: Tue, 21 Jul 2015 15:56:43 +0100
Message-ID: <20150721145643.GD10595@leverpostej>
References: <1437488279-2088-1-git-send-email-jszhang@marvell.com>
 <1437488279-2088-2-git-send-email-jszhang@marvell.com>
 <20150721143426.GC10595@leverpostej>
 <20150721225006.04c3d071@xhacker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150721225006.04c3d071@xhacker>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 21, 2015 at 03:50:06PM +0100, Jisheng Zhang wrote:
> Dear Mark,
> 
> Thanks a lot for so quick review!
> 
> On Tue, 21 Jul 2015 15:34:26 +0100
> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> 
> > Hi,
> > 
> > > +/dts-v1/;
> > > +
> > > +/memreserve/ 0x00000000 0x01000000;
> > 
> > What's this reservation for?
> 
> This is reserved for some firmwares' usage.
> 
> > 
> > Given you're using PSCI I can't see why we'd expect the kernel to map
> > but not use some memory.
> 
> Is it acceptable that we make memory start at 0x01000000 instead of reservation?

Yes, though it would still be worth a comment as to why that memory
can't be used.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
