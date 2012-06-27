From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH, RFC] displaymodes in devicetree
Date: Wed, 27 Jun 2012 18:22:38 +0200
Message-ID: <20120627162238.GS1623@pengutronix.de>
References: <20120627124313.GI1623@pengutronix.de>
 <4FEB31CC.2060705@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FEB31CC.2060705-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2012 at 06:16:12AM -1000, Mitch Bradley wrote:
> On 6/27/2012 2:43 AM, Sascha Hauer wrote:
> >Hi All,
> >
> >I'd like to have a possibility to describe fixed display modes in the
> >devicetree. This topic has been discussed before here:
> >
> >https://lists.ozlabs.org/pipermail/linuxppc-dev/2010-February/080683.html
> >
> >The result at that time was that EDID data should be considered to use
> >as this is a format that already exists. I want to come back to this
> >topic since:
> >
> >- EDID data is a binary format and as such quite inconvenient to handle.
> >   There exist several tools to parse EDID data, but I'm not aware of any
> >   (open source) tool which can generate EDID data.
> >- EDID blobs are hard to modify and hard to review in patches.
> >- EDID is designed to describe multiple modes, but fixed displays
> >   usually only support a single fixed mode.
> >
> >There are several ways of describing the mode, for this patch I chose to
> >use the format (and naming) used by the Linux Framebuffer Layer as this
> >is the only description which does not allow for inconsistent modes. I
> >added the most common flags like [v|h]sync_active_high. Others can be
> >added, but these flags are pretty much agreed upon and won't be
> >superseeded with other flags. The mode from the devicetree can be
> >converted to the most common modes used in Linux, struct fb_videomode
> >and struct drm_display_mode.
> >
> >Comments welcome
> 
> 
> I like the general approach and the set of names.  The separators
> inside the names should be hyphen (-) not underscore (_), following
> the usual device tree convention.  The rationale for that convention
> is to follow natural-language usage, not the identifier constraints
> of programming languages based on algebraic expressions.

Good to hear that this is the convention for devicetree, I like
hyphens better aswell. Will change.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
