From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v1 3/5] [media] stm32-dcmi: crop sensor image to match
 user resolution
Date: Sun, 25 Jun 2017 23:02:54 +0800
Message-ID: <201706252214.3z2NADlJ%fengguang.wu@intel.com>
References: <1498144371-13310-4-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1498144371-13310-4-git-send-email-hugues.fruchet@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Hugues Fruchet <hugues.fruchet@st.com>
List-Id: devicetree@vger.kernel.org

Hi Hugues,

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on next-20170623]
[cannot apply to v4.12-rc6]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Hugues-Fruchet/Camera-support-on-STM32F746G-DISCO-board/20170625-204425
base:   git://linuxtv.org/media_tree.git master


coccinelle warnings: (new ones prefixed by >>)

>> drivers/media/platform/stm32/stm32-dcmi.c:808:2-3: Unneeded semicolon
   drivers/media/platform/stm32/stm32-dcmi.c:562:2-3: Unneeded semicolon
   drivers/media/platform/stm32/stm32-dcmi.c:762:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
