From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v7 1/3] ARM: EXYNOS: initial board support for exynos5260 SoC
Date: Mon, 7 Apr 2014 14:08:17 +0530
Message-ID: <CAK9yfHzuVZh-RhfT+0tEehnF+aWnYHG=X2cv_E6uvzq2aS7UQg@mail.gmail.com>
References: <1396519224-18712-1-git-send-email-rahul.sharma@samsung.com>
	<1396519224-18712-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1396519224-18712-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Rahul,

On 3 April 2014 15:30, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>
> This patch add basic arch side support for exynos5260 SoC.
<snip>

> @@ -374,6 +374,7 @@ static char const *exynos_dt_compat[] __initconst = {
>         "samsung,exynos4412",
>         "samsung,exynos5",
>         "samsung,exynos5250",
> +       "samsung,exynos5260",

I don't think we should be adding this as we do not yet have any soc
specific quirk.
Compatibility to generic string, "samsung,exynos5"  should be sufficient.

-- 
With warm regards,
Sachin
