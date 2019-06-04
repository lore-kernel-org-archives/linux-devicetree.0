From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] USB: move usb debugfs directory creation to the usb common core
Date: Tue, 04 Jun 2019 15:25:14 +0300
Message-ID: <87tvd5illh.fsf@linux.intel.com>
References: <20190604093258.GB30054@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604093258.GB30054@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Hi,

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 7fcb9f782931..f3d6b1ab80cb 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -1185,19 +1185,17 @@ static struct notifier_block usb_bus_nb = {
>  	.notifier_call = usb_bus_notify,
>  };
>  
> -struct dentry *usb_debug_root;
> -EXPORT_SYMBOL_GPL(usb_debug_root);
> +static struct dentry *usb_devices_root;
>  
>  static void usb_debugfs_init(void)
>  {
> -	usb_debug_root = debugfs_create_dir("usb", NULL);
> -	debugfs_create_file("devices", 0444, usb_debug_root, NULL,
> -			    &usbfs_devices_fops);
> +	usb_devices_root = debugfs_create_file("devices", 0444, usb_debug_root,

don't we have a race now? Can usbcore ever probe before usb common?

-- 
balbi
