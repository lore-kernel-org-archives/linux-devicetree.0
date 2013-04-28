From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 11/13] ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
Date: Sun, 28 Apr 2013 12:22:31 -0700
Message-ID: <20130428192231.GB22332@quad.lixom.net>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
 <1366731994-7478-12-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1366731994-7478-12-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, tomasz.figa@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, ben-linux@fluff.org, thomas.abraham@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 23, 2013 at 05:46:32PM +0200, Tomasz Figa wrote:
> This patch extends exynos_init_time() function to handle Exynos4210 rev0
> SoC, which differs in availability of system timers and needs different
> clocksource initialization.
> 
> This makes it possible to use exynos_init_time() function as init_time
> callback for all Exynos-based boards, including Universal_C210, which
> originally had to use samsung_timer_init().
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

I didn't apply this one since I had massive conflicts caused by it. Can you
please resubmit on top of late/fixes?

Thanks,


-Olof
