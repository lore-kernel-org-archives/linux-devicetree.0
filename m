From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 2/4] media: platform: dwc: Support for DW CSI-2 Host
Date: Wed, 17 May 2017 11:25:50 +0300
Message-ID: <20170517082550.GS3227@valkosipuli.retiisi.org.uk>
References: <cover.1488885081.git.roliveir@synopsys.com>
 <6a45f8d24993bc6ab02f8bd76ef1db421ab32d9c.1488885081.git.roliveir@synopsys.com>
 <24d1c826-8c02-d625-efb7-705d3ad9ce3d@xs4all.nl>
 <49e4c275-c660-60fd-cb32-e09a5add91a5@synopsys.com>
 <16996e20-b636-800b-0edc-fa9cca7b4481@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <16996e20-b636-800b-0edc-fa9cca7b4481-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Kieran Bingham <kieran+renesas-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi Hans,

On Wed, May 17, 2017 at 09:00:59AM +0200, Hans Verkuil wrote:
> Hi Sakari,
> 
> Can you comment on this? You are much more a CSI sensor expert than I am.

Sure. Thanks for the ping.

> 
> On 16/05/17 20:18, Ramiro Oliveira wrote:
> > Hi Hans,
> > 
> > Thank you very much for your feedback.
> > 
> > On 5/8/2017 11:38 AM, Hans Verkuil wrote:
> >> Hi Ramiro,
> >>
> >> My sincere apologies for the long delay in reviewing this. The good news is that
> >> I should have more time for reviews going forward, so I hope I'll be a lot quicker
> >> in the future.
> >>
> >> On 03/07/2017 03:37 PM, Ramiro Oliveira wrote:
> 
> <snip>
> 
> >>> +		if (mf->width == bt->width && mf->height == bt->width) {
> >>
> >> This is way too generic. There are many preset timings that have the same
> >> width and height but different blanking periods.
> >>
> >> I am really not sure how this is supposed to work. If you want to support
> >> HDMI here, then I would expect to see support for the s_dv_timings op and friends
> >> in this driver. And I don't see support for that in the host driver either.
> >>
> >> Is this a generic csi driver, or specific for hdmi? Or supposed to handle both?
> > 
> > This is a generic CSI driver.
> > 
> >>
> >> Can you give some background and clarification of this?
> > 
> > This piece of code might seem strange but I'm just using it fill our controller
> > timing configuration.
> > 
> > I don't have any specific requirements, but they should match, more or less, the
> > sensor configurations, so I decided to re-use the HDMI blanking values, since,
> > usually, they match with the sensor configurations
> > 
> > So, my intention is to check if there is any HDMI preset that matches the
> > required width and height, and then use the blanking values to configure our
> > controller. I know this might not be very common, and I'm open to use different
> > approaches, but from my perspective it seems to work fine.

What kind of timing information do you need to configure the receiver?

If you pick a random HDMI configuration it can't be expected to match an
unrelated configuration of a sensor. Generally CSI-2 bus frequency, number
of lanes and horizontal and vertical blanking are enough to calculate what
the hardware needs regarding timing. The received image size is necessary
for other purposes.

Do you see that you'd need something else in addition to that?

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
