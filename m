From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pinmux bindings proposal V2
Date: Fri, 27 Jan 2012 09:42:32 -0800
Message-ID: <20120127174232.GK13504@atomide.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
 <20120123210052.GS22818@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB81C0D@HQMAIL01.nvidia.com>
 <20120124012038.GT22818@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB81EDB@HQMAIL01.nvidia.com>
 <20120125000407.GU22818@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB82433@HQMAIL01.nvidia.com>
 <20120127020832.GJ29812@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178E123E57@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E123E57-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
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
Cc: "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "Sascha Hauer (s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org)" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> [120127 09:05]:
> Tony Lindgren wrote at Thursday, January 26, 2012 7:09 PM:
> ...
> > I don't think we should try to pass the different possible states from
> > device tree. The pinmux/pinconf driver should know how to deal with that,
> 
> Somehow, the pinctrl driver needs to know how to implement each state. In 
> general, I believe this will be board-specific.
> 
> Do you disagree with this assertion?
> 
> If the data is board-specific, I don't see how it can be represented
> anywhere but the device tree.

Agreed, for board specific things device tree is the place to put it.
 
> > and the driver using the mux should be able to communicate what it wants
> > to the pinmux/pinconf driver. If people really want to be able to pass
> > alternative mux states from device tree, they should be standard bindings
> > for things like active/idle/suspend/off.
> 
> As I've mentioned before, people have asked for driver-specific states to
> handle the case where e.g. drive strength must be adjusted based on clock
> rates of the interface. Again, I believe that's board-specific data since
> the actual values to use may be derived during board calibration, not
> SoC design.
> 
> Do you disagree that this data may be board specific?

Right, but for the dynamic mux cases I've seen the alternative states
are usually specific to the driver using the mux. That's why I'm
suspicious of the board specific custom alternative states :)

Anyways, do you think the pinctrl-static + pinctrl-dynamic binding
I just posted as a reply to Simon's email would work for you?

Regards,

Tony
