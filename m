From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Thu, 01 Dec 2016 13:44:31 +0200
Message-ID: <3596263.47eZbXLy2S@avalon>
References: <cover.1480414715.git.moinejf@free.fr> <5021537.YAZCMeDTSh@avalon> <20161201123009.d2b4d9d389070200c54138ee@free.fr>
Reply-To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDKM3GOS4YHBBD42QDBAKGQE5LDHTFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161201123009.d2b4d9d389070200c54138ee-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 01 Dec 2016 12:30:09 Jean-Francois Moine wrote:
> On Thu, 01 Dec 2016 12:41:20 +0200 Laurent Pinchart wrote:
> >>> If a DVI connector instead of a HDMI connector is soldered, how
> >>> should such a device tree be written?
> >> 
> >> Use a dvi-connector instead :)
> > 
> > The HDMI encoder DT node doesn't (and certainly shouldn't) report what
> > type of connector is mounted on the board. Having a connector node in DT
> > makes the connector type available to the system, allowing the DRM driver
> > to expose the right connector type to userspace (it would be confusing
> > for the user to report DRM_MODE_CONNECTOR_HDMIA for a DVI connector).
> 
> The connector type, HDMI or DVI, is known by the EDID.
> The user is not interested by the software indication of the connector
> type: (s)he knows it because (s)he connected him/herself the display
> device.

That's not correct. The connector type reported by DRM to userspace can be 
used as a hint to information the user about connectors. Displaying a "Please 
connect a monitor to the HDMI connector" is confusing when the system has a 
DVI connector.

> And the DRM driver does not do anything from the knowledge of the
> connector type in the DT. Only the EDID may tell if the display device
> may do audio streaming (direct HDMI with audio capability) or not
> (direct HDMI without audio, HDMI to DVI cable, DVI physical connector).

-- 
Regards,

Laurent Pinchart
