From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 00/11] imx-drm dt bindings
Date: Tue, 11 Mar 2014 22:14:31 +0800
Message-ID: <20140311141429.GC26502@S2101-09.ap.freescale.net>
References: <1394011262-16849-1-git-send-email-p.zabel@pengutronix.de>
 <20140311034607.GA26502@S2101-09.ap.freescale.net>
 <1394538128.3772.15.camel@paszta.hi.pengutronix.de>
 <20140311132727.GB26502@S2101-09.ap.freescale.net>
 <1394544878.4339.7.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394544878.4339.7.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 11, 2014 at 02:34:38PM +0100, Lucas Stach wrote:
> > Sorry, Philipp.  The setup in my report is incorrect.  The correct setup
> > to see this issue consists of:
> > 
> > 1) build a kernel without HDMI support, i.e. !CONFIG_DRM_IMX_HDMI
> > 
> > 2) enable HDMI device in DT, i.e. adding the lines below in board dts.
> > 
> > 	&hdmi {
> > 	       status = "okay";
> > 	};
> > 
> > Sorry for the confusion.
> > 
> This isn't a supported use-case, the componentized device stuff is there
> exactly to ensure that the DRM device is only brought up after all
> active components have an driver attached to them.

Ah, yes.  I was in the impression that LVDS should still work in this
setup, but that was the case before Philipp's series.  In Russell's
original imx-drm setup, LVDS still works even if I enable the HDMI
device in DT, as long as I do not reference it from 'connectors'.

	imx_drm: imx-drm {
		compatible = "fsl,imx-drm";
		crtcs = <&ipu1 0>, <&ipu1 1>;
		connectors = <&ldb>;
	};

Thanks for the clarification.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
