From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4] usb: create usb_debug_root for gadget only
Date: Tue, 4 Jun 2019 10:24:07 +0200
Message-ID: <20190604082407.GA3783@kroah.com>
References: <1559633647-29040-1-git-send-email-chunfeng.yun@mediatek.com>
 <20190604073706.GA25045@kroah.com>
 <87k1e123mc.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87k1e123mc.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 04, 2019 at 10:47:55AM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> >> +struct dentry *usb_debugfs_init(void)
> >> +{
> >> +	if (!usb_debug_root)
> >> +		usb_debug_root = debugfs_create_dir("usb", NULL);
> >> +
> >> +	atomic_inc(&usb_debug_root_refcnt);
> >> +
> >> +	return usb_debug_root;
> >> +}
> >> +EXPORT_SYMBOL_GPL(usb_debugfs_init);
> >> +
> >> +void usb_debugfs_cleanup(void)
> >> +{
> >> +	if (atomic_dec_and_test(&usb_debug_root_refcnt)) {
> >> +		debugfs_remove_recursive(usb_debug_root);
> >> +		usb_debug_root = NULL;
> >> +	}
> >> +}
> >> +EXPORT_SYMBOL_GPL(usb_debugfs_cleanup);
> >
> > Only remove the debugfs subdir if the usbcore module is removed.  Create
> > the debugfs subdir when the usbcore module is loaded.  No need for any
> > reference counting of any sort at all.  No need to overthink this :)
> 
> There is a slight need to overthink. He wants to use the same directory
> for gadget-only builds too :-)

Again, that's fine, this file will be loaded for those builds as well,
right?  Otherwise, how would this code even be present?  :)

thanks,

greg k-h
