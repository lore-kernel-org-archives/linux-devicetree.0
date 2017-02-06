From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/5] drm: convert drivers to use of_graph_get_remote_node
Date: Mon, 6 Feb 2017 17:55:33 +0000
Message-ID: <20170206175533.GZ3140@e110455-lin.cambridge.arm.com>
References: <20170204033635.10250-1-robh@kernel.org>
 <20170204033635.10250-4-robh@kernel.org>
 <20170206102933.GV3140@e110455-lin.cambridge.arm.com>
 <20170206170949.tmm4m2lm2rybm5dh@rob-hp-laptop>
 <20170206172306.GY3140@e110455-lin.cambridge.arm.com>
 <20170206173407.GK27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170206173407.GK27312-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>X
List-Id: devicetree@vger.kernel.org

On Mon, Feb 06, 2017 at 05:34:07PM +0000, Russell King - ARM Linux wrote:
> On Mon, Feb 06, 2017 at 05:23:06PM +0000, Liviu Dudau wrote:
> > On Mon, Feb 06, 2017 at 11:09:49AM -0600, Rob Herring wrote:
> > > On Mon, Feb 06, 2017 at 10:29:33AM +0000, Liviu Dudau wrote:
> > > > On Fri, Feb 03, 2017 at 09:36:33PM -0600, Rob Herring wrote:
> > > > > -	/* add the remote encoder port as component */
> > > > > -	port = of_graph_get_remote_port_parent(ep);
> > > > > -	of_node_put(ep);
> > > > > -	if (!port || !of_device_is_available(port)) {
> > > > > -		of_node_put(port);
> > > > > -		return -EAGAIN;
> > > > 
> > > > The HDLCD change looks reasonable except for this -EAGAIN business. I'll have to
> > > > test your changes on my setup to see how this affects having the encoder as a module.
> > > 
> > > What are you expecting to happen with -EAGAIN? This one was a bit of an 
> > > oddball.
> > 
> > When both the HDLCD and the TDA998x drivers are compiled as modules, the
> > order in which they are inserted can be somewhat random (due to testing).
> 
> Not really "due to testing" but if you run a real distro, they tend to
> have a multi-threaded behaviour when loading kernel modules at boot.

Yeah, a lot of times I'm using a toy "distribution" (buildroot) as it boots
faster under ARM models than a "real" (read systemd-based) distro would.

> 
> > It is at that time when you want the probe of HDLCD to be retried on the
> > insmod-ing of the tda998x.ko rather than fail entirely.
> 
> -EAGAIN doesn't get you that, and in any case, solving that problem is
> exactly why the component API exists - so that DRM only comes up once
> all the necessary components are available.
> 
> -EAGAIN also doesn't get you that from inside a probe function - such
> an error will be reported in the kernel log, and no further action
> will be taken (the device driver probe will be failed, and not
> automatically retried.

I stand corrected on the behaviour of the driver then. That was the original
intent, to generate a re-probe of the driver.

> 
> The only case that we automatically retry is if a driver returns
> -EPROBE_DEFER.  Everything else causes a probe failure.

OK, I will fix the driver if Rob's patch still requires it.

Best regards,
Liviu

> 
> -- 
> RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
> according to speedtest.net.

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
