From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v2 3/4] media: rockchip: Add the rkvdec driver
Date: Mon, 14 Oct 2019 03:08:22 +0800
Message-ID: <201910140242.ys3UylA0%lkp@intel.com>
References: <20191011093342.3471-4-boris.brezillon@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20191011093342.3471-4-boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, kbuild-all-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>, Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[cannot apply to v5.4-rc2 next-20191011]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Boris-Brezillon/media-rockchip-Add-the-rkvdec-driver/20191013-235029
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-43-g0ccb3b4-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/media/rockchip/vdec/rkvdec.c:498:22: sparse: sparse: symbol 'rkvdec_queue_ops' was not declared. Should it be static?
--
>> drivers/staging/media/rockchip/vdec/rkvdec-h264.c:698:19: sparse: sparse: symbol 'get_ref_buf' was not declared. Should it be static?
>> drivers/staging/media/rockchip/vdec/rkvdec.h:112:36: sparse: sparse: shift too big (32) for type int
>> drivers/staging/media/rockchip/vdec/rkvdec.h:115:21: sparse: sparse: shift too big (32) for type unsigned int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967268) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967276) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967277) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967279) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967282) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967285) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967286) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967290) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967295) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967269) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967270) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967279) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967288) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967289) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967290) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967291) for type int
>> drivers/staging/media/rockchip/vdec/rkvdec.h:112:36: sparse: sparse: shift too big (32) for type int
>> drivers/staging/media/rockchip/vdec/rkvdec.h:115:21: sparse: sparse: shift too big (32) for type unsigned int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967272) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967277) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967278) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967279) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967284) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967289) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967290) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967292) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967273) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967278) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967279) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967280) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967281) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967282) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967287) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967288) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:119:36: sparse: sparse: shift too big (32) for type int

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
