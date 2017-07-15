From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 1/1] drivers/staging/pi433: New driver (fwd)
Date: Sat, 15 Jul 2017 22:50:01 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1707152247510.5105@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolf Entwicklungen <Marcus.Wolf-79IPTMiko8heq5RAq1AYSxS11BummzK+@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Please check on lines 894 and 688 (not shown) for the issues mentioned
below.

Note that the ifs and {s in the following code snippet don't always follow
the kernel coding style, eg on line 901.

julia

---------- Forwarded message ----------
Date: Sun, 16 Jul 2017 04:35:49 +0800
From: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
To: kbuild-JC7UmRfGjtg@public.gmane.org
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 1/1] drivers/staging/pi433: New driver

Hi Wolf,

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on v4.12 next-20170714]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Wolf-Entwicklungen/drivers-staging-pi433-New-driver/20170716-021625
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

>> drivers/staging/pi433/pi433_if.c:894:18-21: ERROR: device is NULL but dereferenced.
--
>> drivers/staging/pi433/pi433_if.c:688:5-19: WARNING: Unsigned expression compared with zero: bytes_received >= 0

git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 6b5d85fc273ec7c19addf7770155414da647de7e
vim +894 drivers/staging/pi433/pi433_if.c

6b5d85fc Wolf Entwicklungen 2017-07-15  883
6b5d85fc Wolf Entwicklungen 2017-07-15  884  static int pi433_open(struct inode *inode, struct file *filp)
6b5d85fc Wolf Entwicklungen 2017-07-15  885  {
6b5d85fc Wolf Entwicklungen 2017-07-15  886  	struct pi433_device	*device;
6b5d85fc Wolf Entwicklungen 2017-07-15  887  	struct pi433_instance	*instance;
6b5d85fc Wolf Entwicklungen 2017-07-15  888
6b5d85fc Wolf Entwicklungen 2017-07-15  889  	mutex_lock(&minor_lock);
6b5d85fc Wolf Entwicklungen 2017-07-15  890  	device = idr_find(&pi433_idr, iminor(inode));
6b5d85fc Wolf Entwicklungen 2017-07-15  891
6b5d85fc Wolf Entwicklungen 2017-07-15  892  	mutex_unlock(&minor_lock);
6b5d85fc Wolf Entwicklungen 2017-07-15  893  	if (!device) {
6b5d85fc Wolf Entwicklungen 2017-07-15 @894  		dev_dbg(device->dev, "device: minor %d unknown.\n", iminor(inode));
6b5d85fc Wolf Entwicklungen 2017-07-15  895  		return -ENODEV;
6b5d85fc Wolf Entwicklungen 2017-07-15  896  	}
6b5d85fc Wolf Entwicklungen 2017-07-15  897
6b5d85fc Wolf Entwicklungen 2017-07-15  898  	if (!device->rx_buffer) {
6b5d85fc Wolf Entwicklungen 2017-07-15  899  		device->rx_buffer = kmalloc(MAX_MSG_SIZE, GFP_KERNEL);
6b5d85fc Wolf Entwicklungen 2017-07-15  900  		if (!device->rx_buffer)
6b5d85fc Wolf Entwicklungen 2017-07-15  901  		{
6b5d85fc Wolf Entwicklungen 2017-07-15  902  			dev_dbg(device->dev, "open/ENOMEM\n");
6b5d85fc Wolf Entwicklungen 2017-07-15  903  			return -ENOMEM;
6b5d85fc Wolf Entwicklungen 2017-07-15  904  		}
6b5d85fc Wolf Entwicklungen 2017-07-15  905  	}
6b5d85fc Wolf Entwicklungen 2017-07-15  906
6b5d85fc Wolf Entwicklungen 2017-07-15  907  	device->users++;
6b5d85fc Wolf Entwicklungen 2017-07-15  908  	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
6b5d85fc Wolf Entwicklungen 2017-07-15  909  	if (!instance)
6b5d85fc Wolf Entwicklungen 2017-07-15  910  	{
6b5d85fc Wolf Entwicklungen 2017-07-15  911  		kfree(device->rx_buffer);
6b5d85fc Wolf Entwicklungen 2017-07-15  912  		device->rx_buffer = NULL;
6b5d85fc Wolf Entwicklungen 2017-07-15  913  		return -ENOMEM;
6b5d85fc Wolf Entwicklungen 2017-07-15  914  	}
6b5d85fc Wolf Entwicklungen 2017-07-15  915
6b5d85fc Wolf Entwicklungen 2017-07-15  916  	/* setup instance data*/
6b5d85fc Wolf Entwicklungen 2017-07-15  917  	instance->device = device;
6b5d85fc Wolf Entwicklungen 2017-07-15  918  	instance->tx_cfg.bit_rate = 4711;
6b5d85fc Wolf Entwicklungen 2017-07-15  919  	// TODO: fill instance->tx_cfg;
6b5d85fc Wolf Entwicklungen 2017-07-15  920
6b5d85fc Wolf Entwicklungen 2017-07-15  921  	/* instance data as context */
6b5d85fc Wolf Entwicklungen 2017-07-15  922  	filp->private_data = instance;
6b5d85fc Wolf Entwicklungen 2017-07-15  923  	nonseekable_open(inode, filp);
6b5d85fc Wolf Entwicklungen 2017-07-15  924
6b5d85fc Wolf Entwicklungen 2017-07-15  925  	return 0;
6b5d85fc Wolf Entwicklungen 2017-07-15  926  }
6b5d85fc Wolf Entwicklungen 2017-07-15  927

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
