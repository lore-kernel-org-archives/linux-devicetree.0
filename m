From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH 0/5] clk/exynos5250: add clocks for hdmi subsystem
Date: Fri, 14 Jun 2013 15:39:30 +0530
Message-ID: <CALt3h7-9vMRx0XdxFvM4vkMOekbCwdaa_QP9Bj5Egk6vyZ5WYg@mail.gmail.com>
References: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene.kim@samsung.com>, sw0312.kim@samsung.com, inki.dae@samsung.com, sunil joshi <joshi@samsung.com>, Arun Kumar K <arun.kk@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,
Tested this series on snow board and is working fine.

Tested-by: Arun Kumar K <arun.kk@samsung.com>

Regards
Arun

On Mon, Jun 10, 2013 at 4:30 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Add clock changes for hdmi subsystem for exynos5250 SoC. These
> include addition of new clocks like mout_hdmi and smmu_tv, associating
> ID to clk_hdmiphy and some essential corrections.
>
> This set is based on kukjin's for-next branch at
> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
>
> Arun Kumar K (1):
>   clk/exynos5250: Fix HDMI clock number in documentation
>
> Rahul Sharma (4):
>   clk/exynos5250: add mout_hdmi mux clock for hdmi
>   clk/exynos5250: add sclk_hdmiphy in the list of special clocks
>   clk/exynos5250: add clock for tv sysmmu
>   clk/exynos5250: change parent to aclk200_disp1 for hdmi subsystem
>
>  .../devicetree/bindings/clock/exynos5250-clock.txt   |   12 +++++++++++-
>  drivers/clk/samsung/clk-exynos5250.c                 |   18 +++++++++++++-----
>  2 files changed, 24 insertions(+), 6 deletions(-)
>
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
