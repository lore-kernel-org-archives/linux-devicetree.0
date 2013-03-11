From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/5] ARM: dts: exynos5250-arndale: Add node entry for
 gpio-buttons
Date: Mon, 11 Mar 2013 11:05:03 +0900
Message-ID: <04ff01ce1dfc$d830bd40$889237c0$%kim@samsung.com>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
 <8299289.2GSO3WcaG5@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <8299289.2GSO3WcaG5@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Tushar Behera' <tushar.behera@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, 'Thomas Abraham' <thomas.abraham@linaro.org>
List-Id: devicetree@vger.kernel.org

Tomasz Figa wrote:
> 
> Hi,
> 
> I'm wondering why Exynos5250 has not been migrated to use pinctrl yet.
> 
> Support for it in pinctrl-samsung driver has been already merged, but I
> don't see any pinctrl nodes in exynos5250.dtsi.
> 
> This is important because the legacy gpio-samsung support is going to be
> dropped, as it already happened in case of Exynos 4.
> 
> CC'ing Thomas Abraham as he might know something.
> 
Tushar and all,

I agree with Tomasz's opinion to support pinctrl instead of gpio on exynos5250
stuff.

Please re-submit with using pinctrl is in samsung tree.

If any problems, please let us know.

Thanks.

- Kukjin
