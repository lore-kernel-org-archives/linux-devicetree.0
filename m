From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] drm/bridge: Add ti-tfp410 DVI transmitter driver
Date: Mon, 21 Nov 2016 08:55:37 -0600
Message-ID: <20161121145537.ijtuq2xd7jt2z636@rob-hp-laptop>
References: <cover.1479388871.git.jsarha@ti.com>
 <6eaa1b5d467cd354f7d5dc5ff8da1b9bf732ff11.1479388871.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6eaa1b5d467cd354f7d5dc5ff8da1b9bf732ff11.1479388871.git.jsarha-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 17, 2016 at 03:28:47PM +0200, Jyri Sarha wrote:
> Add very basic ti-ftp410 DVI transmitter driver. The only feature
> separating this from a completely dummy bridge is the EDID read
> support trough DDC I2C. Even that functionality should be in a
> separate generic connector driver. However, because of missing DRM
> infrastructure support the connector is implemented within the bridge
> driver. Some tfp410 HW specific features may be added later if needed,
> because there is a set of registers behind i2c if it is connected.
> 
> This implementation is tested against my new tilcdc bridge support
> and it works with BeagleBone DVI-D Cape Rev A3. A DT binding document
> is also added.
> 
> Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
> ---
>  .../bindings/display/bridge/ti,tfp410.txt          |  40 +++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/gpu/drm/bridge/Kconfig                     |   7 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/ti-tfp410.c                 | 287 +++++++++++++++++++++
>  4 files changed, 335 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
>  create mode 100644 drivers/gpu/drm/bridge/ti-tfp410.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
