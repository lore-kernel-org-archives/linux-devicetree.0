From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v7 3/3] ARM: dts: add dts files for xyref5260 board
Date: Mon, 7 Apr 2014 14:10:15 +0530
Message-ID: <CAK9yfHwWh9sFivsg-P9wT6DXM2J3nYuHqzgfwuo_Go7S-vriVA@mail.gmail.com>
References: <1396519224-18712-1-git-send-email-rahul.sharma@samsung.com>
	<1396519224-18712-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1396519224-18712-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>
List-Id: devicetree@vger.kernel.org

On 3 April 2014 15:30, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> The patch adds the dts files for xyref5260 board which
> is based on Exynos5260 Evt0 sample.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---

> +/ {
> +       model = "SAMSUNG XYREF5260 EVT0 board based on EXYNOS5260";
> +       compatible = "samsung,xyref5260", "samsung,exynos5260";

"samsung,exynos5260" is OK here for future compatibility (if soc
specific quirk is required).
Please also add "samsung,exynos5" to compatible list.

-- 
With warm regards,
Sachin
