From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 4/6] usb: roles: add API to get usb_role_switch by
 node
Date: Fri, 15 Mar 2019 17:13:24 +0800
Message-ID: <1552641204.10179.133.camel@mhfsdcap03>
References: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
         <1552635513-2378-5-git-send-email-chunfeng.yun@mediatek.com>
         <20190315081835.GD7752@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315081835.GD7752@kuha.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,
On Fri, 2019-03-15 at 10:18 +0200, Heikki Krogerus wrote:
> On Fri, Mar 15, 2019 at 03:38:31PM +0800, Chunfeng Yun wrote:
> > Add usb_role_switch_get_by_node() to make easier to get
> > usb_role_switch by node which register it.
> > It's useful when there is not device_connection registered
> > between two drivers and only knows the node which register
> > usb_role_switch.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/roles/class.c | 30 ++++++++++++++++++++++++++++++
> >  include/linux/usb/role.h  |  1 +
> >  2 files changed, 31 insertions(+)
> > 
> > diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> > index 99116af07f1d..284b19856dc4 100644
> > --- a/drivers/usb/roles/class.c
> > +++ b/drivers/usb/roles/class.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/device.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > +#include <linux/of.h>
> >  #include <linux/slab.h>
> >  
> >  static struct class *role_class;
> > @@ -121,6 +122,35 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(usb_role_switch_get);
> >  
> > +static int __switch_match_node(struct device *dev, const void *node)
> > +{
> > +	return dev->parent->of_node == (const struct device_node *)node;
> > +}
> 
> Andy already pointed out that you need to use fwnodes.
> 
> Rule of thumb: You always use fwnodes. Only if there is something that
> can't be done with fwnodes you use DT or ACPI nodes directly.
> 
> In this case there is absolutely nothing that would prevent you from
> using fwnodes.
> 
Got it, will fix it in next version.

BTW:

I encounter a build error when CONFIG_USB_ROLE_SWITCH is not enabled,

drivers/usb/mtu3/mtu3_dr.o: In function `ssusb_role_sw_register':
./drivers/usb/mtu3/mtu3_dr.c:460: undefined reference to
`usb_role_switch_register'
drivers/usb/mtu3/mtu3_dr.o: In function `ssusb_otg_switch_exit':
./drivers/usb/mtu3/mtu3_dr.c:491: undefined reference to
`usb_role_switch_unregister'

the following patch has fixed the issue, but seems not get into kernel,
[v3,08/12] usb: roles: Add usb role switch notifier.
https://patchwork.kernel.org/patch/10836525/

What should I do if I add a new API? Thanks

> 
> thanks,
> 
