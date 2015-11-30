From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/28] dt-bindings: ascii-lcd: Document a binding for
 simple ASCII LCDs
Date: Mon, 30 Nov 2015 12:57:42 -0600
Message-ID: <20151130185742.GA28127@rob-hp-laptop>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
 <1448900513-20856-3-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448900513-20856-3-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 04:21:27PM +0000, Paul Burton wrote:
> Add documentation for a devicetree binding for simple memory-mapped
> ASCII LCD displays, such as those found on the Imagination Technologies
> Boston & Malta development boards.
> 
> Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
> 
>  Documentation/devicetree/bindings/ascii-lcd.txt | 10 ++++++++++

This should go under bindings/display/.

>  MAINTAINERS                                     |  5 +++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ascii-lcd.txt
> 
> diff --git a/Documentation/devicetree/bindings/ascii-lcd.txt b/Documentation/devicetree/bindings/ascii-lcd.txt
> new file mode 100644
> index 0000000..40ae536
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ascii-lcd.txt
> @@ -0,0 +1,10 @@
> +Binding for simple memory-mapped ASCII LCD displays

Presumably, this is a binding for the controller, not the actual 
display. You need to more fully describe what the h/w looks like here. 
Like what is the interface between the controller and display?

Rob

> +
> +Required properties:
> +- compatible : should be one of:
> +    "img,boston-lcd"
> +    "mti,malta-lcd"
> +- reg : memory region locating the device registers
> +
> +The layout of the registers & properties of the display are determined
> +from the compatible string, making this binding somewhat trivial.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cba790b..1e2b74b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1782,6 +1782,11 @@ S:	Maintained
>  F:	Documentation/hwmon/asc7621
>  F:	drivers/hwmon/asc7621.c
>  
> +ASCII LCD DRIVER
> +M:	Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/ascii-lcd.txt
> +
>  ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>  M:	Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  L:	acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
> -- 
> 2.6.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
