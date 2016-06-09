From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/3] documentation: Add secure monitor binding
 documentation
Date: Thu, 9 Jun 2016 13:42:03 +0200
Message-ID: <20160609114203.GA4671@mephisto>
References: <1464520323-19531-1-git-send-email-carlo@caione.org>
 <1464520323-19531-3-git-send-email-carlo@caione.org>
 <20160602171422.GA17166@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160602171422.GA17166@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/06/16 12:14, Rob Herring wrote:
> On Sun, May 29, 2016 at 01:12:02PM +0200, Carlo Caione wrote:

[...]
> > +Example of the node using the secure monitor:
> > +
> > +	#include <dt-bindings/firmware/meson-sm.h>
> > +
> > +	...
> > +
> > +	efuse: efuse {
> > +		compatible = "amlogic,meson-gxbb-efuse";
> > +		secure-monitor = <&sm>;
> 
> Why do you need this? Given there can only be one node, just use 
> of_find_compatible_node();

of_find_compatible_node() in the driver works fine if we have only one
possible compatible property for the secure-monitor node. In this case
we have a different compatible property for each SoC (GXBB in this case)
so I think having the phandle in the DT is still the best thing to do.

Any thought on this Rob?

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
