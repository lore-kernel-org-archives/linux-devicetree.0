From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 1/2] drm: bridge: sil902x
Date: Thu, 7 Jan 2016 10:35:34 +0100
Message-ID: <20160107103534.56844a20@bbrezillon>
References: <1452079551-30914-1-git-send-email-boris.brezillon@free-electrons.com>
	<1452083126-18211-1-git-send-email-boris.brezillon@free-electrons.com>
	<568DFAD7.6030003@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <568DFAD7.6030003@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Clark <robdclark@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Archit,

On Thu, 7 Jan 2016 11:12:47 +0530
Archit Taneja <architt@codeaurora.org> wrote:

> 
> 
> On 01/06/2016 05:55 PM, Boris Brezillon wrote:
> > Add basic support for the sil902x RGB -> HDMI bridge.
> > This driver does not support audio output yet.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> > Hello,
> >
> > This patch is only adding basic support for the sil9022 chip.
> > As stated in the commit log, there's no audio support, but the
> > driver also hardcodes a lot of things (like the RGB input format to
> > use).
> > There are two reasons for this:
> > 1/ the DRM framework does not allow for advanced link description
> >     between an encoder and a bridge (that's for the RGB format
> >     limitation). Any idea how this should be described?
> 
> The adv7511 driver uses a DT param "input_colorspace" to chose between
> RGB or YUV. I don't think DT is the best idea, but I don't know of a
> better way either.

Yes, maybe not the best place, but I must admit that's a convenient way
to set the link format.

> 
> The connector's display_info.color_formats field gives us some info
> about the color formats supported by the monitor, but I guess that
> isn't sufficient data to know what format the encoder is pushing out.

I created the ->bus_formats field in drm_display_info exactly for this
purpose (it's used to detect the appropriate output format when
connecting panels), but as you said, this is only describing the link
between the connector and the display, not the link between the encoder
and the bridge.
I'm currently abusing this field (setting bus_formats to RGB888 in the
sii902x driver), but that would be better to have this description at
the encoder/bridge level.

> 
> We get around this problem in case the case of DSI encoders by using
> the mipi_dsi_device api, where a DSI based bridge or panel can pass
> color format/lane info to the DSI host (i.e, encoder) by using
> mipi_dsi_attach().

Yep, that's also an approach I considered a while ago: creating a DPI
bus layer (not sure DPI is the correct name here), and implementing a
DPI driver in atmel_hlcdc drivers and using DPI APIs on the slave side
(panels and bridges/encoders). But I never had any feedback.

> 
> 
> >
> > 2/ I don't have the datasheet of this HDMI encoder, and all logic
> >     has been extracted from those two drivers [1][2], which means
> >     I may miss some important things in my encoder setup.
> >
> > Another thing I find weird in the drm_bridge interface is the fact
> > that we have a ->attach() method, but no ->detach(), which can be
> > a problem if we allow drm bridges and KMS drivers to be compiled as
> > modules. Any reason for that?
> 
> I guess the drm_bridge_add/remove ops make can ensure that the bridge
> driver itself can be compiled as a module. However, you're right that
> we would need a bridge detach op that the kms driver should call
> before it is removed (to unregister the connector we created).
> 
> Someone would still need to make sure about the order in which the
> modules are removed. If the bridge driver is removed first, then
> it would really mess up the kms driver using the bridge.

Yes, the remove order is another problem we have to deal with

> 
> 
> Would the kms driver using this chip really have an encoder?

No, I have to create an encoder of type NONE to make everybody happy
(we need an encoder + a connector to attach to a panel), but as I
understand, when the KMS device outputs the pixel stream in raw RGB it's
not considered as an encoder (which IMO is not such a good idea,
because I have no way to represent my raw RGB connector :-/).

> Since the chip takes in RGB input, I'm assuming that the encoder in
> the kms driver would more or less be nop funcs, giving their way to
> bridge ops.

Exactly, that's a nop unless you have a panel connected to it. In the
case it calls the drm_panel_xxx() functions.

> 
> In such cases, I think the bridge still doesn't fit in so well. The
> best fit here is how the current tda998x driver is modeled. It adds
> itself as a component that creates both an encoder and connector,
> which the kms driver can use directly. This approach, of course,
> prevents us using tda998x in kms drivers that don't accept any
> encoders that it didn't create itself.

Actually that's what I did first [1], but I asked for some advice to
other DRM developers, and they suggested to expose it as a drm_bridge.

Now, I don't know what's the best option: I heard that some work was
being done to merge the encoder slave and bridge concepts. I just
thought external encoders were falling in that case too.
And BTW, the different between all those components is still obscure to
me.

Thanks for the suggestions.

Best Regards,

Boris

[1]https://github.com/linux4sam/linux-at91/blob/linux-3.18-at91/drivers/gpu/drm/i2c/sil902x.c


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
