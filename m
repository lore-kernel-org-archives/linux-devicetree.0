From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH v4 2/2] cec: add STM32 cec driver (fwd)
Date: Mon, 29 May 2017 13:20:10 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1705291319130.2989@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: yannick.fertre-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org
List-Id: devicetree@vger.kernel.org

BRDNOGEN is duplicate in the #defined on line 46.

julia

---------- Forwarded message ----------
Date: Mon, 29 May 2017 19:16:10 +0800
From: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
To: kbuild-JC7UmRfGjtg@public.gmane.org
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH v4 2/2] cec: add STM32 cec driver

CC: kbuild-all-JC7UmRfGjtg@public.gmane.org
In-Reply-To: <1496046855-5809-3-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
TO: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
CC: yannick.fertre-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org
CC: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hi Benjamin,

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v4.12-rc3 next-20170529]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Benjamin-Gaignard/cec-STM32-driver/20170529-172722
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

>> drivers/media/platform/stm32/stm32-cec.c:46:33-41: duplicated argument to & or |

git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 8864245090acf32561bbec305dd8be5cfe31f1e1
vim +46 drivers/media/platform/stm32/stm32-cec.c

88642450 Benjamin Gaignard 2017-05-29  30  #define CEC_ISR		0x0010 /* Interrupt and status Register */
88642450 Benjamin Gaignard 2017-05-29  31  #define CEC_IER		0x0014 /* Interrupt enable Register */
88642450 Benjamin Gaignard 2017-05-29  32
88642450 Benjamin Gaignard 2017-05-29  33  #define TXEOM		BIT(2)
88642450 Benjamin Gaignard 2017-05-29  34  #define TXSOM		BIT(1)
88642450 Benjamin Gaignard 2017-05-29  35  #define CECEN		BIT(0)
88642450 Benjamin Gaignard 2017-05-29  36
88642450 Benjamin Gaignard 2017-05-29  37  #define LSTN		BIT(31)
88642450 Benjamin Gaignard 2017-05-29  38  #define OAR		GENMASK(30, 16)
88642450 Benjamin Gaignard 2017-05-29  39  #define SFTOP		BIT(8)
88642450 Benjamin Gaignard 2017-05-29  40  #define BRDNOGEN	BIT(7)
88642450 Benjamin Gaignard 2017-05-29  41  #define LBPEGEN		BIT(6)
88642450 Benjamin Gaignard 2017-05-29  42  #define BREGEN		BIT(5)
88642450 Benjamin Gaignard 2017-05-29  43  #define BRESTP		BIT(4)
88642450 Benjamin Gaignard 2017-05-29  44  #define RXTOL		BIT(3)
88642450 Benjamin Gaignard 2017-05-29  45  #define SFT		GENMASK(2, 0)
88642450 Benjamin Gaignard 2017-05-29 @46  #define FULL_CFG	(LSTN | SFTOP | BRDNOGEN | LBPEGEN | BREGEN | BRESTP \
88642450 Benjamin Gaignard 2017-05-29  47  			 | RXTOL | BRDNOGEN)
88642450 Benjamin Gaignard 2017-05-29  48
88642450 Benjamin Gaignard 2017-05-29  49  #define TXACKE		BIT(12)
88642450 Benjamin Gaignard 2017-05-29  50  #define TXERR		BIT(11)
88642450 Benjamin Gaignard 2017-05-29  51  #define TXUDR		BIT(10)
88642450 Benjamin Gaignard 2017-05-29  52  #define TXEND		BIT(9)
88642450 Benjamin Gaignard 2017-05-29  53  #define TXBR		BIT(8)
88642450 Benjamin Gaignard 2017-05-29  54  #define ARBLST		BIT(7)

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
