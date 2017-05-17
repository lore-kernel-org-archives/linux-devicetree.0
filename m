From: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Subject: Re: [PATCH 0/4] Support for Synopsys DW CSI-2 Host
Date: Wed, 17 May 2017 08:47:53 -0300
Message-ID: <20170517084753.6092e7e7@vento.lan>
References: <cover.1488885081.git.roliveir@synopsys.com>
        <20170516214817.GP3227@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170516214817.GP3227-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>M
List-Id: devicetree@vger.kernel.org

Em Wed, 17 May 2017 00:48:17 +0300
Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org> escreveu:

> Hi Ramiro,
> 
> On Tue, Mar 07, 2017 at 02:37:47PM +0000, Ramiro Oliveira wrote:
> > This patchset adds support for the DW CSI-2 Host and also for a video
> > device associated with it. 
> > 
> > The first 2 patches are only for the DW CSI-2 Host and the last 2 are for
> > the video device.
> > 
> > Although this patchset is named as v1 there were already two patchsets
> > previous to this one, but with a different name: "Add support for the DW
> > IP Prototyping Kits for MIPI CSI-2 Host".  
> 
> Could you briefly describe the hardware and which IP blocks you have there?
> Three devices to capture images from CSI-2 bus seems a lot.

Just a quick notice here... calling the driver as "dwc" sounds confusing,
we have already a "dwc2" and a "dwc3" driver (and an OOT "otg-dwc" driver
at RPi tree).

Ok, those are USB drivers, but, as we had some patches for it (or due
to it) at linux-media, I would prefer if you could use some other name
here, to avoid confusion :-)

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
