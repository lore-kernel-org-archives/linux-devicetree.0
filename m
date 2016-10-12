From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC V3 PATCH 7/7] arm64: configs: enable configs for
 msm899(2/4) basic support
Date: Wed, 12 Oct 2016 14:37:10 +0100
Message-ID: <20161012133710.GD21050@remoulade>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-8-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476265054-22511-8-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 12, 2016 at 02:37:34AM -0700, Jeremy McNicoll wrote:
> From: Jeremy McNicoll <jmcnicol@redhat.com>
> 
> Given the mimimal hardware support for msm899(2/4) currently.
> A few config options are needed to allow for continued
> development and booting.
> 
> The following are needed for continued development and
> booting:
>   -InitRD support
>   -8x74 pinctrl for serial support
>   -Enable Global Glock Controller (gcc)
> 
> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index fd2d74d..8601388 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -21,6 +21,7 @@ CONFIG_CGROUP_HUGETLB=y
>  # CONFIG_NET_NS is not set
>  CONFIG_SCHED_AUTOGROUP=y
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_BLK_DEV_RAM=y

We already had BLK_DEV_INITRD, which I presume was sufficient.

Why do we need BLK_DEV_RAM, too?

Thanks,
Mark
