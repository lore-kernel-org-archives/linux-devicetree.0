From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Thu, 4 Jul 2013 10:53:13 +0200
Message-ID: <20130704085313.GY516@pengutronix.de>
References: <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk>
 <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <20130703095248.GG13924@flint.arm.linux.org.uk>
 <20130704083307.GH10414@pengutronix.de>
 <51D53634.5040405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51D53634.5040405-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 04, 2013 at 10:45:40AM +0200, Sebastian Hesselbarth wrote:
> On 07/04/13 10:33, Sascha Hauer wrote:
> >
> >A componentized device never completes and it doesn't have to. A
> >componentized device can start once there is a path from an input
> >(crtc, i2s unit) to an output (connector, speaker).
> >
> >Consider what happens with a supernode approach. Your board provides a
> >devicetree which has a supernode with hdmi and lvds referenced. Now you
> >build a kernel with the hdmi driver disabled. You would still expect the
> >lvds port to be working without having the kernel wait for the supernode
> >being complete.
> >
> >Without supernode you can just start once you have everything between
> >the crtc and lvds nodes. If later a hdmi device joins in then you can
> >either notify the users (provided the DRM/KMS API supports it) or just
> >ignore it until the DRM device gets reopened.
> 
> Sascha,
> 
> that is what it is all about. You assume you a priori know what devices
> will be required for the componentized device to successfully output
> a video stream.
> 
> We have shown setups where you don't know what is required. Cubox
> _needs_ lcd0 and hdmi-transmitter,

Then your Cubox devicetree has a link (that's how they call it in v4l2,
a link doesn't necessarily is a direct connection but can have multiple
devices in it) between lcd0 and hdmi.

>  olpc just needs lcd0 and has built-in hdmi in the SoC (IIRC).

And olpc has a link with lcd0 as the source and the builtin hdmi.


> The driver needs to know what to wait for, and that is given by the DT super-node.

You need a source (described in the devicetree), a sink (also described
in the devicetree) and a link between them, nothing more.

> 
> I consider kernels with missing drivers compared to what is given in
> the DT as broken setup.

What if your devicetree describes components not yet in mainline. Would
you consider mainline kernels broken then?

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
