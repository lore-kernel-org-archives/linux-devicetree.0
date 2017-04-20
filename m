From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/9] staging: ccree: add ahash support
Date: Fri, 21 Apr 2017 02:06:29 +0800
Message-ID: <201704210146.3krxPlST%fengguang.wu@intel.com>
References: <1492693983-8175-3-git-send-email-gilad@benyossef.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492693983-8175-3-git-send-email-gilad@benyossef.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: kbuild-all@01.org, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, Binoy Jayan <binoy.jayan@linaro.org>, devicetree@vger.kernel.org, gilad.benyossef@arm.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Stuart Yoder <stuart.yoder@arm.com>, Ofir Drang <ofir.drang@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Gilad,

[auto build test WARNING on linus/master]
[also build test WARNING on v4.11-rc7]
[cannot apply to staging/staging-testing next-20170420]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Gilad-Ben-Yossef/staging-ccree-add-Arm-TrustZone-CryptoCell-REE-driver/20170420-222023


coccinelle warnings: (new ones prefixed by >>)

>> drivers/staging/ccree/ssi_hash.c:317:2-7: WARNING: NULL check before freeing functions like kfree, debugfs_remove, debugfs_remove_recursive or usb_free_urb is not needed. Maybe consider reorganizing relevant code to avoid passing NULL values.
   drivers/staging/ccree/ssi_hash.c:320:2-7: WARNING: NULL check before freeing functions like kfree, debugfs_remove, debugfs_remove_recursive or usb_free_urb is not needed. Maybe consider reorganizing relevant code to avoid passing NULL values.
   drivers/staging/ccree/ssi_hash.c:323:2-7: WARNING: NULL check before freeing functions like kfree, debugfs_remove, debugfs_remove_recursive or usb_free_urb is not needed. Maybe consider reorganizing relevant code to avoid passing NULL values.
   drivers/staging/ccree/ssi_hash.c:373:2-7: WARNING: NULL check before freeing functions like kfree, debugfs_remove, debugfs_remove_recursive or usb_free_urb is not needed. Maybe consider reorganizing relevant code to avoid passing NULL values.
   drivers/staging/ccree/ssi_hash.c:375:2-7: WARNING: NULL check before freeing functions like kfree, debugfs_remove, debugfs_remove_recursive or usb_free_urb is not needed. Maybe consider reorganizing relevant code to avoid passing NULL values.
   drivers/staging/ccree/ssi_hash.c:377:2-7: WARNING: NULL check before freeing functions like kfree, debugfs_remove, debugfs_remove_recursive or usb_free_urb is not needed. Maybe consider reorganizing relevant code to avoid passing NULL values.
   drivers/staging/ccree/ssi_hash.c:379:3-8: WARNING: NULL check before freeing functions like kfree, debugfs_remove, debugfs_remove_recursive or usb_free_urb is not needed. Maybe consider reorganizing relevant code to avoid passing NULL values.
   drivers/staging/ccree/ssi_hash.c:381:2-7: WARNING: NULL check before freeing functions like kfree, debugfs_remove, debugfs_remove_recursive or usb_free_urb is not needed. Maybe consider reorganizing relevant code to avoid passing NULL values.
   drivers/staging/ccree/ssi_hash.c:383:2-7: WARNING: NULL check before freeing functions like kfree, debugfs_remove, debugfs_remove_recursive or usb_free_urb is not needed. Maybe consider reorganizing relevant code to avoid passing NULL values.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
