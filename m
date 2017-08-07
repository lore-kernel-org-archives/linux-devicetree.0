From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Altera ASMI Parallel II IP Core
 (fwd)
Date: Mon, 7 Aug 2017 07:59:20 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1708070757550.2061@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org
List-Id: devicetree@vger.kernel.org

dev_err does not seem possible to use here (line 447).

julia

---------- Forwarded message ----------
Date: Mon, 7 Aug 2017 04:45:58 +0800
From: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
To: kbuild-JC7UmRfGjtg@public.gmane.org
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Altera ASMI Parallel II IP Core

Hi Matthew,

[auto build test WARNING on next-20170804]
[also build test WARNING on v4.13-rc3]
[cannot apply to mtd/spi-nor/fixes linus/master mtd/master v4.13-rc3 v4.13-rc2 v4.13-rc1]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/matthew-gerlach-linux-intel-com/dt-bindings-mtd-Altera-ASMI-Parallel-II-IP-Core/20170807-023147
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

>> drivers/mtd/spi-nor/altera-asmip2.c:447:17-20: ERROR: pdev is NULL but dereferenced.

# https://github.com/0day-ci/linux/commit/ec2e26c1b07806d734a2939530e7d4b4d7c67f0c
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout ec2e26c1b07806d734a2939530e7d4b4d7c67f0c
vim +447 drivers/mtd/spi-nor/altera-asmip2.c

ec2e26c1 Matthew Gerlach 2017-08-06  443
ec2e26c1 Matthew Gerlach 2017-08-06  444  static int altera_asmip2_remove(struct platform_device *pdev)
ec2e26c1 Matthew Gerlach 2017-08-06  445  {
ec2e26c1 Matthew Gerlach 2017-08-06  446  	if (!pdev) {
ec2e26c1 Matthew Gerlach 2017-08-06 @447  		dev_err(&pdev->dev, "%s NULL\n", __func__);
ec2e26c1 Matthew Gerlach 2017-08-06  448  		return -EINVAL;
ec2e26c1 Matthew Gerlach 2017-08-06  449  	} else {
ec2e26c1 Matthew Gerlach 2017-08-06  450  		return altera_asmip2_remove_banks(&pdev->dev);
ec2e26c1 Matthew Gerlach 2017-08-06  451  	}
ec2e26c1 Matthew Gerlach 2017-08-06  452  }
ec2e26c1 Matthew Gerlach 2017-08-06  453

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
