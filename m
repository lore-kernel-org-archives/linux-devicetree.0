From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH v4] usb: create usb_debug_root for gadget only
Date: Tue, 04 Jun 2019 10:47:55 +0300
Message-ID: <87k1e123mc.fsf@linux.intel.com>
References: <1559633647-29040-1-git-send-email-chunfeng.yun@mediatek.com> <20190604073706.GA25045@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604073706.GA25045@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Hi,

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> +struct dentry *usb_debugfs_init(void)
>> +{
>> +	if (!usb_debug_root)
>> +		usb_debug_root = debugfs_create_dir("usb", NULL);
>> +
>> +	atomic_inc(&usb_debug_root_refcnt);
>> +
>> +	return usb_debug_root;
>> +}
>> +EXPORT_SYMBOL_GPL(usb_debugfs_init);
>> +
>> +void usb_debugfs_cleanup(void)
>> +{
>> +	if (atomic_dec_and_test(&usb_debug_root_refcnt)) {
>> +		debugfs_remove_recursive(usb_debug_root);
>> +		usb_debug_root = NULL;
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(usb_debugfs_cleanup);
>
> Only remove the debugfs subdir if the usbcore module is removed.  Create
> the debugfs subdir when the usbcore module is loaded.  No need for any
> reference counting of any sort at all.  No need to overthink this :)

There is a slight need to overthink. He wants to use the same directory
for gadget-only builds too :-)

-- 
balbi
