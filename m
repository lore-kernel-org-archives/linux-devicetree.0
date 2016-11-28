From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/4] drm/bridge: Add ti-tfp410 DVI transmitter driver
Date: Mon, 28 Nov 2016 08:26:00 -0600
Message-ID: <20161128142600.zy7oerd5benypwi5@rob-hp-laptop>
References: <cover.1479825908.git.jsarha@ti.com>
 <2943f3cb3ea913686bc63e8496df63c82ce0f334.1479825908.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2943f3cb3ea913686bc63e8496df63c82ce0f334.1479825908.git.jsarha-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 22, 2016 at 04:49:52PM +0200, Jyri Sarha wrote:
> Add very basic ti-tfp410 DVI transmitter driver. The only feature
> separating this from a completely dummy bridge is the EDID read
> support trough DDC I2C. Even that functionality should be in a
> separate generic connector driver. However, because of missing DRM
> infrastructure support the connector is implemented within the bridge
> driver. Some tfp410 HW specific features may be added later if needed,
> because there is a set of registers behind i2c if it is connected.
> 
> This implementation is tested against my new tilcdc bridge support
> and it works with BeagleBone DVI-D Cape Rev A3. A DT binding document
> is also updated.
> 
> Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
> ---
>  .../bindings/display/bridge/ti,tfp410.txt          |   9 +-

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/gpu/drm/bridge/Kconfig                     |   7 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/ti-tfp410.c                 | 311 +++++++++++++++++++++
>  4 files changed, 326 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/ti-tfp410.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
