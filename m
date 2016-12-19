From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH 2/3] of/overlay: sysfs based ABI for dt overlays
Date: Mon, 19 Dec 2016 09:03:13 +0100
Message-ID: <a4bee009-4dc7-e8cc-e3ae-bca8042132dd@gmx.de>
References: <201612191008.JibpO0Px%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201612191008.JibpO0Px%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/19/2016 03:34 AM, kbuild test robot wrote:
> Hi Heinrich,
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on next-20161216]
> [cannot apply to glikely/devicetree/next robh/for-next v4.9]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Heinrich-Schuchardt/of-overlay-sysfs-based-ABI-for-dt-overlays/20161219-093606
> config: i386-randconfig-r0-12190124 (attached as .config)
> compiler: gcc-5 (Debian 5.4.1-2) 5.4.1 20160904
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> All error/warnings (new ones prefixed by >>):
> 
>    drivers/of/ov_sysfs.c: In function 'of_create_overlay_from_file':
>    drivers/of/ov_sysfs.c:69:12: error: implicit declaration of function 'of_fdt_unflatten_tree' [-Werror=implicit-function-declaration]

select OF_EARLY_FLATTREE
is missing in Kconfig. It is automatically selected on ARM64 but not on
other architectures.

>      overlay = of_fdt_unflatten_tree((unsigned long *) buffer, NULL, NULL);
>                ^
>>> drivers/of/ov_sysfs.c:69:10: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>      overlay = of_fdt_unflatten_tree((unsigned long *) buffer, NULL, NULL);
>              ^
>    cc1: some warnings being treated as errors
> 
> vim +/of_fdt_unflatten_tree +69 drivers/of/ov_sysfs.c
> 
>     63		    offset < fdt_totalsize(buffer)) {
>     64			pr_err("OF: Size of %s does not match header information\n",
>     65			       path);
>     66			ret = -EINVAL;
>     67			goto err_file_read;
>     68		}
>   > 69		overlay = of_fdt_unflatten_tree((unsigned long *) buffer, NULL, NULL);
>     70		if (overlay == NULL) {
>     71			pr_err("OF: Cannot unflatten %s\n", path);
>     72			ret = -EINVAL;
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
