From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 8/8] cpufreq: exynos: remove all exynos specific
 cpufreq driver support
Date: Wed, 14 May 2014 09:27:16 +0530
Message-ID: <CAKohpo=vz8Tn=-Lqw5s5PicFmbin3aaOPKVFpfF0-Xnm7QVDfA@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-9-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1400029876-5830-9-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Thomas P Abraham <thomas.ab@samsung.com>
List-Id: devicetree@vger.kernel.org

On 14 May 2014 06:41, Thomas Abraham <ta.omasab@gmail.com> wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
>
> Exynos4210, Exynos4x12 and Exynos5250 based platforms have switched over
> to use cpufreq-cpu0 driver for cpufreq functionality. So the Exynos
> specific cpufreq drivers for these platforms can be removed.
>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  drivers/cpufreq/Kconfig.arm          |   52 ---------
>  drivers/cpufreq/Makefile             |    4 -
>  drivers/cpufreq/exynos-cpufreq.c     |  209 ---------------------------------
>  drivers/cpufreq/exynos-cpufreq.h     |   91 ---------------
>  drivers/cpufreq/exynos4210-cpufreq.c |  157 -------------------------
>  drivers/cpufreq/exynos4x12-cpufreq.c |  211 ----------------------------------
>  drivers/cpufreq/exynos5250-cpufreq.c |  183 -----------------------------
>  7 files changed, 0 insertions(+), 907 deletions(-)

I *loved* this :)

Ack Ack Ack ...
