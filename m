From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V2 4/4] ARM: dts: exynos: add PMU registers addresses and
 mask bit to watchdog node
Date: Fri, 27 Sep 2013 22:17:04 +0530
Message-ID: <CAK9yfHyoLGU-Y9C+a9qB+ew3ixgx3NxJxWykQycnJBGBaXjXjA@mail.gmail.com>
References: <1380276986-24131-1-git-send-email-l.krishna@samsung.com>
	<1380276986-24131-5-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1380276986-24131-5-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Douglas Anderson <dianders@chromium.org>, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Leela,

On 27 September 2013 15:46, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
>         watchdog@101D0000 {
> -               compatible = "samsung,s3c2410-wdt";
> -               reg = <0x101D0000 0x100>;
> +               compatible = "samsung,s3c5250-wdt";
> +               reg = <0x101D0000 0x100>, <0x10040408 0x4>, <0x1004040c 0x4>;

nit: Please maintain consistency with the hex number case.
-- 
With warm regards,
Sachin
