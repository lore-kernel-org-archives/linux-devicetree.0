Return-Path: <devicetree-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:57517 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750991Ab3HLTI5 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 12 Aug 2013 15:08:57 -0400
Date: Mon, 12 Aug 2013 14:11:59 -0500
From: Darren Etheridge <detheridge@ti.com>
Subject: Re: [RFC 0/1] Adding DT support to video/da8xx-fb.c
Message-ID: <20130812191159.GA7339@ti.com>
References: <1375992936-16755-1-git-send-email-detheridge@ti.com>
 <52052D10.7060803@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <52052D10.7060803@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: devicetree@vger.kernel.org, plagnioj@jcrosoft.com, linux-fbdev@vger.kernel.org, afzal@ti.com
List-ID: <devicetree@vger.kernel.org>

Tomi Valkeinen <tomi.valkeinen@ti.com> wrote on Fri [2013-Aug-09 20:55:28 +0300]:
> Hi,
> 
> On 08/08/13 23:15, Darren Etheridge wrote:
> > This is part of a larger series of patches to upgrade the da8xx-fb.c driver
> > to support the Texas Instruments AM335x device.  As part of this upgrade
> > we also want to add devicetree support for both the original da8xx and the
> > am335x.  Tomi Valkeinen has reviewed the fbdev changes but he suggested
> > that it was prudent to extract the dt pieces and run it through the
> > devicetree mailing list for review.
> > 
> > Thanks,
> > Darren
> > 
> > Darren Etheridge (1):
> >   video: da8xx-fb: adding dt support
> > 
> >  .../devicetree/bindings/video/fb-da8xx.txt         |   37 +++++++++++
> >  drivers/video/da8xx-fb.c                           |   67 +++++++++++++++++++-
> >  2 files changed, 101 insertions(+), 3 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/video/fb-da8xx.txt
> 
> I just realized something. We have both drm and fb drivers for the LCDC
> IP. The hardware is the same, thus, there should only be one set of DT
> bindings, used by both drivers.
> 
> I don't know why this didn't occur to me earlier, as it's the same
> situation with OMAP DSS.
> 
OK that makes sense.  So in this case what I need to do is change the
.compatible to match the gpu/drm/driver/tilcdc driver which has the
existing binding so it would become ti,am33xx-tilcdc instead of
ti,am3352-lcdc.  This fbdev driver also supports da8xx class devices
so I would just rename this second .compatible to be ti,da8xx-tilcdc
to be consistent with the other.  The fbdev driver doesn't support
some of the options that the tilcdc/drm driver supports, but that
shouldn't be a problem for the fbdev driver.

I will also change the name of the documentation file to be
da8xx-fb.txt to match the driver name.

Darren
