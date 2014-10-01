From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/6] Documentation: DT: Add bindings for Spreadtrum serial
Date: Wed, 1 Oct 2014 12:21:50 +0100
Message-ID: <20141001112149.GA13759@leverpostej>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com>
 <1411992293-7729-2-git-send-email-zhang.lyra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411992293-7729-2-git-send-email-zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "jslaby-AlSwsSmVLrQ@public.gmane.org" <jslaby-AlSwsSmVLrQ@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "m-karicheri2-l0cyMroinI0@public.gmane.org" <m-karicheri2-l0cyMroinI0@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org" <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org" <geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, "zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org" <zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kern>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 29, 2014 at 01:04:48PM +0100, zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: "chunyan.zhang" <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> 
> Adds the device-tree documentation for Spreadtrum's serial.
> 
> Signed-off-by: chunyan.zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
>  .../devicetree/bindings/serial/of-serial.txt       |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/of-serial.txt b/Documentation/devicetree/bindings/serial/of-serial.txt
> index 7705477..a0bb1d1 100644
> --- a/Documentation/devicetree/bindings/serial/of-serial.txt
> +++ b/Documentation/devicetree/bindings/serial/of-serial.txt
> @@ -14,6 +14,7 @@ Required properties:
>  	- "altr,16550-FIFO32"
>  	- "altr,16550-FIFO64"
>  	- "altr,16550-FIFO128"
> +	- "sprd,serial"

Is there not a more specific name? I'd imagine you might build a
different uart in future.

I didn't spot "sprd" in vendor-prefixes.txt in mainline. Is there a
patch adding that?

Mark.

>  	- "serial" if the port type is unknown.
>  - reg : offset and length of the register set for the device.
>  - interrupts : should contain uart interrupt.
> -- 
> 1.7.9.5
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
