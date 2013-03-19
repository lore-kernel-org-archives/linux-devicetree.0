From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v8 4/4] ARM: dts: Add FIMD DT binding Documentation
Date: Tue, 19 Mar 2013 13:31:16 +0530
Message-ID: <CAK9yfHwzeMcHOTRWg_HF+aagPdqyeHADNPDJj4Dj0QnH8Fmjig@mail.gmail.com>
References: <1363676892-21296-1-git-send-email-vikas.sajjan@linaro.org>
	<1363676892-21296-5-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1363676892-21296-5-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org, joshi@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Vikas,

> +Example:
> +
> +SoC specific DT Entry:
> +
> +       fimd@11c00000 {
> +               compatible = "samsung,exynos4210-fimd";
> +               interrupt-parent = <&combiner>;
> +               reg = <0x11c00000 0x20000>;
> +               interrupt-names = "fifo", "vsync", "lcd_sys";
> +               interrupts = <11 0>, <11 1>, <11 2>;
> +               clocks = <&clock 140>, <&clock 283>;
> +               clock-names = "sclk_fimd", "fimd";

Now that you have added clock properties, you need to make a mention
about them too in the description above.

-- 
With warm regards,
Sachin
