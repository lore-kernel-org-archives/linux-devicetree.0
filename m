From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v7 2/2] v4l: cadence: Add Cadence MIPI-CSI2 RX driver
Date: Wed, 14 Feb 2018 17:03:26 +0200
Message-ID: <1952975.8AbmfkeE6m@avalon>
References: <20180208150830.9219-1-maxime.ripard@bootlin.com> <2517178.9jmyBy62ST@avalon> <20180214131933.t75jg5b5cjfuo7r6@flea.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180214131933.t75jg5b5cjfuo7r6-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, nm-l0cyMroinI0@public.gmane.org, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Wednesday, 14 February 2018 15:19:33 EET Maxime Ripard wrote:
> On Thu, Feb 08, 2018 at 08:17:19PM +0200, Laurent Pinchart wrote:
> >> +	/*
> >> +	 * Create a static mapping between the CSI virtual channels
> >> +	 * and the output stream.
> >> +	 *
> >> +	 * This should be enhanced, but v4l2 lacks the support for
> >> +	 * changing that mapping dynamically.
> >> +	 *
> >> +	 * We also cannot enable and disable independant streams here,
> >> +	 * hence the reference counting.
> >> +	 */
> > 
> > If you start all streams in one go, will s_stream(1) be called multiple
> > times ? If not, you could possibly skip the whole reference counting and
> > avoid locking.
> 
> I guess that while we should expect the CSI-2 bus to be always
> enabled, the downstream camera interface could be shutdown
> independently, so I guess s_stream would be called each time one is
> brought up or brought down?

That's the idea. However, we don't have support for multiplexed streams in 
mainline yet, so there's no way it can be implemented today in your driver.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
