From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v8 4/8] ARM: dts: Enable Broadcom Cygnus SoC
Date: Sun, 09 Nov 2014 21:38:25 +0100
Message-ID: <5982323.RDuqIHPULA@wuerfel>
References: <sbranden@broadcom.com> <CAOesGMhd37UM+7+6eR9iLY22Fb9cG1dr8dD4DAzLJNRmtysnkg@mail.gmail.com> <20141109172311.GB738@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141109172311.GB738-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, JD Zheng <jdzheng@br>
List-Id: devicetree@vger.kernel.org

On Sunday 09 November 2014 09:23:11 Greg Kroah-Hartman wrote:
> On Sat, Nov 08, 2014 at 10:49:09PM -0800, Olof Johansson wrote:
> > >>> +/*
> > >>> + * Copyright 2014 Broadcom Corporation.  All rights reserved.
> > >>> + *
> > >>> + * Unless you and Broadcom execute a separate written software license
> > >>> + * agreement governing use of this software, this software is licensed
> > >>> to you
> > >>> + * under the terms of the GNU General Public License as
> > >>> + * published by the Free Software Foundation version 2.
> > >>> + *
> > >>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> > >>> + * kind, whether express or implied; without even the implied warranty
> > >>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > >>> + * GNU General Public License for more details.
> > >>
> > >>
> > >> We ask for new DT contents to be added with dual BSD/GPL license, to
> > >> allow for reuse of the DT data structures in other projects as well.
> > >> There's currently a lot of activity going on relicensing the current
> > >> files so I recommend sorting it out before they are added if you can.
> > >
> > >
> > > This may take more time than you think.  I am going to have to go through
> > > legal to get such a license created. Also, why would you need dual license?
> > > If it is BSD that should serve both purposes?
> >
> > I haven't followed the discussion close enough to know if there's been
> > discussion about single-license BSD vs dual BSD/GPL.

I think for all practical purposes, BSD and dual BSD/GPL is the same and
listing it as dual was meant as a clarification to make it easier to see
that all files in the kernel are GPLv2 compatible.
 
> > At the very least, please start the process of getting it changed.
> > 
> > Also, I see now that this isn't even a clean GPL v2, given "Unless you
> > and Broadcom..." language. I see the bnx2x driver had that in the
> > past, but none of the Kona contributions did. I strongly suggest
> > sticking to the normal copyrights here and not making things more
> > complicated than they have to.
> 
> I'm thinking that the "unless you and Broadcom..." language really
> doesn't mean much other than what all other files in the kernel mean
> from what I can tell.  This should just default to GPLv2 and everyone
> should be ok.

I would hope so at least. It's certainly not obvious whether that means
Broadcom can give additional rights to someone over what someone else
contributed upstream, or worse if this becomes GPL-incompatible and
makes the kernel undistributable for anybody who has an additional
license agreement that doesn't give them all the rights that they already
had under the GPL.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
