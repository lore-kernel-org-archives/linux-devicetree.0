From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH] clk: hisilicon: add CRG driver for Hi3798CV200 SoC
Date: Tue, 13 Sep 2016 10:45:39 +0800
Message-ID: <57D76853.4080900@hisilicon.com>
References: <201609122155.oR2E2oL7%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201609122155.oR2E2oL7%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, scott.bambrough-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.gregotski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

Sorry. I'll fixed this compiling error in the next version.

Regards,
Jiancheng

On 2016/9/12 21:55, kbuild test robot wrote:
> Hi Jiancheng,
> 
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on v4.8-rc6 next-20160912]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> [Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
> [Check https://git-scm.com/docs/git-format-patch for more information]
> 
> url:    https://github.com/0day-ci/linux/commits/Jiancheng-Xue/clk-hisilicon-add-CRG-driver-for-Hi3798CV200-SoC/20160912-175733
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 5.4.0-6) 5.4.0 20160609
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from drivers/clk/hisilicon/crg-hi3798cv200.c:22:0:
>>> drivers/clk/hisilicon/crg-hi3798cv200.c:245:25: error: 'hi3798cv200_clk_match_table' undeclared here (not in a function)
>     MODULE_DEVICE_TABLE(of, hi3798cv200_clk_match_table);
>                             ^
>    include/linux/module.h:213:21: note: in definition of macro 'MODULE_DEVICE_TABLE'
>     extern const typeof(name) __mod_##type##__##name##_device_table  \
>                         ^
>>> include/linux/module.h:213:27: error: '__mod_of__hi3798cv200_clk_match_table_device_table' aliased to undefined symbol 'hi3798cv200_clk_match_table'
>     extern const typeof(name) __mod_##type##__##name##_device_table  \
>                               ^
>>> drivers/clk/hisilicon/crg-hi3798cv200.c:245:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
>     MODULE_DEVICE_TABLE(of, hi3798cv200_clk_match_table);
>     ^
> 
> vim +/hi3798cv200_clk_match_table +245 drivers/clk/hisilicon/crg-hi3798cv200.c
> 
>    239		{ .compatible = "hisilicon,hi3798cv200-crg",
>    240			.data = &hi3798cv200_crg_funcs},
>    241		{ .compatible = "hisilicon,hi3798cv200-sysctrl",
>    242			.data = &hi3798cv200_sysctrl_funcs},
>    243		{ }
>    244	};
>  > 245	MODULE_DEVICE_TABLE(of, hi3798cv200_clk_match_table);
>    246	
>    247	static int hi3798cv200_crg_probe(struct platform_device *pdev)
>    248	{
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
