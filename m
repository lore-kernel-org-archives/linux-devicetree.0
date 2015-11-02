From: "Kim, Milo" <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH RESEND 08/16] backlight: ti-lmu-backlight: add LM3532
 driver
Date: Mon, 2 Nov 2015 16:33:54 +0900
Message-ID: <563711E2.70002@ti.com>
References: <201511021324.3ZsaAzBu%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201511021324.3ZsaAzBu%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ouch! The notifier.h must be included. I didn't notice this error in ARM 
architecture. Let me fix this error in next patch-set.
Thanks a lot for catching this!

Best regards,
Milo

diff --git a/include/linux/mfd/ti-lmu.h b/include/linux/mfd/ti-lmu.h
index eeb6b9e..44268c7 100644
--- a/include/linux/mfd/ti-lmu.h
+++ b/include/linux/mfd/ti-lmu.h
@@ -14,6 +14,7 @@
  #define __MFD_TI_LMU_H__

  #include <linux/gpio.h>
+#include <linux/notifier.h>
  #include <linux/regmap.h>

  /* Notifier event */

On 11/2/2015 2:37 PM, kbuild test robot wrote:
> Hi Milo,
>
> [auto build test ERROR on ljones-mfd/for-mfd-next -- if it's inappropriate base, please suggest rules for selecting the more suitable base]
>
> url:    https://github.com/0day-ci/linux/commits/Milo-Kim/Support-TI-LMU-devices/20151102-130804
> config: mips-allyesconfig (attached as .config)
> reproduce:
>          wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          make.cross ARCH=mips
>
> All errors (new ones prefixed by >>):
>
>     In file included from drivers/video/backlight/lm3532_bl.c:14:0:
>>> include/linux/mfd/ti-lmu.h:74:32: error: field 'notifier' has incomplete type
>       struct blocking_notifier_head notifier;
>                                     ^
>
> vim +/notifier +74 include/linux/mfd/ti-lmu.h
>
> 51194f72 Milo Kim 2015-11-02  68   * @notifier:	Notifier for reporting hwmon event
> 51194f72 Milo Kim 2015-11-02  69   */
> 51194f72 Milo Kim 2015-11-02  70  struct ti_lmu {
> 51194f72 Milo Kim 2015-11-02  71  	struct device *dev;
> 51194f72 Milo Kim 2015-11-02  72  	struct regmap *regmap;
> 51194f72 Milo Kim 2015-11-02  73  	int en_gpio;
> 51194f72 Milo Kim 2015-11-02 @74  	struct blocking_notifier_head notifier;
> 51194f72 Milo Kim 2015-11-02  75  };
> 51194f72 Milo Kim 2015-11-02  76
> 51194f72 Milo Kim 2015-11-02  77  int ti_lmu_read_byte(struct ti_lmu *lmu, u8 reg, u8 *read);
>
> :::::: The code at line 74 was first introduced by commit
> :::::: 51194f72221b7b83a8f6a5ba9bf0c49a10233ca2 mfd: add TI LMU driver
>
> :::::: TO: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
> :::::: CC: 0day robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
