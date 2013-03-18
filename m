From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 0/6] support other fsl SoCs with usbmisc + small
 fixes
Date: Mon, 18 Mar 2013 14:30:00 +0100
Message-ID: <20130318133000.GA16342@pengutronix.de>
References: <1354033021-10585-1-git-send-email-m.grzeschik@pengutronix.de>
 <20121128025217.GC18593@nchen-desktop>
 <87ip6mor1e.fsf@ashishki-desk.ger.corp.intel.com>
 <20130307225403.GI29785@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130307225403.GI29785-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 07, 2013 at 11:54:03PM +0100, Michael Grzeschik wrote:
> Hey Alex,
> 
> On Thu, Jan 24, 2013 at 11:42:53AM +0200, Alexander Shishkin wrote:
> > Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
> > 
> > > On Tue, Nov 27, 2012 at 05:16:55PM +0100, Michael Grzeschik wrote:
> > >> Nearly every SoC from Freescale has this non-core usb registers. This series
> > >> adds support for more users of this driver.
> > >> 
> > >> This series is based on Peter Chen's work. Its needed to merge his master branch
> > >> before applying this series:
> > >> 
> > >> https://github.com/hzpeterchen/linux-usb.git
> > >
> > > I have tested it at i.mx6q sabrelite board, it works good.
> > >
> > > I have pushed your commit to my git, please cc me
> > > your coming chipidea patches, thanks.
> > >
> > > Alex, please add:
> > >
> > > Reviewed-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > Tested-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > 
> > Looks good, queueing this one for submission.
> 
> Now that you have your git-tree [1], could you queue that for
> submission?
> 
> [1] git://github.com/virtuoso/linux-ci.git ci-for-greg

Ping!

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
