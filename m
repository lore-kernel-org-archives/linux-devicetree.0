From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 3/3] backlight arcxcnn add support for ArcticSand
 devices
Date: Fri, 17 Mar 2017 22:48:09 +0800
Message-ID: <201703172233.osJjGFrP%fengguang.wu@intel.com>
References: <1489607133-7870-3-git-send-email-olimpiu@arcticsand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489607133-7870-3-git-send-email-olimpiu-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bdodge-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, medasaro-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Olimpiu Dejeu <olimpiu-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Olimpiu,

[auto build test WARNING on robh/for-next]
[also build test WARNING on v4.11-rc2 next-20170310]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Olimpiu-Dejeu/backlight-arcxcnn-add-arc-to-vendor-prefix/20170317-205447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/video/backlight/arcxcnn_bl.c:183:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
