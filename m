From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Thu, 4 Jul 2013 11:57:59 +0200
Message-ID: <20130704095759.GK10414@pengutronix.de>
References: <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <20130703095248.GG13924@flint.arm.linux.org.uk>
 <20130704083307.GH10414@pengutronix.de>
 <51D53634.5040405@gmail.com> <20130704085313.GY516@pengutronix.de>
 <51D53C0B.6060106@gmail.com>
 <20130704092305.GI10414@pengutronix.de>
 <51D54301.8080902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51D54301.8080902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Thu, Jul 04, 2013 at 11:40:17AM +0200, Sebastian Hesselbarth wrote:
> On 07/04/13 11:23, Sascha Hauer wrote:
> >
> >With this you can describe the whole graph of devices you have in the
> >devicetree. The examples in this file have a path from a camera sensor
> >via a MIPI converter to a capture interface.
> >
> >The difference to a supernode is that this approach describes the data
> >flow in the devicetree so that we can iterate over it to find links
> >between source and sink rather than relying on a list of subdevices to
> >be completed.
> 
> Agree. But that is not that different from linux,video-external-encoder
> property I made up, except that the name is different.
> 
> And, I still see no way with that source/sink linking _alone_ how to
> tell that either lcd0 and lcd1 act as a _single_ video card or lcd0 and
> lcd1 are used in a _two_ video card setup.
> 
> There is no single device node on Dove that would sufficiently act as
> the top node for a working video card on all boards. And there is no
> framebuffer node to link each of the lcd0/1 nodes to.
> 
> That is what the super-node is for, form a virtual device called
> video card to act as a container for all those SoC devices that are
> not sufficient for a working video setup on their own.
> 
> If lcd0 needs that hdmi-transmitter you link it to the lcd0 node -
> not the super-node. If lcd0 needs some pll clock you link it to the
> lcd0 node - again not the super-node.
> 
> The super-node(s) just connects all SoC devices that shall be part of
> your board-specific video card(s) - for Dove that is any combination of
> lcd0, lcd0, dcon and video memory allocation.

So with the supernode approach you would have one/two supernodes and
with a v4l2 approach you would have either one graph containing lcd0 and
lcd1 or to graphs (without a connection in between).

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
