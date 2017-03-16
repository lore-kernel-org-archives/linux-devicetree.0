From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: media / v4l2-mc: wishlist for complex cameras (was Re: [PATCH
 v4 14/36] [media] v4l2-mc: add a function to inherit controls from a
 pipeline)
Date: Thu, 16 Mar 2017 10:26:00 +0100
Message-ID: <1489656360.2303.2.camel@pengutronix.de>
References: <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
         <20170310125342.7f047acf@vento.lan>
         <20170310223714.GI3220@valkosipuli.retiisi.org.uk>
         <20170311082549.576531d0@vento.lan>
         <20170313124621.GA10701@valkosipuli.retiisi.org.uk>
         <20170314004533.3b3cd44b@vento.lan>
         <e0a6c60b-1735-de0b-21f4-d8c3f4b3f10f@xs4all.nl>
         <20170314072143.498cde9b@vento.lan> <20170314223254.GA7141@amd>
         <20170314215420.6fc63c67@vento.lan> <20170315105049.GA12099@frolo.macqel>
         <1489604109.4593.4.camel@ndufresne.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489604109.4593.4.camel-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>
Cc: Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andre
List-Id: devicetree@vger.kernel.org

On Wed, 2017-03-15 at 14:55 -0400, Nicolas Dufresne wrote:
> Le mercredi 15 mars 2017 à 11:50 +0100, Philippe De Muyter a écrit :
> > > I would say: camorama, xawtv3, zbar, google talk, skype. If it runs
> > > with those, it will likely run with any other application.
> > > 
> > 
> > I would like to add the 'v4l2src' plugin of gstreamer, and on the
> > imx6 its
> 
> While it would be nice if somehow you would get v4l2src to work (in
> some legacy/emulation mode through libv4l2),

v4l2src works just fine, provided the pipeline is configured manually in
advance via media-ctl.

>  the longer plan is to
> implement smart bin that handle several v4l2src, that can do the
> required interactions so we can expose similar level of controls as
> found in Android Camera HAL3, and maybe even further assuming userspace
> can change the media tree at run-time. We might be a long way from
> there, specially that some of the features depends on how much the
> hardware can do. Just being able to figure-out how to build the MC tree
> dynamically seems really hard when thinking of generic mechanism. Also,
> Request API will be needed.
> 
> I think for this one, we'll need some userspace driver that enable the
> features (not hide them), and that's what I'd be looking for from
> libv4l2 in this regard.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
