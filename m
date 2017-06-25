From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH v1 5/6] [media] ov9650: add multiple variant support
 (fwd)
Date: Sun, 25 Jun 2017 16:00:19 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1706251559180.3109@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Braces are probably missing aroud lines 1618-1620.

julia

---------- Forwarded message ----------
Date: Sun, 25 Jun 2017 23:06:03 +0800
From: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
To: kbuild-JC7UmRfGjtg@public.gmane.org
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH v1 5/6] [media] ov9650: add multiple variant support

Hi Hugues,

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v4.12-rc6 next-20170623]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Hugues-Fruchet/Add-support-of-OV9655-camera/20170625-201153
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago

>> drivers/media/i2c/ov9650.c:1618:2-44: code aligned with following code on line 1619

git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout a9fe8c23240a7f8df39c6238d98e41f41fedb641
vim +1618 drivers/media/i2c/ov9650.c

a9fe8c23 Hugues Fruchet     2017-06-22  1612  	ov965x->set_params = __ov965x_set_params;
84a15ded Sylwester Nawrocki 2012-12-26  1613
a9fe8c23 Hugues Fruchet     2017-06-22  1614  	ov965x->frame_size = &ov965x->framesizes[0];
a9fe8c23 Hugues Fruchet     2017-06-22  1615  	ov965x_get_default_format(ov965x, &ov965x->format);
a9fe8c23 Hugues Fruchet     2017-06-22  1616
a9fe8c23 Hugues Fruchet     2017-06-22  1617  	if (ov965x->initialize_controls)
a9fe8c23 Hugues Fruchet     2017-06-22 @1618  		ret = ov965x->initialize_controls(ov965x);
84a15ded Sylwester Nawrocki 2012-12-26 @1619  		if (ret < 0)
84a15ded Sylwester Nawrocki 2012-12-26  1620  			goto err_ctrls;
84a15ded Sylwester Nawrocki 2012-12-26  1621
84a15ded Sylwester Nawrocki 2012-12-26  1622  	/* Update exposure time min/max to match frame format */

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
