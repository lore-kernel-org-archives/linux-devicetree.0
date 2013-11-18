From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Mon, 18 Nov 2013 11:13:36 -0800
Message-ID: <20131118191336.GB5886@quad.lixom.net>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
 <5289A356.4060004@jonmasters.org>
 <20131118150052.GC24408@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131118150052.GC24408-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

[adding back devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org]

On Mon, Nov 18, 2013 at 03:00:52PM +0000, Mark Brown wrote:
> On Mon, Nov 18, 2013 at 12:19:18AM -0500, Jon Masters wrote:
> 
> > has an API enshrined in stone as far as compatibility. Device Tree is
> > wonderful, anyone can make a binding and use it. Or change the binding
> > in the next kernel release. Or...this doesn't work in the server space.
> 
> This isn't really a property of DT, it's a property of the way people
> have been using the DT - people have been running with baked in DTs on
> PowerPC and SPARC systems for quite some time now.  It's not obvious how
> writing the data out in one format rather than another addresses this.

+1. And we're now changing the way DT is approached in a manner that will
solve this problem.

I know people have been frustrated that they need to keep the DT in sync with
the kernel. But we've always been upfront with the requirement, and why we've
been having it. We're now changing this requirement, which should help sort out
practically all of the concerns at hand.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
