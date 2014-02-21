From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: SPDX-License-Identifier
Date: Fri, 21 Feb 2014 09:57:20 -0800
Message-ID: <20140221175720.GA21660@kroah.com>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local>
 <20140220182257.GF23217@saruman.home>
 <5306F458.9010706@monstr.eu>
 <20140221160442.GA17506@kroah.com>
 <5307790A.4050806@monstr.eu>
 <20140221161246.GM31902@saruman.home>
 <53077C5F.9000407@monstr.eu>
 <20140221162045.GN31902@saruman.home>
 <20140221165633.GA5465@kroah.com>
 <53078C30.7060703@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53078C30.7060703-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 21, 2014 at 06:26:08PM +0100, Michal Simek wrote:
> On 02/21/2014 05:56 PM, Greg Kroah-Hartman wrote:
> > On Fri, Feb 21, 2014 at 10:20:45AM -0600, Felipe Balbi wrote:
> >> Hi,
> >>
> >> On Fri, Feb 21, 2014 at 05:18:39PM +0100, Michal Simek wrote:
> >>> On 02/21/2014 05:12 PM, Felipe Balbi wrote:
> >>>> On Fri, Feb 21, 2014 at 05:04:26PM +0100, Michal Simek wrote:
> >>>>> On 02/21/2014 05:04 PM, Greg Kroah-Hartman wrote:
> >>>>>> On Fri, Feb 21, 2014 at 07:38:16AM +0100, Michal Simek wrote:
> >>>>>>> BTW: u-boot started to use SPDX-License-Identifier
> >>>>>>> which will be nice to start to use.
> >>>>>>
> >>>>>> I agree, feel free to start sending patches to use this type of
> >>>>>> identifier for drivers.
> >>>>>
> >>>>> But we probably need to add that Licenses to one location.
> >>>>> Documentation/Licenses?
> >>>>
> >>>> Just add to the drivers themselves, just like u-boot is doing. A simple:
> >>>>
> >>>> 	$ git grep -e SPDX-License-Identifier
> >>>>
> >>>> will tell you filename and license. Or did I misunderstand your question ?
> >>>
> >>> But for doing this it is probably necessary to have location where
> >>> you will place that licenses and you will explain what it is how
> >>> it is done by Wolfgang in this commit.
> >>>
> >>> http://git.denx.de/?p=u-boot.git;a=commitdiff;h=eca3aeb352c964bdb28b8e191d6326370245e03f
> >>>
> >>> Then yes, adding one line is enough.
> >>
> >> spdx.org has all licenses, why don't we just rely on that instead of
> >> adding every other license to the kernel source ?
> > 
> > Yes, all that will be acceptable is a one-line identifier in the file.
> > No need to have all the different licenses in the kernel source, that's
> > crazy and not needed at all.
> >
> > I've told the SPDX people this in the past, and they keep promising that
> > they will do the comment work, but it's been months and I have yet to
> > see a single patch...
> 
> But shouldn't we at least write somewhere
> that it has connection to spdx.org where you can find out that licenses.

Why?  Are these licenses so unknown that no one knows what they are?
And, as part of the kernel-as-a-whole-work, they all resolve to GPLv2
anyway, and we have that license in the source tree, so nothing else
should be needed.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
