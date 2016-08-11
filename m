From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v10 3/4] ARM: dts: rockchip: add syscon-reboot-mode DT node
Date: Thu, 11 Aug 2016 20:23:11 +0200
Message-ID: <1904400.cBk6EHq0Yx@phil>
References: <1467811081-20700-1-git-send-email-andy.yan@rock-chips.com> <3833029.abRAq4Ccmc@diego> <5a7f6e2f-c7f5-6402-c0ed-364eda7da40e@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5a7f6e2f-c7f5-6402-c0ed-364eda7da40e-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Donnerstag, 21. Juli 2016, 16:28:40 CEST schrieb Andy Yan:
> On 2016年07月21日 06:01, Heiko Stübner wrote:
> > Am Mittwoch, 6. Juli 2016, 21:28:34 schrieb Andy Yan:
> >> Rockchip platform use a SYSCON mapped register store
> >> the reboot mode magic value for bootloader to use when
> >> system reboot. So add syscon-reboot-mode driver DT node
> >> for rk3xxx/rk3036/rk3288 based platform
> >> 
> >> Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > 
> > just as a heads up, with the driver part applied, this part looks good as
> > well. we're of course very close to the 4.7 release, so this will need to
> > wait until after 4.8-rc1 as I'll need to do a shared branch for the
> > rockchip_boot- mode.h . I can do the separation myself then , so there is
> > no need to resend anything.
> 
>      Got it, thanks!

I've split the first patch and applied the 3 resulting dts patches now:

https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.9-shared/soc-hdr&id=18a21e2c079a01805607bb474b3536a99620d162
https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.9-armsoc/dts32&id=b60ab70bbeced9a780ba297ffc555bc3a8ae6045
https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.9-armsoc/dts64&id=2e9e2863c7bee8ef828924cb0cad900776cb6d08

with some minor fixes, please double-check that I didn't mess up


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
