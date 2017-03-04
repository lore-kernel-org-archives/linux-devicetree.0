From: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: display: imx: entry for LAUSCR
Date: Sat, 4 Mar 2017 09:52:35 +0100
Message-ID: <20170304085235.GA25286@botnar.kaiser.cx>
References: <1488193030-13064-1-git-send-email-martin@kaiser.cx>
 <1488193030-13064-2-git-send-email-martin@kaiser.cx>
 <20170302161330.6xguzjv3ttwbv5ek@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170302161330.6xguzjv3ttwbv5ek@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Thus wrote Rob Herring (robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org):

> On Mon, Feb 27, 2017 at 11:56:42AM +0100, Martin Kaiser wrote:

> >  	- fsl,pcr: LCDC PCR value
> > +	A display node may optionally define
> > +	- fsl,lauscr: LCDC AUS Mode Control Register value (only for imx21)

> Looks like we already got one, but generally we don't just put magic 
> register values in the DT. What does this register control?

it contains settings related to AUS mode. This mode sets different
mappings between framebuffer memory and display pixels. It seems that
these mappings were originally defined for displays from AUO.

The only bit from this register that I really need is "AUS mode on/off".
I could put this into the device tree instead of the entire register.

Best regards,
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
