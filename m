From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v4] usb: create usb_debug_root for gadget only
Date: Tue, 4 Jun 2019 16:59:14 +0800
Message-ID: <1559638754.8487.71.camel@mhfsdcap03>
References: <1559633647-29040-1-git-send-email-chunfeng.yun@mediatek.com>
 <20190604073706.GA25045@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190604073706.GA25045@kroah.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-04 at 09:37 +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 04, 2019 at 03:34:07PM +0800, Chunfeng Yun wrote:
> > When CONFIG_USB is not set, and CONFIG_USB_GADGET is set,
> > there is an issue, e.g.:
> > 
> > drivers/usb/mtu3/mtu3_debugfs.o: in function 'ssusb_debugfs_create_root':
> > mtu3_debugfs.c:(.text+0xba3): undefined reference to 'usb_debug_root'
> > 
> > usb_debug_root is currently only built when host is supported
> > (CONFIG_USB is set), for convenience, we also want it created when
> > gadget only is enabled, this patch try to support it.
> > 
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v4:
> >   move common API into common.c suggested by Felipe
> > 
> > v3:
> >   1. still create usb_debug_root for gadget only
> >   2. abandon mtu3's change
> >   3. drop acked-by Randy
> > 
> > v2(resend): add acked-by Randy
> > 
> > v1: fix mtu3's build error, replace usb_debug_root by NULL;
> > ---
> >  drivers/usb/common/common.c   | 26 ++++++++++++++++++++++++++
> >  drivers/usb/core/usb.c        | 16 ++++------------
> >  drivers/usb/gadget/udc/core.c |  3 +++
> >  include/linux/usb.h           |  2 ++
> >  4 files changed, 35 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> > index 18f5dcf58b0d..c52e9c9f58ec 100644
> > --- a/drivers/usb/common/common.c
> > +++ b/drivers/usb/common/common.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/usb/of.h>
> >  #include <linux/usb/otg.h>
> >  #include <linux/of_platform.h>
> > +#include <linux/debugfs.h>
> >  
> >  static const char *const ep_type_names[] = {
> >  	[USB_ENDPOINT_XFER_CONTROL] = "ctrl",
> > @@ -139,6 +140,31 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(usb_get_dr_mode);
> >  
> > +struct dentry *usb_debug_root;
> > +EXPORT_SYMBOL_GPL(usb_debug_root);
> > +
> > +static atomic_t usb_debug_root_refcnt = ATOMIC_INIT(0);
> 
> Ick, no.
> 
> > +
> > +struct dentry *usb_debugfs_init(void)
> > +{
> > +	if (!usb_debug_root)
> > +		usb_debug_root = debugfs_create_dir("usb", NULL);
> > +
> > +	atomic_inc(&usb_debug_root_refcnt);
> > +
> > +	return usb_debug_root;
> > +}
> > +EXPORT_SYMBOL_GPL(usb_debugfs_init);
> > +
> > +void usb_debugfs_cleanup(void)
> > +{
> > +	if (atomic_dec_and_test(&usb_debug_root_refcnt)) {
> > +		debugfs_remove_recursive(usb_debug_root);
> > +		usb_debug_root = NULL;
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(usb_debugfs_cleanup);
> 
> Only remove the debugfs subdir if the usbcore module is removed. 
Both usbcore module and gadget module will use this "usb" subdir now.
Gadget module may still use it when remove usbcore module.

>  Create
> the debugfs subdir when the usbcore module is loaded.  No need for any
> reference counting of any sort at all.  No need to overthink this :)
> 
> thanks,
> 
> greg k-h
