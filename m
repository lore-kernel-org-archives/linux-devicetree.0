From: Zhou Zhu <zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/4] video: mmp: add device tree suppport
Date: Mon, 20 Jan 2014 09:58:57 +0800
Message-ID: <52DC82E1.7060209@marvell.com>
References: <1389698184-28761-1-git-send-email-zzhu3@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389698184-28761-1-git-send-email-zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Zhou Zhu <zzhu3-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chao Xie <cxie4-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Guoqing Li <ligq-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Tomi,
Looks there's no more comment now.
Would you please help to review this patch set and apply it also for 
3.14 if possible?
Thank you very much!

On 01/14/2014 07:16 PM, Zhou Zhu wrote:
> This patch set is to add device tree support for mmp_disp.
> patch 1/2 are to remove clk_name configure in mach_info before.
> patch 3/4 are to add device tree support.
>
> change of v2:
> add patch to remove config of clk_name in mach_info
> use phandle to get path.
> runtime decision of dt usage.
> clean up to use node name directly.
>
> Zhou Zhu (4):
>    arm: mmp: remove not used disp clk_name in ttc_dkb
>    video: mmp: no need to get clk_name from mach_info
>    video: mmp: add devm_mmp_get_path_by_phandle for DT
>    video: mmp: add device tree support
>
>   Documentation/devicetree/bindings/fb/mmp-disp.txt |   60 ++++++++
>   arch/arm/mach-mmp/ttc_dkb.c                       |    1 -
>   drivers/video/mmp/core.c                          |   35 +++++
>   drivers/video/mmp/fb/mmpfb.c                      |   73 ++++++----
>   drivers/video/mmp/hw/mmp_ctrl.c                   |  154 ++++++++++++++++-----
>   include/video/mmp_disp.h                          |    3 +-
>   6 files changed, 268 insertions(+), 58 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/fb/mmp-disp.txt
>


-- 
Thanks, -Zhou
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
