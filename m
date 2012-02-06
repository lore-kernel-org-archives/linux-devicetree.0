From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: An extremely simplified pinctrl bindings proposal
Date: Mon, 6 Feb 2012 10:57:11 -0800
Message-ID: <20120206185711.GT1426@atomide.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3160@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3160-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
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
Cc: "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "Sascha Hauer (s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org)" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> [120204 21:01]:
> Sorry, I haven't had a chance to read any of the pincrl emails from
> Friday onwards. However, I thought a bit more about this, and decided
> to propose someting much simpler:
> 
> Thoughts:
> 
> * Defining all the pins, groups, functions, ... takes a lot of space,
>   whether it's in static data in pinctrl drivers or in the device tree.
>   The lists must also be stored in RAM at runtime.
> 
> * It's been very difficult to come up with a generic description of all
>   pin controller's capabilities. This is true even irrespective of device
>   tree; think pin config where we've agonized over whether we can create
>   a standardized list of pin config properties, or need to allow each
>   pinctrl driver to define its own set of properties, etc.
> 
> * The only real use of the lists is for debugfs. Drivers shouldn't expect
>   to directly request specific pinctrl settings, since that would encode
>   knowledge of an individual SoC's pin controller. This should be
>   abstracted from drivers.
> 
> * The data in debugfs could easily be replaced by a raw register dump
>   coupled with a SoC-specific script to print out what each register
>   means.

My conclusions are pretty much the same: The data is only needed in
the driver for debugging. And the register names and values are best
translated into readable format using debugfs and userspace tools.

I pretty much did this with the pinctrl-simple.c I posted few days
ago, except no userspace debugging support yet in pinctrl framework
naturally.

This all seems to fit into the current pinctrl framework OK.

I think we just need to make string names optional data, and
structure things in debugfs to just display register physical
addresses rather than string names for userspace tools.

FYI, I'm currently working around the names by using the hex
register physical address as the pin name.

Also, the alternative pin modes bindings still needs to be
discussed, so maybe we all can talk about that at Linaro Connect
on Tuesday at some point.

Regards,

Tony
