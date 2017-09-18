From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: iio: adc: mcp320x: Update for
 mcp3550/1/3
Date: Mon, 18 Sep 2017 15:27:05 -0500
Message-ID: <20170918202705.xunpkrn7wllvzbp3@rob-hp-laptop>
References: <cover.1504807204.git.lukas@wunner.de>
 <f5899af5ef548c618ac14950301f6bc8eff6e9ba.1504807204.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f5899af5ef548c618ac14950301f6bc8eff6e9ba.1504807204.git.lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Oskar Andero <oskar.andero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrea Galbusera <gizero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Manfred Schlaegl <manfred.schlaegl-RbZlAiThDcE@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Soeren Andersen <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 09, 2017 at 08:32:41PM +0200, Lukas Wunner wrote:
> All chips supported by this driver clock data out on the falling edge
> and latch data in on the rising edge, hence SPI mode (0,0) or (1,1)
> must be used.
> 
> Furthermore, none of the chips has an internal reference voltage
> regulator, so an external supply is always required and needs to be
> specified in the device tree lest the IIO "scale" in sysfs cannot be
> calculated.
> 
> Document these requirements in the device tree binding, add compatible
> strings for the newly supported mcp3550/1/3 and explain that SPI mode
> (0,0) should be preferred for these chips.
> 
> Cc: Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>
> Signed-off-by: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
> ---
> Changes since v1:
> - Move support for continuous conversion mode to separate patch
>   which is marked informational / not for merging. (Rob, Jonathan)
> 
>  Documentation/devicetree/bindings/iio/adc/mcp320x.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
