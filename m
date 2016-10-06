From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v5 2/5] drm/bridge: Add RGB to VGA bridge support
Date: Thu, 06 Oct 2016 20:27:39 +0300
Message-ID: <5319260.UeCnJXKVPe@avalon>
References: <20160930143709.1388-1-maxime.ripard@free-electrons.com> <20161006072106.GA4684@lukather> <96cef428-19e5-ff98-1de1-fa31dd8d4142@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <96cef428-19e5-ff98-1de1-fa31dd8d4142-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Thursday 06 Oct 2016 17:09:57 Archit Taneja wrote:
> On 10/06/2016 12:51 PM, Maxime Ripard wrote:
> > On Mon, Oct 03, 2016 at 04:40:57PM +0530, Archit Taneja wrote:
> >> On 09/30/2016 08:07 PM, Maxime Ripard wrote:
> >>> Some boards have an entirely passive RGB to VGA bridge, based on either
> >>> DACs or resistor ladders.
> >>> 
> >>> Those might or might not have an i2c bus routed to the VGA connector in
> >>> order to access the screen EDIDs.
> >>> 
> >>> Add a bridge that doesn't do anything but expose the modes available on
> >>> the screen, either based on the EDIDs if available, or based on the XGA
> >>> standards.
> >>> 
> >>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>> ---
> >>> .../bindings/display/bridge/rgb-to-vga-bridge.txt  |  48 +++++
> >>> drivers/gpu/drm/bridge/Kconfig                     |   7 +
> >>> drivers/gpu/drm/bridge/Makefile                    |   1 +
> >>> drivers/gpu/drm/bridge/rgb-to-vga.c                | 229 +++++++++++++++
> >>> 4 files changed, 285 insertions(+)
> >>> create mode 100644
> >>> Documentation/devicetree/bindings/display/bridge/rgb-to-vga-bridge.txt
> >>> create mode 100644 drivers/gpu/drm/bridge/rgb-to-vga.c
> >>> 
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-bridge.tx
> >>> t
> >>> b/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-bridge.tx
> >>> t new file mode 100644
> >>> index 000000000000..a8375bc1f9cb
> >>> --- /dev/null
> >>> +++
> >>> b/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-bridge.tx
> >>> t @@ -0,0 +1,48 @@
> >>> +Dumb RGB to VGA bridge
> >>> +----------------------
> >>> +
> >>> +This binding is aimed for dumb RGB to VGA bridges that do not require
> >>> +any configuration.
> >>> +
> >>> +Required properties:
> >>> +
> >>> +- compatible: Must be "rgb-to-vga-bridge"
> >> 
> >> I'd talked to Laurent on IRC if he's okay with this. And I guess you to
> >> had discussed it during XDC too. He's suggested that it'd be better to
> >> have the compatible string as "simple-vga-dac".
> > 
> > I just wished this bikeshedding had taken place publicly and be
> > actually part of that discussion, but yeah, ok.
> 
> Sorry about that. I'd pinged him for an Ack, the discussion went
> more than that :)
> 
> >> Some of the reasons behind having this:
> >> 
> >> - We don't need to specify "rgb" in the compatible string since most
> >> simple VGA DACs can only work with an RGB input.
> > 
> > Ok.
> > 
> >> - Also, with "dac" specified in the string, we don't need to
> >> specifically mention "bridge" in the string. Also, bridge is a drm
> >> specific term.
> >> 
> >> - "simple" is considered because it's an unconfigurable bridge, and it
> >> might be misleading for other VGA DACs to not use "vga-dac".
> > 
> > All those "simple" bindings are just the biggest lie we ever
> > told. It's simple when you introduce it, and then grows into something
> > much more complicated than a non-simple implementation.
> 
> "simple" here is supposed to mean that it's an unconfigurable RGB to
> VGA DAC. This isn't supposed to follow the simple-panel model, where
> you add the "simple-panel" string in the compatible node, along with
> you chip specific compatible string.

I agree with Maxime, I don't like the word "simple". My preference would be 
"vga-dac" for a lack of a better qualifier than "simple" to describe the fact 
that the device requires no configuration. My only concern with "vga-dac" is 
that we would restrict usage of that compatible string for a subset of VGA 
DACs, with more complex devices not being compatible with "vga-dac" even 
though they are VGA DACs. That's a problem I can live with though.

> In other words, this driver shouldn't be touched again in the future :)
> If someone wants to write a RGB to VGA driver which is even
> slightly configurable, they'll need to write a new bridge driver.

I'm sure that won't be true. I can certainly foresee the addition of 
regulators support for instance. It's unfortunately never black and white.

> >> What do you think about this? If you think it's good, would it be
> >> possible for you to change this? I guess it's okay for the rest of
> >> the patch to stay the same.
> > 
> > I'll update and respin the serie.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
