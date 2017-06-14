From: Guodong Xu <guodong.xu@linaro.org>
Subject: Re: [PATCH v2 0/3] clk: hi3660: add more clocks and fix bugs
Date: Wed, 14 Jun 2017 11:20:58 +0800
Message-ID: <CAFGCpxxtrqCNXCM44XfoEON22jjKcCtNkA+bvOMU-38gXTkX6Q@mail.gmail.com>
References: <20170526073821.25971-1-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170526073821.25971-1-guodong.xu@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "chenjun (P)" <chenjun14@huawei.com>, zhongkaihua <zhongkaihua@huawei.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, Leo Yan <leo.yan@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi, Stephen, Mike

May I get your review opinion and comments on this patchset?

Thanks you.

-Guodong Xu

On Fri, May 26, 2017 at 3:38 PM, Guodong Xu <guodong.xu@linaro.org> wrote:
> This patchset adds more clocks for hi3660, video encoder/decoder, ISP. It
> includes also bug fixes.
>
> v2 update:
>  - added ISP clocks into patch 2.
>
> Chen Jun (2):
>   clk: hi3660: fix wrong parent name of clk_mux_sysbus
>   clk: hi3660: add clocks for video encoder, decoder and ISP
>
> Zhong Kaihua (1):
>   clk: hi3660: Set PPLL2 to 2880M
>
>  drivers/clk/hisilicon/clk-hi3660.c       | 50 +++++++++++++++++++++++++++++---
>  include/dt-bindings/clock/hi3660-clock.h | 17 +++++++++++
>  2 files changed, 63 insertions(+), 4 deletions(-)
>
> --
> 2.10.2
>
