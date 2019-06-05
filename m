From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: move usb debugfs directory creation to the usb
 common core
Date: Wed, 5 Jun 2019 10:52:16 +0200
Message-ID: <20190605085216.GB26984@kroah.com>
References: <20190604093258.GB30054@kroah.com>
 <20190604115919.GA24346@kroah.com>
 <1559721031.8487.99.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559721031.8487.99.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 05, 2019 at 03:50:31PM +0800, Chunfeng Yun wrote:
> On Tue, 2019-06-04 at 13:59 +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jun 04, 2019 at 11:32:58AM +0200, Greg Kroah-Hartman wrote:
> > > The USB gadget subsystem wants to use the USB debugfs root directory, so
> > > move it to the common "core" USB code so that it is properly initialized
> > > and removed as needed.
> > > 
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > 
> > > ---
> > > 
> > > This should be the "correct" version of this, Chunfeng, can you test
> > > this to verify it works for you?
> > > 
> > > 
> > > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> > > index 18f5dcf58b0d..3b5e4263ffef 100644
> > > --- a/drivers/usb/common/common.c
> > > +++ b/drivers/usb/common/common.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/usb/of.h>
> > >  #include <linux/usb/otg.h>
> > >  #include <linux/of_platform.h>
> > > +#include <linux/debugfs.h>
> > >  
> > >  static const char *const ep_type_names[] = {
> > >  	[USB_ENDPOINT_XFER_CONTROL] = "ctrl",
> > > @@ -291,4 +292,21 @@ struct device *usb_of_get_companion_dev(struct device *dev)
> > >  EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
> > >  #endif
> > >  
> > > +struct dentry *usb_debug_root;
> > > +EXPORT_SYMBOL_GPL(usb_debug_root);
> > > +
> > > +static int usb_common_init(void)
> > > +{
> > > +	usb_debug_root = debugfs_create_dir("usb", NULL);
> > > +	return 0;
> > > +}
> > > +
> > > +static void usb_common_exit(void)
> > > +{
> > > +	debugfs_remove_recursive(usb_debug_root);
> > > +}
> > > +
> > > +module_init(usb_common_init);
> I tested this patch.
> 
> Here use module_init() indeed have a race as Felipe said before.
> usbcore uses subsys_initcall(), and have a higher priority than
> module_init(), so when usbcore tries to create "devices" file,
> usb_debug_root is not created.

Ah, let me fix that, it should have the same init level and I'll ensure
it comes first in the linking.

> after I replace it by postcore_initcall() (debugfs uses
> core_initcall()), test two cases:
> 
> 1. buildin usbcore/udc-core
> 
>     "usb" directory is created, and usb/devices file is also created by
> usbcore
> 
> 2. build both usbcore and gadget as ko
> 
>     usbcore.ko, udc-core.ko and usb-common.ko are created. 
> 
>    2.1 
>        insmod usb-common.ko   // "usb" directory is created
>        insmod usb-core.ko   // usb/devices file is created
> 
>    2.2
>        rmmod usb-common.ko  // failed, usb_common is in use by usb-core
> 
>    2.3 
>        rmmod usb-core.ko   // usb/devices file is destroyed
>        rmmod usb-common.ko  // usb directory is destroyed
> 
>    2.4 
>        insmod usb-common.ko   // "usb" directory is created
>        insmod udc-core.ko
> 
>    2.5
>        rmmod usb-common.ko  // failed, usb_common is in use by udc-core
> 
>    2.6 
>        rmmod udc-core.ko
>        rmmod usb-common.ko  // usb directory is destroyed
> 
> they are all in line with expectations

Wonderful!

Let me fix up the init level, and the build issue tha kbuild found, and
post a v2 patch.

thanks,

greg k-h
