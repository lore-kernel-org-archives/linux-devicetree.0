From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 5/5] hisi: Consolidate the Kconfigs for the CLOCK_STUB and the
 MAILBOX
Date: Sat, 07 Apr 2018 05:56:54 -0700
Message-ID: <152310581432.180276.1794734900981310994@swboyd.mtv.corp.google.com>
References: <1522811675-12741-1-git-send-email-leo.yan@linaro.org>
 <1522811675-12741-6-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522811675-12741-6-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, Kaihua Zhong <zhongkaihua@huawei.com>, Leo Yan <leo.yan@linaro.org>, Tao Wang <kevin.wangtao@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Leo Yan (2018-04-03 20:14:35)
> From: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> The current defconfig is inconsistent as it selects the mailbox and
> the clock for the hi6220 and the hi3660 without having their Kconfigs
> making sure the dependencies are correct. It ends up when selecting
> different versions for the kernel (for example when git bisecting)
> those options disappear and they don't get back, leading to unexpected
> behaviors. In our case, the cpufreq driver does no longer work because
> the clock fails to initialize due to the clock stub and the mailbox
> missing.
> 
> In order to have the dependencies correctly set when defaulting, let's
> do the same as commit 3a49afb84ca074e ("clk: enable hi655x common clk
> automatically") where we select automatically the driver when the
> parent driver is selected. With sensible defaults in place, we can leave
> other choices for EXPERT.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

Although I wonder why it can't be split up?
