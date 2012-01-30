From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pinmux bindings proposal V2
Date: Mon, 30 Jan 2012 09:49:10 -0800
Message-ID: <20120130174910.GG9339@atomide.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
 <CAPnjgZ3Xhebn1x1A-Vdy78DWbDd=cp0AK6tL-R1SRzS4GdF97g@mail.gmail.com>
 <20120127022111.GK29812@atomide.com>
 <CAPnjgZ2EkvTMsOkWyf4pfwRpvcvYs=WaKy5Gi8fdkAUQmvt=ig@mail.gmail.com>
 <20120130031346.GD10470@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120130031346.GD10470-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "Sascha Hauer (s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org)" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [120129 18:30]:
> On Fri, Jan 27, 2012 at 07:43:36AM -0800, Simon Glass wrote:
> ...
> > The cost of the pmx@dta node is about 12 bytes for the header (it
> > depends on the length of the name), and each of the properties above
> > is 16 bytes. So in total this node is 76 bytes. If we have 250 pins
> > being muxed as Tegra3 then this is about 20KB (including a bit of
> > slack for longer names). My point about being able to 'optimise out'
> > some of these remains, though, but probably not for the kernel.
> > 
> > Stephen's 'mux' property uses 12 bytes plus 8 bytes per pin/group (I
> > am removing the prefixes):
> > 
> >                        mux =
> >                                <PG_DTA   MUX_SDIO1>
> >                                <PG_DTD   MUX_SDIO1>;
> > 
> > so 28 bytes. What I proposed would use (12 + 2 * 16) per pin/group, or
> > 44 bytes (60% bigger):
> > 
> It's not only about size but also run-time tree travelling efficiency.
> Your proposal requires every single pin show as a node in device tree.
> Looking at these for_each_node_by_*() APIs in include/linux/of.h, you
> might agree we should avoid bloating device tree with so many nodes.

And that's why I'm suggesting two bindings: A minimal pinctrl-static
binding and more verbose pinctrl-dynamic binding.

AFAIK the number of pinctrl-dynamic bindings needed are just a fraction
of the pinctrl-static bindings. So the extra parsing needed for a few
pinctrl-dynamic bindings should not matter.

Sure it would be nice to have it all in a single binding, but these
bindings have conflicting requirements. So it may not be possible to
do it in a single binding in an efficient way.

Regards,

Tony
