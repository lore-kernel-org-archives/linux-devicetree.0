From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v7 00/23] usb gadget update for OTG 2.0
Date: Tue, 14 Jul 2015 07:43:41 +0800
Message-ID: <20150713234340.GA30801@shlinux2>
References: <1436426340-18477-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1436426340-18477-1-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 09, 2015 at 03:18:37PM +0800, Li Jun wrote:
...
> 
> This is a follow-up of Macpaul Lin's previous patchset to resolve usb
> gadget driver working with OTG 2.0, and set otg features by not only
> usb driver config but also usb hardware property in DT, main changes:
> 1. Add usb_otg20_descriptor definition for OTG 2.0 which introduces bcdOTG
>    field for otg revision, bcdOTG can be passed via device tree.
> 2. OTG features(SRP/HNP/ADP) can be decided by combination of usb HW
>    properties and usb driver config.
> 3. Change the chipidea usb driver to use the updated mechanism.
> 4. Remove static usb otg descriptor definition, but allocate and init it
>    according to otg capabilities in each gadget driver, if otg capabilities
>    is not defined for legacy platforms, the usb otg descriptor content is
>    kept the same as current static definition.
> 
> Li Jun (19):
>   usb: otg: add usb_otg_caps structure for otg capabilities
>   doc: dt-binding: usb: add otg related properties
>   usb: common: add API to update usb otg capabilities by device tree
>   usb: chipidea: set usb otg capabilities
>   usb: chipidea: update ci_otg_is_fsm_mode conditions
>   usb: gadget: add usb otg descriptor allocate and init interface
>   usb: gadget: configfs: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: ether: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: acm_ms: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: audio: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: cdc2: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: g_ffs: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: hid: allocate and init otg descriptor by otg capabilities
>   usb: gadget: mass_storage: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: multi: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: ncm: allocate and init otg descriptor by otg capabilities
>   usb: gadget: printer: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: serial: allocate and init otg descriptor by otg
>     capabilities
>   usb: gadget: zero: allocate and init otg descriptor by otg
>     capabilities
> 
> Macpaul Lin (4):
>   usb: add usb_otg20_descriptor for OTG 2.0 and above
>   usb: add USB_OTG_ADP definition
>   usb: add usb_otg_caps to usb_gadget structure.
>   usb: gadget: composite: add USB_DT_OTG request handling
> 
>  Documentation/devicetree/bindings/usb/generic.txt | 15 ++++++
>  drivers/usb/chipidea/ci.h                         |  5 +-
>  drivers/usb/chipidea/core.c                       | 15 ++++++
>  drivers/usb/chipidea/debug.c                      |  1 +
>  drivers/usb/chipidea/udc.c                        |  7 ++-
>  drivers/usb/common/common.c                       | 56 +++++++++++++++++++++++
>  drivers/usb/gadget/composite.c                    | 27 +++++++++++
>  drivers/usb/gadget/config.c                       | 56 +++++++++++++++++++++++
>  drivers/usb/gadget/configfs.c                     | 29 ++++++++----
>  drivers/usb/gadget/legacy/acm_ms.c                | 35 +++++++-------
>  drivers/usb/gadget/legacy/audio.c                 | 34 ++++++++------
>  drivers/usb/gadget/legacy/cdc2.c                  | 35 +++++++-------
>  drivers/usb/gadget/legacy/ether.c                 | 36 ++++++++-------
>  drivers/usb/gadget/legacy/g_ffs.c                 | 32 +++++++------
>  drivers/usb/gadget/legacy/hid.c                   | 36 ++++++++-------
>  drivers/usb/gadget/legacy/mass_storage.c          | 35 +++++++-------
>  drivers/usb/gadget/legacy/multi.c                 | 37 ++++++++-------
>  drivers/usb/gadget/legacy/ncm.c                   | 34 ++++++++------
>  drivers/usb/gadget/legacy/printer.c               | 49 ++++++++++++--------
>  drivers/usb/gadget/legacy/serial.c                | 37 ++++++++-------
>  drivers/usb/gadget/legacy/zero.c                  | 41 +++++++++--------
>  include/linux/usb/chipidea.h                      |  1 +
>  include/linux/usb/gadget.h                        |  6 +++
>  include/linux/usb/of.h                            |  7 +++
>  include/linux/usb/otg.h                           | 15 ++++++
>  include/uapi/linux/usb/ch9.h                      | 12 +++++
>  26 files changed, 485 insertions(+), 208 deletions(-)
> 
> -- 
> 1.9.1
> 

Hi Felipe

This patchset is fully reviewed by Roger and Peter, please let me know your
comments/plan on it, thanks.

Li Jun
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
