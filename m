From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 2/5] clk/samsung: add support for pll2550xx
Date: Mon, 10 Mar 2014 01:29:21 +0100
Message-ID: <531D0761.6070502@gmail.com>
References: <1393931558-23502-1-git-send-email-rahul.sharma@samsung.com> <1393931558-23502-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1393931558-23502-3-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: devicetree@vger.kernel.org

On 04.03.2014 12:12, Rahul Sharma wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>
> exynos5260 use pll2550xx and it has different bit fields
> for P,M,S values as compared to pll2550. Support for
> pll2550xx is added here.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>   drivers/clk/samsung/clk-pll.c |  107 +++++++++++++++++++++++++++++++++++++++++
>   drivers/clk/samsung/clk-pll.h |    1 +
>   2 files changed, 108 insertions(+)

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
