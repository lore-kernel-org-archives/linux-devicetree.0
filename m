From: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dtb: Create a common home for cross-architecture dtsi
 files.
Date: Fri, 24 Jul 2015 12:39:01 +0100
Message-ID: <1437737941.24746.75.camel@citrix.com>
References: <1437496204-5438-1-git-send-email-ian.campbell@citrix.com>
	 <20150722084753.GC14923@e106497-lin.cambridge.arm.com>
	 <1437558438.8383.72.camel@citrix.com> <20150724113149.GE4348@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150724113149.GE4348@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Kristina Martsenko <Kristina.Martsenko-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2015-07-24 at 12:31 +0100, Mark Rutland wrote:
> On Wed, Jul 22, 2015 at 10:47:18AM +0100, Ian Campbell wrote:
> > On Wed, 2015-07-22 at 09:47 +0100, Liviu Dudau wrote:
> > > 
> > > Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > 
> > Thanks.
> > 
> > > Picking your brains here: would it be worth to have some vendor 
> > > directories in
> > > this shared area or we can hope that there will be very few files 
> > > living here?
> > 
> > I'm honestly not sure.
> > 
> > I don't expect there will be very many files under here, and I 
> > would
> > expect the norm would be that common .dtsi files used by multiple
> > arches would be things from the same vendor, but I don't think we 
> > can
> > guarantee that.
> 
> I'm not so sure that this area will remain small. I suspect we'll see
> a reasonable amount of sharing for arm/arm64 where two SoCs differ 
> sith
> s/Cortex-A7/Cortex-A53/, for example.
> 
> Perhaps we could wait until the that starts to happen; we managed to
> survive for a while before moving arm64's dts into subdirs.

If we think it is inevitable we may as well bite the bullet, plus I've
already done "git commit --amend" to move it to include/dt-dtsi/arm ;-)

Ian. 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
