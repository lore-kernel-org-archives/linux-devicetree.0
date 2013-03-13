From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v7 1/5] ARM: dts: Add FIMD node to exynos4
Date: Wed, 13 Mar 2013 16:02:05 +0530
Message-ID: <CAK9yfHzv-_9Xeg=WyYGwEkwRXAJvmyrowVBapXaMkj1=9YyAAw@mail.gmail.com>
References: <1363169371-310-1-git-send-email-vikas.sajjan@linaro.org>
	<1363169371-310-2-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1363169371-310-2-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

> +
> +       fimd: fimd@11c00000 {
> +               compatible = "samsung,exynos4210-fimd";
> +               interrupt-parent = <&combiner>;
> +               reg = <0x11c00000 0x20000>;
> +               interrupt-names = "fifo", "vsync", "lcd_sys";
> +               interrupts = <11 0>, <11 1>, <11 2>;

How about adding status = "disabled"; above.
Sorry for not pointing it out earlier.

-- 
With warm regards,
Sachin
