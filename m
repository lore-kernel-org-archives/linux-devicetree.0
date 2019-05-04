Return-Path: <SRS0=ik/T=TE=intel.com=lkp@kernel.org>
Date: Sat, 4 May 2019 19:40:49 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v5 4/5] [media] allegro: add Allegro DVT video IP core
 driver
Message-ID: <201905041935.pwEMGoy7%lkp@intel.com>
References: <20190503122010.16663-5-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503122010.16663-5-m.tretter@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: kbuild-all@01.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl
List-ID: <devicetree@vger.kernel.org>

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.1-rc7 next-20190503]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Michael-Tretter/Add-ZynqMP-VCU-Allegro-DVT-H-264-encoder-driver/20190504-161958
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/media/platform/allegro-dvt/allegro-core.c:735:5: sparse: sparse: symbol 'allegro_alloc_buffer' was not declared. Should it be static?
>> drivers/media/platform/allegro-dvt/allegro-core.c:747:6: sparse: sparse: symbol 'allegro_free_buffer' was not declared. Should it be static?
>> drivers/media/platform/allegro-dvt/allegro-core.c:1607:13: sparse: sparse: symbol 'allegro_hardirq' was not declared. Should it be static?
>> drivers/media/platform/allegro-dvt/allegro-core.c:1621:13: sparse: sparse: symbol 'allegro_irq_thread' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
