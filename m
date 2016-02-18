From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/1] USB: core: let USB device know device node
Date: Thu, 18 Feb 2016 08:38:08 -0600
Message-ID: <20160218143808.GY9654@rob-hp-laptop>
References: <1455612172-2081-1-git-send-email-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455612172-2081-1-git-send-email-peter.chen-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 16, 2016 at 04:42:52PM +0800, Peter Chen wrote:
> From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Although most of USB devices are hot-plug's, there are still some devices
> are hard wired on the board, eg, for HSIC and SSIC interface USB devices.
> If these kinds of USB devices are multiple functions, and they can supply
> other interfaces like i2c, gpios for other devices, we may need to
> describe these at device tree.
> 
> In this commit, it uses "reg" in dts as physical port number to match
> the phyiscal port number decided by USB core, if they are the same,
> then the device node is for the device we are creating for USB core.
> 
> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Changes for v5:
> - Refine the code how to get the device node at usb_alloc_dev according
>   to Alan's comment.
> - Point out "usbVID,PID" is the recommented compatible, and others
>   compatibles at binding doc could also be used.
> 
> Changes for v4:
> - The range of "reg" should be 1-31, changing device node address
>   style as in lower case hexadecimal with leading zeroes suppressed
>   [binding doc, usb-device.txt]
> - Improve the example at binding doc, it describes node from the top
>   (the controller)
> - Delete the struct of_node * within struct usb_device
> - Using usb_hcd_find_raw_port_number to get raw port number under root
>   hub port
> 
> Changes for v3:
> - typo: s/descirbe/describe/
> 
> Changes for v2:
> - Fix build error reported by kbuild robot, lack of "static" for
>   inline usb_of_get_child_node
> - Fix typo, "devcie_node" -> "device_node"
> - Add kernel-doc for of_node at struct usb_device
> 
> Changes from RFC:
> - Fix the error address for binding doc, and add compatible for binding doc
> - Change get child node API from "usb_of_find_node" to
>   "usb_of_get_child_node"
> - Delete unecessary header files
> - One typo
> 
>  .../devicetree/bindings/usb/usb-device.txt         | 26 ++++++++++++

Looks good to me. Thanks for driving this to completion.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/usb/core/Makefile                          |  2 +-
>  drivers/usb/core/of.c                              | 47 ++++++++++++++++++++++
>  drivers/usb/core/usb.c                             | 10 +++++
>  include/linux/usb/of.h                             |  7 ++++
>  5 files changed, 91 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
>  create mode 100644 drivers/usb/core/of.c
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
