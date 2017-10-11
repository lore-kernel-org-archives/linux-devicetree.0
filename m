From: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] v4l: cadence: Add Cadence MIPI-CSI2 TX driver
Date: Wed, 11 Oct 2017 08:36:39 -0500
Message-ID: <20171011133639.GC25400@ti.com>
References: <20170922114703.30511-1-maxime.ripard@free-electrons.com>
 <20170922114703.30511-3-maxime.ripard@free-electrons.com>
 <20170929182125.GB3163@ti.com>
 <20171011115544.w7eswyhke6dskgbb@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171011115544.w7eswyhke6dskgbb@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, nm-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote on Wed [2017-Oct-11 13:55:44 +0200]:
> Hi Benoit,
> 
> On Fri, Sep 29, 2017 at 06:21:25PM +0000, Benoit Parrot wrote:
> > > +struct csi2tx_priv {
> > > +	struct device			*dev;
> > > +	atomic_t			count;
> > > +
> > > +	void __iomem			*base;
> > > +
> > > +	struct clk			*esc_clk;
> > > +	struct clk			*p_clk;
> > > +	struct clk			*pixel_clk[CSI2TX_STREAMS_MAX];
> > > +
> > > +	struct v4l2_subdev		subdev;
> > > +	struct media_pad		pads[CSI2TX_PAD_MAX];
> > > +	struct v4l2_mbus_framefmt	pad_fmts[CSI2TX_PAD_MAX];
> > > +
> > > +	bool				has_internal_dphy;
> > 
> > I assume dphy support is for a subsequent revision?
> 
> Yes, the situation is similar to the CSI2-RX driver.
> 
> > > +		/*
> > > +		 * We use the stream ID there, but it's wrong.
> > > +		 *
> > > +		 * A stream could very well send a data type that is
> > > +		 * not equal to its stream ID. We need to find a
> > > +		 * proper way to address it.
> > > +		 */
> > 
> > I don't quite get the above comment, from the code below it looks like
> > you are using the current fmt as a source to provide the correct DT.
> > Am I missing soemthing?
> 
> Yes, so far the datatype is inferred from the format set. Is there
> anything wrong with that?

No, nothing wrong with that behavior it just doesn't not match the comment
above, where it is says that the DT is set to the stream ID...

Regards,
Benoit

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
