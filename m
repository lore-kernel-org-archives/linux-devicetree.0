From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dt: bindings: vendor-prefix: Add 3 accelerometer
 vendor prefixes
Date: Tue, 4 Oct 2016 08:44:01 -0500
Message-ID: <20161004134401.GA12103@rob-hp-laptop>
References: <20161002155135.23298-1-hdegoede@redhat.com>
 <20161002155135.23298-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161002155135.23298-2-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 02, 2016 at 05:51:35PM +0200, Hans de Goede wrote:
> Recently the kernel has gotten support in the iio subsystem for a number
> of new accelerometers from Domintech, mCube, Memsic and MiraMEMS.
> 
> This commit adds the vendor prefixes already used for these vendors
> in Documentation/devicetree/bindings/i2c/trivial-devices.txt to
> vendor-prefixes.txt.
> 
> Domintech's full company name was taken from copyright headers for
> their drivers from: https://github.com/domintech/
> 
> The other full company names were taken from the company's websites:
> http://www.mcubemems.com/
> http://www.memsic.com/
> http://www.miramems.com/en/
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 4 ++++
>  1 file changed, 4 insertions(+)

I've applied this one to avoid any conflicts with sorting 
vendor-prefixes.txt. I fixed up the sorting of mcube.

Patch 1 conflicts with Jonathan's tree, so I'll let him take it.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
