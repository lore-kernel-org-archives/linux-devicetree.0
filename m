From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 00/11] imx-drm dt bindings
Date: Tue, 11 Mar 2014 11:46:11 +0800
Message-ID: <20140311034607.GA26502@S2101-09.ap.freescale.net>
References: <1394011262-16849-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394011262-16849-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 05, 2014 at 10:20:51AM +0100, Philipp Zabel wrote:
> Hi,
> 
> this latest version of the imx-drm DT binding patches applies
> on top of staging-next and also depends on the OF graph binding
> patchset that moves the v4l2_of helpers to drivers/of.
> Currently, the two patchsets are also available at:
>     git://git.pengutronix.de/git/pza/linux.git topic/of-graph
>     git://git.pengutronix.de/git/pza/linux.git topic/imx-drm-dt

Hi Philipp,

I just came across a couple problems when testing the series on
my imx6dl-sabresd board in dual display case - HDMI + LVDS.  I tested it
using Russell's branch below, which I believe has all the pieces put
together.

  git://ftp.arm.linux.org.uk/~rmk/linux-arm.git imx-drm-staging

- When I enable HDMI and LVDS support in both kernel build and device
  tree, HDMI seems working fine but LVDS color is corrupted quite badly.

- When I enable HDMI and LVDS support in kernel build but only LVDS in
  device tree (keep HDMI disabled in device tree by not changing
  'status' of HDMI node to 'okay'), LVDS does not even work.  In this
  case, it seems that the binding of display-subsystem does not succeed.

Please confirm if they are real problems or I'm missing something here.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
