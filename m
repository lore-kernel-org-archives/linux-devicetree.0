From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pinmux bindings proposal
Date: Thu, 19 Jan 2012 09:01:01 -0800
Message-ID: <20120119170101.GH22818@atomide.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
 <CAJuYYwSNuMAcjaTNeCq=LmeP8KrvGNjcn1FP6VY0NarEhkY_aA@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1780DAAEB8@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1780DAAEB8-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> [120118 11:21]:
> Thomas Abraham wrote at Wednesday, January 18, 2012 5:16 AM:
> > On 14 January 2012 02:09, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > > I thought a bit more about pinmux DT bindings. I came up with something
> > > that I like well enough, and is pretty similar to the binding that Dong
> > > posted recently. I think it'll work for both Tegra's and IMX's needs.
> > > Please take a look!
> ...
> > The pinmux_get() function checks if there is an active user of the
> > pinmux and declines requests if the pinmux has been taken. With the dt
> > bindings that you have listed, can such a check be still enforced.
> 
> I believe so.
> 
> I see these bindings as simply providing the data to populate the same
> pinmux mapping table that's currently used by the pinctrl subsystem.
> therefore, there are no changes to the operation of the pinctrl subsystem
> (beyond a little extra code to parse the map from DT instead of receiving
> a static table from a board file), and no changes to the way drivers
> use the pinctrl APIs. Hence, all that error-checking will still operate
> as-is.

FYI I have the pinmux maps dynamically created based on the driver pins
requested in .dts file and so far don't see a need for static stables
except to support legacy drivers. I'll update my pinmux-simple.c to
use one phandle per controller instance and post it when I'm back home,
so hopefully next week at some point. Sorry it's been dragging, but it's
been looking "just few more things" to fix for a while now..

Cheers,

Tony
