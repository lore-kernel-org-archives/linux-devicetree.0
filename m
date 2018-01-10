From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon
 drivers
Date: Wed, 10 Jan 2018 21:27:40 +0100
Message-ID: <20180110202740.GA27703@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180110101755.GA5822@kroah.com>
 <006c4a95-9299-bd17-6dec-52578e8461ae@linux.intel.com>
 <20180110191703.GA20248@kroah.com>
 <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8997e43c-683e-418d-4e2b-1fe3fefe254e-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jae Hyun Yoo <jae.hyun.yoo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jae Hyun Yoo <jae.hyun.yoo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 10, 2018 at 11:30:05AM -0800, Jae Hyun Yoo wrote:
> On 1/10/2018 11:17 AM, Greg KH wrote:
> > On Wed, Jan 10, 2018 at 11:14:34AM -0800, Jae Hyun Yoo wrote:
> > > On 1/10/2018 2:17 AM, Greg KH wrote:
> > > > On Tue, Jan 09, 2018 at 02:31:20PM -0800, Jae Hyun Yoo wrote:
> > > > > From: Jae Hyun Yoo <jae.hyun.yoo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > > > > 
> > > > > Hello,
> > > > > 
> > > > > This patch set provides support for PECI of AST2400/2500 which can give us PECI
> > > > > functionalities such as temperature monitoring, platform manageability,
> > > > > processor diagnostics and failure analysis. Also provides generic peci.h and
> > > > > peci_ioctl.h headers to provide compatibility to peci drivers that can be
> > > > > implemented later e.g. Nuvoton's BMC SoC family.
> > > > 
> > > > What is the "dev-4.10" in the subject for?  4.10 is really old and
> > > > obsolete :(
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > > 
> > > 
> > > I made this patch set on top of the v4.10 which OpenBmc project is currently
> > > using. I'll rebase this patch set onto the current kernel.org mainline.
> > 
> > What is "OpenBmc", and why are they using an obsolete and insecure
> > kernel for their project?  That seems like a very foolish thing to do...
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> OpenBmc is an open source project to create a highly extensible framework
> for BMC (Board Management Controller) software for data-center computer
> systems:
> https://github.com/openbmc
> 
> Its current mainline is v4.10 but it is being kept upgrading so it will be
> upgraded to the latest stable or long-term version soon.

Why hasn't it been updated in the year since 4.10 was released?  That's
a _very_ long time to be running on a totally insecure kernel, and no
new development should ever be done on old kernels, that's even crazier
(as we can't go back in time and accept patches for new features to old
releases...)

It sounds like the openbmc project needs to learn how to manage their
kernels a whole lot better, who do I need to go poke about this?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
