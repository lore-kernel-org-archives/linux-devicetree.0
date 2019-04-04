From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] drm/panel: Rocktech jh057n00900: Add terminating
 newlines to logging
Date: Thu, 04 Apr 2019 11:55:17 -0700
Message-ID: <ab5f36952d2125f5ed9706aa58b64ab10fecf531.camel@perches.com>
References: <cover.1554114302.git.agx@sigxcpu.org>
         <20190403161735.GN5238@ulmo>
         <1ed5eb3af4df6b2dd1544c7b696e034ed5c94f06.camel@perches.com>
         <20190404105359.GA8255@bogon.m.sigxcpu.org>
         <da6f2344396555034cf2476c8338b0ce1c56e0a7.camel@perches.com>
         <20190404170040.GA23897@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404170040.GA23897@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.ke
List-Id: devicetree@vger.kernel.org

On Thu, 2019-04-04 at 19:00 +0200, Sam Ravnborg wrote:
> Hi Joe.
> 
> On Thu, Apr 04, 2019 at 08:06:09AM -0700, Joe Perches wrote:
> > These were missing '\n' terminations, add them.
> > 
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> >  drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> > index 158a6d548068..d88ea8da2ec2 100644
> > --- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> > +++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> > @@ -123,7 +123,7 @@ static int jh057n_init_sequence(struct jh057n *ctx)
> >  
> >  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> >  	if (ret < 0) {
> > -		DRM_DEV_ERROR(dev, "Failed to exit sleep mode");
> > +		DRM_DEV_ERROR(dev, "Failed to exit sleep mode\n");
> 
> I was under the impression that newlines was optional these days.
> Should we always use them with logging?

Yes.

The general problem is KERN_CONT/pr_cont uses where interleaving
is still possible from multiple threads.

> I did not find any obvious clues in linux/printk.h

I'll see about adding something one day to the Documentation.
Likely in coding-style.rst.
