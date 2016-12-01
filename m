From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Thu, 01 Dec 2016 12:41:20 +0200
Message-ID: <5021537.YAZCMeDTSh@avalon>
References: <cover.1480414715.git.moinejf@free.fr> <1971681480527210@web5g.yandex.ru> <20161201085520.tk2kdi33rn6fyld2@lukather>
Reply-To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDKM3GOS4YHBBQP477AQKGQEBHJHQ4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161201085520.tk2kdi33rn6fyld2@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, "moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 01 Dec 2016 09:55:20 Maxime Ripard wrote:
> On Thu, Dec 01, 2016 at 01:33:30AM +0800, Icenowy Zheng wrote:
> >>>          hdmi-out {
> >>>                  compatible = "hdmi-connector";
> >>>                  type = "a";
> >>>                  /* I2C bus and GPIO references are made up for the
> >>> example */ ddc-i2c-bus = <&i2c4>;
> >>>                  hpd-gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>
> >> 
> >> the "hdmi-connector" is a big piece of software. It must handle a lot
> >> of more and more exotic connectors.
> >> So, I hope that you have written a "simple-hdmi-connector" which does
> >> nothing but setting the connector type.
> >> Where is it?
> > 
> > I suddenly thought about something...
> > 
> > If a DVI connector instead of a HDMI connector is soldered, how
> > should such a device tree be written?
> 
> Use a dvi-connector instead :)

The HDMI encoder DT node doesn't (and certainly shouldn't) report what type of 
connector is mounted on the board. Having a connector node in DT makes the 
connector type available to the system, allowing the DRM driver to expose the 
right connector type to userspace (it would be confusing for the user to 
report DRM_MODE_CONNECTOR_HDMIA for a DVI connector).

> > How about solder a HDMI-to-VGA bridge on the board? (Maybe there
> > should be "dumb-hdmi-dvi-bridge" and "dumb-hdmi-vga-bridge"
> > drivers?)
> 
> It probably wouldn't be dumb, but yeah, it would definitely be a
> bridge instead of the connector.

-- 
Regards,

Laurent Pinchart
