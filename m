From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v3 00/16] da8xx USB clocks
Date: Thu, 7 Apr 2016 11:29:37 -0500
Message-ID: <57068AF1.8050909@lechnology.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458863503-31121-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/24/2016 06:51 PM, David Lechner wrote:
> This is a reworking of the v2 series based of feedback and review. There were
> very many suggestions, so hopefully I didn't miss any. Here are the highlights...
>
> New stuff:
>
> * Fixed the davinci device tree declarations to use the preferred DT address
>    convention so that the items I have added can be correct too.
> * Moved that davinci clock init so that we don't have to call ioremap in the
>    clock mux functions.
> * Added a new "syscon" device for the CFGCHIP registers. This is used by the
>    USB PHY driver and will be used in the future in common clock framework
>    drivers.
>
> Changed:
>
> * USB clocks are moved to a common file instead of having duplicated code.
> * PHY driver uses syscon for CFGCHIP registers instead of using them directly.
>
> David Lechner (16):
>    dt: davinci: use proper address after @
>    mfd: da8xx-cfgchip: New header file for CFGCHIP registers.
>    ARM: davinici: da8xx: move usb code to new file
>    ARM: davinci: Move clock init after ioremap.
>    ARM: davinci: add set_parent callback for mux clocks
>    ARM: davinci: da850: use clk->set_parent for async3
>    ARM: davinci: da8xx: add usb phy clocks
>    dt-bindings: Add bindings for phy-da8xx-usb
>    phy: da8xx-usb: new driver for DA8xx SoC USB PHY
>    ARM: davinci: da8xx: Add CFGCHIPn syscon platform declaration.
>    ARM: davinci: da8xx: Add USB PHY platform declaration
>    ARM: dt: da850: Add cfgchip syscon node
>    ARM: dt: da850: Add usb phy node
>    usb: ohci-da8xx: Remove code that references mach
>    usb: musb: da8xx: Use devm in probe
>    usb: musb: da8xx: Remove mach code
>


Any further comments before I submit a v4 patchset? Particularly on 
patches 3 and 4 which are new in this v3 submission and have not been 
commented on yet.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
