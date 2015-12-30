From: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC 1/1] powerpc: legacy serial port use device tree cell-index property
Date: Wed, 30 Dec 2015 14:12:59 -0600
Message-ID: <20151230201259.GA11741@gate.crashing.org>
References: <1448477209-22340-2-git-send-email-curt@cumulusnetworks.com> <20151220150225.GA27380@gate.crashing.org> <20151230163601.GX14046@cumulusnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151230163601.GX14046-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Curt Brune <curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>
Cc: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 30, 2015 at 08:36:01AM -0800, Curt Brune wrote:
> > What does this do if the value in cell-index is a duplicate. or the port
> > with that number is already created some other way?  Are the numbers in
> > cell-index global anyway, or relative to some parent device (I couldn't
> > find the documentation for this).
> 
> add_legacy_port() has support for handling duplicate index entries.
> Reading that code it looks like the recent entry wins and the older
> entry is moved to the next available index.
> 
> The numbers in cell-index are not global nor explicitly relative to a
> parent device.  I also could not find documentation on this.

That sounds like it should work then.  It does change behaviour for
existing configs.

Thanks,


Segher
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
