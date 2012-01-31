From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Pinmux bindings proposal V2
Date: Tue, 31 Jan 2012 09:07:11 +0800
Message-ID: <20120131010708.GA24681@S2101-09.ap.freescale.net>
References: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
 <20120123210052.GS22818@atomide.com>
 <20120126093610.GD2287@S2101-09.ap.freescale.net>
 <20120126175122.GX22818@atomide.com>
 <20120127071944.GC32740@S2101-09.ap.freescale.net>
 <20120127171653.GI13504@atomide.com>
 <20120130021041.GB10470@S2101-09.ap.freescale.net>
 <20120130174323.GF9339@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120130174323.GF9339-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "Sascha Hauer (s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org)" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2012 at 09:43:23AM -0800, Tony Lindgren wrote:
> * Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [120129 17:27]:
> > On Fri, Jan 27, 2012 at 09:16:53AM -0800, Tony Lindgren wrote:
> > ...
> > > I guess the analog we should follow here is clk_get and clk_set_rate,
> > > except we would have pinconf_set_state with predefined states.
> > > 
> > It seems working for cases that we only change pinconf but never pinmux
> > for different configuration states.  But how would that work for cases
> > that require mux change for different configuration states?
> 
> I don't see why we should not allow changing the mux state with pinconf
> too, after all it's the mux/pin that's locked, not the functionality of
> the pin.
> 
My point is I do not see how we can use the current pinmux APIs design
to change mux in the way how clk_get and clk_set_rate work.  Or you
have a pinmux APIs reconstruction on your mind?

Regards,
Shawn

> An example of this would be remuxing a shared UART line between rx and
> tx. Those kind of cases could be defined as PMX_DIRECTION_INPUT and
> PMX_DIRECTION_OUTPUT so driver could call Linux generic functions for
> those if implemented.
> 
