From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/8] drm: bridge: vga-dac: Add adi,adv7123 compatible string
Date: Fri, 21 Oct 2016 13:22:25 +0300
Message-ID: <295438587.dQSmbaFSXR@avalon>
References: <1476887143-24831-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1476887143-24831-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <2e22947f-1c8c-710a-cb60-bd6b52f219eb@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2e22947f-1c8c-710a-cb60-bd6b52f219eb@codeaurora.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Archit,

On Friday 21 Oct 2016 10:43:34 Archit Taneja wrote:
> On 10/19/2016 07:55 PM, Laurent Pinchart wrote:
> > The ADV7123 is a transparent VGA DAC. Unlike dumb VGA DACs it can be
> > controlled through a power save pin, and requires a power supply.
> > However, on most boards where the device is used neither the power save
> > signal nor the power supply are controllable.
> > 
> > To avoid developing a separate device-specific driver add an
> > "adi,adv7123" compatible entry to the dumb-vga-dac driver. This will
> > allow supporting most ADV7123-based boards easily, while allowing future
> > development of an adv7123 driver when needed without breaking backward
> > compatibility.
> 
> Shouldn't we have a DT binding doc for ADV7123, even if it's sharing
> the dumb vga driver for now?

Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt

> Same query for the Thine LVDS encoder.

Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt

> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  drivers/gpu/drm/bridge/dumb-vga-dac.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > b/drivers/gpu/drm/bridge/dumb-vga-dac.c index afec232185a7..b33e3f829e4f
> > 100644
> > --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > @@ -204,6 +204,7 @@ static int dumb_vga_remove(struct platform_device
> > *pdev)> 
> >  static const struct of_device_id dumb_vga_match[] = {
> >  
> >  	{ .compatible = "dumb-vga-dac" },
> > +	{ .compatible = "adi,adv7123" },
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, dumb_vga_match);

-- 
Regards,

Laurent Pinchart
