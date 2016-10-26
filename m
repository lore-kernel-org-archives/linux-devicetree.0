From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: socfpga: Enable QSPI on the Cyclone5 sockit
Date: Wed, 26 Oct 2016 09:22:36 +0200
Message-ID: <20161026072235.ardwmhqbqgq376vu@pengutronix.de>
References: <1476908324-12313-1-git-send-email-dinguyen@opensource.altera.com>
 <1476908324-12313-3-git-send-email-dinguyen@opensource.altera.com>
 <20161020071913.rlka3or4c7fzjpyv@pengutronix.de>
 <c62baad6-2528-a9df-6b09-3dba66785102@opensource.altera.com>
 <5e0adad1-8ef2-029f-cfcd-4a07c962fda2@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5e0adad1-8ef2-029f-cfcd-4a07c962fda2-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On Tue, Oct 25, 2016 at 10:38:10AM -0500, Graham Moore wrote:
> On 10/20/2016 09:12 AM, Dinh Nguyen wrote:
> > 
> > 
> > On 10/20/2016 02:19 AM, Steffen Trumtrar wrote:
> > 
> > > > +		cdns,tslch-ns = <4>;
> > > > +
> > > > +		partition@qspi-boot {
> > > > +			/* 8MB for raw data. */
> > > > +			label = "Flash 0 Raw Data";
> > > > +			reg = <0x0 0x800000>;
> > > > +		};
> > > > +
> > > > +		partition@qspi-rootfs {
> > > > +			/* 120MB for jffs2 data. */
> > > > +			label = "Flash 0 jffs2 Filesystem";
> > > > +			reg = <0x800000 0x7800000>;
> > > > +		};
> > > > +	};
> > > > +};
> > > > +
> > > 
> > > What is the current preferred way of handling the partitions?
> > > This doesn't fit my Sockit configuration for example. So I would always
> > > have to patch the devicetree.
> > 
> > I'm not 100% sure on this. Graham, do you have any insight?
> > > 
> 
> Well, strictly speaking, these partitions are only for the socdk, the Altera
> dev kit.  Our sample designs and file systems expect this layout.

The thing is, that I don't think these partitions belong in a mainline
dts at all. But I'm not sure what the current policy is.

> 
> Therefore, these partitions are not required for any other dev kits, and can
> probably be left out.
> 
> Or, Steffen, if you have a standard layout you'd like to see, then put that
> in there.
> 

Well in my case, it actually doesn't really matter. All the boards
I use do not have u-boot as bootloader but barebox. And barebox uses
devicetree fixups for adding the partition layout that fits the
particular use case. All other partitions are thrown out.
I don't know if u-boot does something like this.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
