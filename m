From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V4 1/3] ARM: dts: Add pmu sysreg node to Exynos5 dtsi file
Date: Wed, 30 Oct 2013 15:22:29 +0530
Message-ID: <CAK9yfHwHw7esBObW=VATrgweNwqAKu82DGp6miGP0-O7v76c9w@mail.gmail.com>
References: <1383126673-29033-1-git-send-email-l.krishna@samsung.com>
	<1383126673-29033-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1383126673-29033-2-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Wim Van Sebroeck <wim@iguana.be>, Tomasz Figa <t.figa@samsung.com>, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-watchdog@vger.kernel.org, cpgs@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Leela,

On 30 October 2013 15:21, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
> This patch adds pmusysreg node to Exynos5 dtsi file to handle PMU
> register accesses in a centralized way using syscon driver
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index e52b038..918e732 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -106,4 +106,9 @@
>                 #size-cells = <0>;
>                 status = "disabled";
>         };
> +
> +       pmu_sys_reg: pmusysreg@1004000 {
> +               compatible = "syscon";
> +               reg = <0x10040000 0x5000>;
> +       };
>  };

Had a look at this in a bit detail and found the following.
The register base address for this block on 5250 and 5420 as per the
TRM is 0x10050000.

Also, the binding document specifies the naming convention. According
to it this node
should like:

sys_reg: sysreg@10050000 {
           compatible = "samsung,exynos5-sysreg", "syscon";
           reg = <0x10050000 0x500>;
};

-- 
With warm regards,
Sachin
