From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2 0/4] ARM: dts: Add LCD and PWM support for exynos4210-origen
Date: Tue, 18 Jun 2013 16:31:18 +0530
Message-ID: <CAK9yfHwO3aC28ao__4s_CWVzj5w3NDwK+Dn5cwvviH2K6Rpj9A@mail.gmail.com>
References: <1370932192-19365-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1370932192-19365-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Ping Kukjin.

On 11 June 2013 11:59, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> This series is based on for-next branch of Kukjin's tree.
> Tested on Origen board.
>
> Changes since v1:
> * Split LCD patch into LCD and PWM as suggested by Tomasz Figa.
> * Added all PWM output nodes to pinctrl dtsi file.
>
> Sachin Kamat (3):
>   ARM: dts: exynos4210: Add PWM related pinctrl entries
>   ARM: dts: exynos4210: Add LCD related pinctrl entries
>   ARM: dts: Add FIMD node to Origen4210 board
>
> Tushar Behera (1):
>   ARM: dts: Set BUCK7 as always on for Origen board
>
>  arch/arm/boot/dts/exynos4210-origen.dts   |   22 +++++++
>  arch/arm/boot/dts/exynos4210-pinctrl.dtsi |   89 +++++++++++++++++++++++++++++
>  2 files changed, 111 insertions(+)
>
> --
> 1.7.9.5
>



-- 
With warm regards,
Sachin
