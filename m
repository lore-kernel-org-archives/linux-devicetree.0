From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: exynos5440: fix invalid use of sizeof in exynos5440_pinctrl_probe()
Date: Wed, 27 Mar 2013 22:24:59 +0100
Message-ID: <CACRpkdZ7Kmy+DXN2Xnt1K1hbZo5FTcHCKuDOmHU9zmJsNj_PQA@mail.gmail.com>
References: <CAPgLHd8yrZbidfvavg2nrO77zpx_NvKS7QDk=oDWD4T6Vb5+zQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd8yrZbidfvavg2nrO77zpx_NvKS7QDk=oDWD4T6Vb5+zQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 14, 2013 at 2:59 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> sizeof() when applied to a pointer typed expression gives the
> size of the pointer, not that of the pointed data.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/pinctrl/pinctrl-exynos5440.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied, unless the Exynos maintainer protest..

Yours,
Linus Walleij
