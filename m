From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] USB: move usb debugfs directory creation to the usb
 common core
Date: Wed, 5 Jun 2019 16:37:08 +0800
Message-ID: <1559723828.8487.103.camel@mhfsdcap03>
References: <20190604093258.GB30054@kroah.com>
         <87tvd5illh.fsf@linux.intel.com> <20190604124349.GA10203@kroah.com>
         <871s08ebjn.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <871s08ebjn.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-06-05 at 10:28 +0300, Felipe Balbi wrote:
> Hi,
> 
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> >> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> >> > diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> >> > index 7fcb9f782931..f3d6b1ab80cb 100644
> >> > --- a/drivers/usb/core/usb.c
> >> > +++ b/drivers/usb/core/usb.c
> >> > @@ -1185,19 +1185,17 @@ static struct notifier_block usb_bus_nb = {
> >> >  	.notifier_call = usb_bus_notify,
> >> >  };
> >> >  
> >> > -struct dentry *usb_debug_root;
> >> > -EXPORT_SYMBOL_GPL(usb_debug_root);
> >> > +static struct dentry *usb_devices_root;
> >> >  
> >> >  static void usb_debugfs_init(void)
> >> >  {
> >> > -	usb_debug_root = debugfs_create_dir("usb", NULL);
> >> > -	debugfs_create_file("devices", 0444, usb_debug_root, NULL,
> >> > -			    &usbfs_devices_fops);
> >> > +	usb_devices_root = debugfs_create_file("devices", 0444, usb_debug_root,
> >> 
> >> don't we have a race now? Can usbcore ever probe before usb common?
> >
> > How can that happen if usb_debug_root is in usb common?  The module
> > loader will not let that happen.  Or it shouldn't :)
> 
> argh, indeed. The very fact that usbcore tries to resolve usb_debug_root
> already forces a dependency :-p
When build as module, usbcore depend on usb-common, but when buildin,
usbcore init before usb-common (use module_init)

> 
